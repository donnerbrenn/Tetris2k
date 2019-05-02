
#include <SDL2/SDL.h>
#include "symbols.h"
#include <time.h>
#include "tetris_sng.h"

typedef unsigned char bool;
enum { false, true };

//defines
#define nFieldWidth 12
#define nFieldHeight 18
#define SCREEN_WIDTH 620
#define SCREEN_HEIGHT 960
#define sample_rate 96000

//tetris variables
static char pBuffer[nFieldHeight*nFieldWidth];
static char pBackBuffer[nFieldHeight*nFieldWidth];
static char nCurrentPiece=0;
static char nCurrentRotation=0;
static char nCurrentX = (nFieldWidth>>1)-2;
static char nCurrentY = 0;

static SDL_Window *window;
static SDL_Surface *screenSurface;
static SDL_AudioDeviceID audio_device;
static SDL_AudioSpec audio_spec;
static float phase[3]={0};
static float hertz[3]={0};
static char previous[3]={0};
static float vol[3]={0};
static int starts[3]={0};
static float wave=0;

static int song_clock=0;
static int score=0;
static int buffersize;
static unsigned short noteCnt;
static float freqs[96];

static char Rotate(char px, char py, char r);
static bool DoesPieceFit(int nTetromino, int nRotation, int nPosX, int nPosY);
static bool FallDown();
static bool ProcessEventsSDL();
static void drawCharacter(int number, int posX, int posY, int size);
static void drawScore(int value, int x, int y, int size);
static void drawBufferSDL();
static void placeTetromino(int piece,int x, int y, int rotation);
static void DropLine(int line);
static void InitPlayField();
static bool isLineComplete(int line);
static void redraw();
static void audio_callback(void *unused, uint8_t *byte_stream, int byte_stream_length);

int main();


void audio_callback(void *unused, uint8_t *byte_stream, int byte_stream_length)
{
    short *s_byte_stream = (short*)byte_stream;

    // generate three voices and mix them
    for (int i = 0; i < byte_stream_length>>1; i ++)
    {
        wave=.0f;
        static char notes[3]={0};

        if((song_clock)-(song_clock/speed*speed)==0)
        {
            for(int channel=0;channel<3;channel++)
            {
                notes[channel]=cpatterns[channel][(noteCnt>>7)%length][noteCnt%128];
                if(notes[channel]!=previous[channel]&&notes[channel]!=0)
                {
                    vol[channel]=.2f;
                    starts[channel]=song_clock;
                    previous[channel]=notes[channel];
                }
                else
                {
                    vol[channel]*=.8f;
                }
                if(notes[channel])
                {
                    hertz[channel]=freqs[(int)(notes[channel])];
                }
            }
            noteCnt++;
        }
        for(int j=1;j<3;j++)
        {
            phase[j]+=(2 * M_PI * hertz[j]/sample_rate);

            phase[j]-=(phase[j]>M_PI*2)?(M_PI*2):0;

            // if(phase[j]>(M_PI*2))
            // {
            //     phase[j]-=(M_PI*2);
            // }
            wave+=vol[j]-(vol[j] * phase[j]);
        }
        s_byte_stream[i] = (short)(8192*wave); // left channel
        song_clock++;
    }
}

char Rotate(char px, char py, char r)
{
    r=r-(r&252);
    if(!r)
        return (char)(py<<2)+px;
    else if(r==1)
        return (char)(12)+py-(char)(px<<2);
    else if(r==2)
        return (char)(15)-(char)(py<<2)-px;
    else
        return (char)(3)-py+(char)(px<<2);
}

bool DoesPieceFit(int nTetromino, int nRotation, int nPosX, int nPosY)
{
    for(int px=0;px<4;px++)
    {
        for(int py=0;py<4;py++)
        {
            // Get index into piece
            int pi = (int)(Rotate((char)(px),(char)(py),(char)(nRotation)));
            //Get index into field
            int fi = (nPosY+py)*nFieldWidth+(nPosX+px);
            if(nPosX + py >=0 && nPosY +py <nFieldHeight)
            {
                if(tetromino[nTetromino]&(1 << pi) && pBuffer[fi]!=0)
                {
                    return(false);
                }
            }
        }
    }
    return true;
}

bool FallDown()
{
    if(DoesPieceFit(nCurrentPiece,nCurrentRotation,nCurrentX,nCurrentY+1))
    {
        nCurrentY++;
    }
    else
    {
        nCurrentPiece=rand()%7;
        nCurrentRotation=0;
        nCurrentY = 0;
        nCurrentX = (nFieldWidth>>1)-2;

        if(!DoesPieceFit(nCurrentPiece,nCurrentRotation,nCurrentX,nCurrentY))
        {
            return(true);
        }
        score++;
        memcpy(pBuffer,pBackBuffer,nFieldHeight*nFieldWidth);
    }
    return(false);
}

bool ProcessEventsSDL()
{
    SDL_Event e;
    while(SDL_PollEvent(&e))
    {
        if(e.type==SDL_KEYDOWN)
        {
            char newRot=(char)(nCurrentRotation), newX=(char)(nCurrentX), newY=(char)(nCurrentY);
            char letter=(char)(e.key.keysym.sym);
            newRot+=(letter==(char)('w'));
            // newRot-=(letter==(char)('x'));
            newX-=(letter==(char)('a'));
            newX+=(letter==(char)('d'));
            newY+=(letter==(char)('s'));
            if(DoesPieceFit(nCurrentPiece,newRot,newX,newY))
            {
                if(newY!=nCurrentY)
                {
                    score++;
                }
                nCurrentRotation=newRot;
                nCurrentX=newX;
                nCurrentY=newY;
                return true;
            }
        }
        if (e.type==SDL_QUIT)
        {
            exit(0);
        }
    }
     return false;
}

void drawCharacter(int number, int posX, int posY, int size)
{
    unsigned short bit=(1) << 14;

    for(int x=0;x<3;x++)
        for(int y=0;y<5;y++)
        {
            int i=y*3+x;
            if(bit >> (i) & characters[number])
            {
                SDL_Rect rect=(SDL_Rect){x*size+posX,y*size+posY,size,size};
                SDL_FillRect(screenSurface,&rect,white);
            }
        }
}

void drawScore(int value, int x, int y, int size)
{
        char buffer[10];
        sprintf(buffer, "%d", value);
        int i=0;
        while(buffer[i])
        {
            drawCharacter(buffer[i]-48,x+size*4*i,y,size);
            i++;
        }
}

void drawBufferSDL()
{
    SDL_FillRect(screenSurface,NULL,black);
    for(int x=0;x<nFieldWidth;x++)
    {
        for(int y=0;y<nFieldHeight;y++)
        {
            int i=nFieldWidth*y+x;
            SDL_Rect rect=(SDL_Rect){x*50+10,y*50+10,48,48};
            SDL_FillRect(screenSurface,&rect,(int)(colors[(int)(pBackBuffer[i])]));
        }
    }
    drawScore(score,8,SCREEN_HEIGHT-20-(3<<3),7);
    SDL_UpdateWindowSurface(window);
}

void placeTetromino(int piece,int x, int y, int rotation)
{
    for(int px=0;px<4;px++)
    {
        for(int py=0;py<4;py++)
        {
            if((1 << (Rotate((char)(px),(char)(py),(char)(rotation)))) & tetromino[piece])
            {
                pBackBuffer[(y+py)*nFieldWidth+(x+px)]=(char)(piece+1);
            }
        }
    }
}

void DropLine(int line)
{
    memcpy(pBackBuffer+nFieldWidth,pBuffer,line*nFieldWidth);
    for(int x=0;x<nFieldWidth;x++)
    {
        pBackBuffer[x]=(x==0 || x == nFieldWidth-1) ? 1:0;
    }
    memcpy(pBuffer,pBackBuffer,nFieldWidth*nFieldHeight);
}

void InitPlayField()
{
    for(int x=0;x<nFieldWidth;x++)
    {
        for(int y=0;y<nFieldHeight;y++)
        {
            int i=nFieldWidth*y+x;
            pBackBuffer[i]=(!x || x == nFieldWidth-1 || y == nFieldHeight -1) ? 1:0;
            pBuffer[i]=pBackBuffer[i];
        }
    }
}


bool isLineComplete(int line)
{
    for(int px=0;px<nFieldWidth;px++)
    {
        if(!pBackBuffer[line*nFieldWidth+px])
        {
            return false;
        }
    }
    return true;
}


void redraw()
{
    unsigned short points=0;
    memcpy(pBackBuffer,pBuffer,nFieldHeight*nFieldWidth);

    for(int py=0;py<nFieldHeight-1;py++)
    {
        if(isLineComplete(py))
        {
            points+=25;
            DropLine(py);
        }
    }
    score+=points;
    placeTetromino(nCurrentPiece,nCurrentX,nCurrentY,nCurrentRotation);
    drawBufferSDL();
}


int main()
{
    freqs[0]=16.3516f;
    for(int i=1;i<96;i++)
    {
        freqs[i]=freqs[i-1]*1.05946f;
    }
    SDL_Init(SDL_INIT_EVERYTHING);

    SDL_AudioSpec want;
    want.freq = sample_rate;
    // request 16bit signed little-endian sample format.
    // want.format = AUDIO_S16LSB;
    want.channels = 1;
    want.samples = 1024;
    /*
     Tell SDL to call this function (audio_callback) that we have defined whenever there is an audiobuffer ready to be filled.
     */
    want.callback = audio_callback;
    audio_device = SDL_OpenAudioDevice(NULL, 0, &want, &audio_spec, 0);
    buffersize = audio_spec.samples;
    SDL_PauseAudioDevice(audio_device, false);// unpause audio.

    srand(time(NULL));
    int random=rand()%7;
    window=SDL_CreateWindow(NULL,SDL_WINDOWPOS_UNDEFINED,SDL_WINDOWPOS_UNDEFINED,SCREEN_WIDTH,SCREEN_HEIGHT,SDL_WINDOW_SHOWN);
    screenSurface = SDL_GetWindowSurface( window );
    while(1)
    {
        bool bGameOver=false;
        InitPlayField();
        redraw();
        unsigned int i=0;
        while(!bGameOver)
        {
            if(ProcessEventsSDL())
            {
                redraw();
            }
            SDL_Delay(8);
            if(i-(i&4294967168)==0)
            {
                if(FallDown())
                {
                    InitPlayField();
                    // drawScore(score,60,300,16);
                    SDL_UpdateWindowSurface(window);
                    SDL_Delay(4000);
                    score=0;
                    i=0;
                }
                redraw();
            }
            i++;
        }
    }
}

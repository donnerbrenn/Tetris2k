#include <SDL2/SDL.h>
#include "symbols.h"
#include <time.h>
#include "tetris_sng.h"
// #include "crt1.c"
typedef char bool;
enum { false, true };

//defines
#define F_PI 3.14159265359f
#define nFieldWidth 12
#define nFieldHeight 18
#define SCREEN_WIDTH 620
#define SCREEN_HEIGHT 960
#define sample_rate 96000
#define buffersize 512

//tetris variables
static char pBuffer[nFieldHeight*nFieldWidth];
static char pBackBuffer[nFieldWidth*nFieldHeight];
static uint32_t nCurrentPiece;
static char nCurrentRotation;
static char nCurrentX = (nFieldWidth>>1)-2;
static char nCurrentY;

static SDL_Window *window;
static SDL_Surface *screenSurface;
static float hertz[VOICES]={0};
static float vol[VOICES]={0};
static char previous[VOICES]={0};
static char notes[VOICES]={0};
static short starts[VOICES]={0};

static int song_clock=0;
static unsigned int score=0;
static int noteCnt;
static float freqs[70];
static unsigned int lines=0;

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
static void updateBuffer();
static void shuffle();

void shuffle()
{
    uint32_t result=7;
    while(result==7 || result==nCurrentPiece)
    {
        result=SDL_GetTicks();
        for(int i=17;i>2;i-=4)
        {
            result ^= result << i;
        }
        result&=7;
    }
    nCurrentPiece=result;
}

void updateBuffer()
{
    memcpy(pBuffer,pBackBuffer,nFieldHeight*nFieldWidth);
}

void audio_callback(void *unused, uint8_t *byte_stream, int byte_stream_length)
{
    // generate three voices and mix them
    for (int i = 0; i < byte_stream_length>>1; i++)
    {
        float wave=0;      
        if((song_clock)-(song_clock/SPEED*SPEED)==0)
        {
            for(int channel=0;channel<VOICES;channel++)
            {
                notes[channel]=cpatterns[channel][(noteCnt>>6)&7][noteCnt&63];
                if(notes[channel]!=previous[channel]&&notes[channel]!=0)
                {
                    vol[channel]=2;
                    starts[channel]=song_clock;
                    previous[channel]=notes[channel];
                }
                vol[channel]*=.9f;
                
                if(notes[channel])
                {
                    hertz[channel]=freqs[(int)(notes[channel])];
                }
            }
            noteCnt++;
        }
        for(int j=0;j<VOICES;j++)
        {
            float phase=SDL_sinf(hertz[j]*2.0f*F_PI*((float)song_clock/sample_rate));
            wave+=(vol[j] * (phase>0?1:-1))*2048;
        }
        ((short*)byte_stream)[i] = wave; 
        song_clock++;
    }
}

char Rotate(char px, char py, char r)
{
    r&=3;
    return (r==0)?(py<<2)+px:r==1?(12)+py-(px<<2):r==2?(15)-(py<<2)-px:(3)-py+(px<<2);
}

bool DoesPieceFit(int nTetromino, int nRotation, int nPosX, int nPosY)
{
    for(int px=0;px<4;px++)
    {
        for(int py=0;py<4;py++)
        {
            // Get index into piece
            short pi = (Rotate((px),(py),(nRotation)));
            //Get index into field
            short fi = (nPosY+py)*nFieldWidth+(nPosX+px);
            if(nPosX + py >=0 && nPosY + py <nFieldHeight)
            {
                if(characters[nTetromino]&(1 << pi) && pBuffer[fi]!=0)
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
        return(false);
    }
    else
    {
        shuffle();
        nCurrentRotation=0;
        nCurrentY= 0;
        nCurrentX = (nFieldWidth>>1)-2;
        score++;
        updateBuffer();
        return (!DoesPieceFit(nCurrentPiece,nCurrentRotation,nCurrentX,nCurrentY));
    }
}

bool ProcessEventsSDL()
{
    SDL_Event e;
    while(SDL_PollEvent(&e))
    {
        if(e.type==SDL_KEYDOWN)
        {
            char letter=(e.key.keysym.sym);
            char newRot=nCurrentRotation+(letter=='w');
            char newX=(nCurrentX)+(letter=='d')-(letter=='a');
            char newY=(nCurrentY)+(letter=='s');
            
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
    for(int x=0;x<3;x++)
        for(int y=0;y<5;y++)
        {
            int i=y*3+x;
            if(16384 >> (i) & characters[number])
            {
                SDL_Rect rect=(SDL_Rect){x*size+posX,y*size+posY,size,size};
                SDL_FillRect(screenSurface,&rect,white);
            }
        }
}

void drawScore(int value, int x, int y, int size)
{
        char buffer[15];
        SDL_uitoa(value,&buffer[0],10);
        int i=0;
        while(buffer[i])
        {
            drawCharacter(buffer[i]-41,x+size*4*i,y,size);
            i++;
        }
}

void drawBufferSDL()
{
    SDL_FillRect(screenSurface,NULL,0x12121212);
    drawScore(score,8,SCREEN_HEIGHT-45,8);
    drawScore(lines,400,SCREEN_HEIGHT-45,8);
    for(int x=0;x<nFieldWidth;x++)
    {
        for(int y=0;y<nFieldHeight;y++)
        {
            int i=nFieldWidth*y+x;
            SDL_Rect rect=(SDL_Rect){x*50+10,y*50+10,48,48};
            SDL_FillRect(screenSurface,&rect,(int)(colors[(int)(pBackBuffer[i])]));
            
        }
    }
    SDL_UpdateWindowSurface(window);
}

void placeTetromino(int piece,int x, int y, int rotation)
{
    for(int px=0;px<4;px++)
    {
        for(int py=0;py<4;py++)
        {
            if((1 << (Rotate((px),(py),(rotation)))) & characters[piece])
            {
                pBackBuffer[(y+py)*nFieldWidth+(x+px)]=(piece+1);
            }
        }
    }
}

void DropLine(int line)
{
    memcpy(pBackBuffer+nFieldWidth,pBuffer,line*nFieldWidth);
    for(int x=0;x<nFieldWidth;x++)
    {
        pBackBuffer[x]=(x==0 || x == nFieldWidth-1) ? 9:0;
    }
    updateBuffer();
}

void InitPlayField()
{
    for(int x=0;x<nFieldWidth;x++)
    {
        for(int y=0;y<nFieldHeight;y++)
        {
            int i=nFieldWidth*y+x;
            pBackBuffer[i]=(!x || x == nFieldWidth-1 || y == nFieldHeight -1) ? 9:0;
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
    lines++;
    return true;
}

void redraw()
{
    int multi=0;
    memcpy(pBackBuffer,pBuffer,nFieldHeight*nFieldWidth);

    for(int py=0;py<nFieldHeight-1;py++)
    {
        if(isLineComplete(py))
        {
            multi+=25;;
            score+=multi;
            DropLine(py);
        }
    }
    placeTetromino(nCurrentPiece,nCurrentX,nCurrentY,nCurrentRotation);
    drawBufferSDL();
}

int main()
{
    // asm volatile("sub $8, %rsp\n");
    freqs[0]=16.3516f;
    for(int i=1;i<70;i++)
    {
        freqs[i]=freqs[i-1]*1.05946f;
    }
    SDL_Init(SDL_INIT_EVERYTHING);

    SDL_AudioSpec want;

     want.freq = sample_rate;
    // request 16bit signed little-endian sample format.
    // want.format = AUDIO_S16LSB;
     want.channels = 1;
     want.samples = buffersize;
    /*
     Tell SDL to call this function (audio_callback) that we have defined whenever there is an audiobuffer ready to be filled.
     */
    want.callback = audio_callback;
     
    SDL_PauseAudioDevice(SDL_OpenAudioDevice(NULL, 0, &want, NULL, 0), false);// unpause audio.


    window=SDL_CreateWindow(NULL,0,0,SCREEN_WIDTH,SCREEN_HEIGHT,0);
    screenSurface = SDL_GetWindowSurface( window );
    shuffle();

    bool bGameOver=false;
    InitPlayField();
    char i=0;

    while(true)
    {
        while(!bGameOver)
        {
            if(ProcessEventsSDL())
            {
                redraw();
            }
            SDL_Delay(15);
            if(!(i&31))
            {
                if(FallDown())
                {
                    InitPlayField();
                    // drawScore(score,60,300,16);
                    SDL_UpdateWindowSurface(window);
                    SDL_Delay(4000);
                    score=0;
                    lines=0;
                    i=0;
                }
            }
            redraw();
            i++;
        }
    }
}

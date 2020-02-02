#include <SDL2/SDL.h>
#include "symbols.h"
#include "tetris_sng.h"
#include <stdbool.h>
#include <stdint.h>




//defines
// #define DEBUG
#define F_PI 3.14159265359f
#define nFieldWidth 12
#define nFieldHeight 18
#define SCREEN_WIDTH 620
#define SCREEN_HEIGHT 960
#define sample_rate 44100
#define buffersize 1024
#define FONTSIZE 8

//tetris variables
static char pBuffer[nFieldHeight*nFieldWidth]={0};
static char pBackBuffer[nFieldWidth*nFieldHeight]={0};
static char nCurrentRotation=0;
static char nCurrentX = (nFieldWidth>>1)-2;
static char nCurrentY=0;
static int score=0;
static int nCurrentPiece=0;
static SDL_Window *window;
static SDL_Surface *screenSurface=NULL;


static void ProcessEventsSDL() ;
static void drawScore();
static void drawBufferSDL();
static void placeTetromino(int piece,int x, int y, int rotation);
static void DropLine(int line);
static void InitPlayField();
static void redraw();
static void audio_callback(void *unused, uint8_t *byte_stream, int byte_stream_length);
static void updateBuffer();
static void shuffle();
static void initSDL();
static bool FallDown();
static bool isLineComplete(int line);
static float getFrq(int note);
static void drawRect(int x, int y, int w, int col);
static void _memcpy(void* dest, void* src, size_t numbytes);
static void _memset(void* dest,char val,size_t numbytes);
static void _exit() ;
inline char Rotate(char px, char py, char r);
inline bool DoesPieceFit(int nTetromino, int nRotation, int nPosX, int nPosY);
inline void drawcharacter(int num, int posX,int posY);

void _memset(void* dest,char val,size_t numbytes)
{
    for(size_t i=0;i<numbytes;i++)
    {
        ((char*)dest)[i]=val;
    }
}

void _memcpy(void* dest, void* src, size_t numbytes) 
{
	for(size_t i=0;i<numbytes;i++)
    {
        ((char*)dest)[i]=((char*)src)[i];
    }
}


void drawRect(int x, int y, int w, int col)
{
    SDL_Rect rect=(SDL_Rect){x,y,w,w};
    SDL_FillRect(screenSurface,&rect,col);
}

void _exit()
{
    // SDL_DestroyWindow(window);
    asm volatile(".intel_syntax noprefix");
    asm volatile("push 231"); //exit_group
    asm volatile("pop rax");
    asm volatile("xor edi, edi");
    asm volatile("syscall");
    asm volatile(".att_syntax prefix");
    __builtin_unreachable();
}


void shuffle()
{
    int result=7;
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
    _memcpy(pBuffer,pBackBuffer,nFieldHeight*nFieldWidth); 
}

float getFrq(int note)
{
    float freq=16.3516f;
    for(int i=1;i<note;++i)
    {
        freq*=1.05946f;
    }
    return freq;
}

void audio_callback(void *unused, Uint8 *byte_stream, int byte_stream_length)
{
    // static float wave;   
    static float hertz[VOICES];
    static int song_clock=0;
    static int noteCnt;
    static int counter[VOICES];
    static int temp;
    short *stream=((short*)byte_stream);
    static short vol[VOICES];
    static char previous[VOICES];
    static char notes[VOICES];
    
    
    
    // generate three voices and mix them
    for (int i = 0; i < byte_stream_length>>1; ++i)
    {
        stream[i]=0;
        if((song_clock)-(song_clock/SPEED*SPEED)==0)
        {
            for(int channel=0;channel<VOICES;++channel)
            {
                notes[channel]=cpatterns[channel][(noteCnt>>6)&7][noteCnt&63];
                if(notes[channel]!=previous[channel]&&notes[channel]!=0)
                {
                    vol[channel]=512;
                    previous[channel]=notes[channel];
                }
                vol[channel]-=50;
                
                if(notes[channel])
                {
                    hertz[channel]=getFrq(notes[channel]);
                }
            }
            noteCnt++;
        }
        
        for(int j=0;j<VOICES;++j)
        {
            temp=sample_rate/hertz[j]; 
            counter[j]=(counter[j]>=temp)?0:counter[j];
            temp>>=1;
            if(vol[j]>0)
                stream[i]+=(((++counter[j]<=temp)?1:-1))*vol[j];
        }
        ++song_clock;
    }
}

char Rotate(char px, char py, char r)
{
    r&=3;
    return (r==0)?(py<<2)+px:r==1?12+py-(px<<2):r==2?15-(py<<2)-px:3-py+(px<<2);

}

bool DoesPieceFit(int nTetromino, int nRotation, int nPosX, int nPosY)
{
    for(int px=0;px<4;++px)
    {
        for(int py=0;py<4;++py)
        {
            //Get index into piece
            short pi = (Rotate((px),(py),(nRotation)));
            //Get index into field
            short fi = (nPosY+py)*nFieldWidth+(nPosX+px);
            if(nPosX + py >=0 && nPosY + py <nFieldHeight && characters[nTetromino]&(1 << pi) && pBuffer[fi]!=0)
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
        ++nCurrentY;
        return(false);
    }
    else
    {
        shuffle();
        nCurrentRotation=0;
        nCurrentY= 0;
        nCurrentX = (nFieldWidth>>1)-2;
        updateBuffer();
        return (!DoesPieceFit(nCurrentPiece,nCurrentRotation,nCurrentX,nCurrentY));
    }
}

void ProcessEventsSDL()
{
    SDL_Event e;
    while(SDL_PollEvent(&e))
    {
        if (e.type==SDL_QUIT)
        {
            _exit();
        }
        if(e.type==SDL_KEYDOWN)
        {
            char key=(e.key.keysym.sym);
            char newRot=nCurrentRotation+(key=='w');
            char newX=(nCurrentX)+(key=='d')-(key=='a');
            char newY=(nCurrentY)+(key=='s');
            
            if(DoesPieceFit(nCurrentPiece,newRot,newX,newY))
            {
                if(newY!=nCurrentY)
                {
                    score++;
                }
                nCurrentRotation=newRot;
                nCurrentX=newX;
                nCurrentY=newY;
            }
        }

    }
}

static void drawcharacter(int number, int posX,int posY)
{
        for(int y=0;y<5;++y)
            for(int x=0;x<3;++x)
            {
                int i=y*3+x;
                if(16384 >> (i) & characters[number])
                {
                    drawRect(x*FONTSIZE+posX,y*FONTSIZE+posY,FONTSIZE,white);
                }
            }
}

void drawScore()
{
    static char buffer[15];
    SDL_itoa(score,buffer,10);
    int i=0;
    while(buffer[i])
    {
        drawcharacter(buffer[i]-41,FONTSIZE+FONTSIZE*4*i,SCREEN_HEIGHT-45);
        ++i;
    }
}

void drawBufferSDL()
{
    SDL_FillRect(screenSurface,NULL,0x12121212);
     drawScore();

    for(int y=0;y<nFieldHeight;++y)
    {
        for(int x=0;x<nFieldWidth;++x)
        {
            int i=nFieldWidth*y+x;

            drawRect(x*50+10,y*50+10,48,(int)(colors[(int)(pBackBuffer[i])]));
            if(pBackBuffer[i]<9)
                drawRect(x*50+13,y*50+13,42,(int)(0));
        }
    }
    SDL_UpdateWindowSurface(window);
}

void placeTetromino(int piece,int x, int y, int rotation)
{
    for(int py=0;py<4;++py)
    {
        for(int px=0;px<4;++px)
        {
            if((1 << (Rotate((px),(py),(rotation)))) & characters[piece])
            {
                int i=(y+py)*nFieldWidth+(x+px);
                pBackBuffer[i]=(piece+1);
            }
        }
    }
}

void DropLine(int line)
{
    for(line=(line+1)*nFieldWidth;line>12;--line)
    {
        pBackBuffer[line]=pBackBuffer[line-nFieldWidth];
    }
    _memset(pBackBuffer+1,0,9);
    updateBuffer();
}

void InitPlayField()
{
    _memset(pBackBuffer,9,nFieldWidth*nFieldHeight);

    for(int y=0;y<nFieldHeight-1;y++)
    {
        _memset(pBackBuffer+nFieldWidth*y+1,0,10);
    }
    updateBuffer();
}

bool isLineComplete(int line)
{
    for(int px=0;px<nFieldWidth;++px)
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
    int multi=0;
    _memcpy(pBackBuffer,pBuffer,nFieldHeight*nFieldWidth);

    for(int py=0;py<nFieldHeight-1;++py)
    {
        if(isLineComplete(py))
        {
            multi+=25;
            score+=25;
            DropLine(py);
        }
    }
    placeTetromino(nCurrentPiece,nCurrentX,nCurrentY,nCurrentRotation);
    drawBufferSDL();
}

void initSDL()
{
    SDL_AudioSpec want;           
    want.freq = sample_rate;
    want.format = AUDIO_S16SYS;
    want.channels=1;
    want.samples = buffersize;
    want.callback = audio_callback;    
    SDL_OpenAudio((&want), NULL);
    SDL_PauseAudio(0);

    window=SDL_CreateWindow(NULL,0,0,SCREEN_WIDTH,SCREEN_HEIGHT,0);
    screenSurface = SDL_GetWindowSurface( window );
    shuffle();
    InitPlayField();
}


extern void _start()
{
    asm volatile("sub $8, %rsp\n");
    static int i=0;
    initSDL();

    while(true)
    {
        ProcessEventsSDL();
        redraw();
        SDL_Delay(20);
        if(!(i&15))
        {
            if(FallDown())
            {
                InitPlayField();
                SDL_Delay(2000);
                score=0;
                i=0;
            }
        }
        ++i;
    }
}
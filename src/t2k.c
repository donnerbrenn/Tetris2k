#include "t2k.h"
#include "sys.h"

void _memset(void* dest,char val,size_t numbytes)
{
    while(numbytes)
    {
        --numbytes;
        ((char*)dest)[numbytes]=val;
    }
}

void _memcpy(void* dest, void* src, size_t numbytes) 
{
    while(numbytes)
    {
        --numbytes;
        ((char*)dest)[numbytes]=((char*)src)[numbytes];
    }
}

void drawRect(int x, int y, int w, int col)
{
    static SDL_Rect rect;
    rect=(SDL_Rect){x,y,w,w};
    SDL_FillRect(screenSurface,&rect,col);
}

void shuffle()
{
    unsigned char result=-1;
    while(result>6||result==nCurrentPiece)
    {
        SYS_getrandom(&result,1,1);
    } 
    nCurrentPiece=result;
}

#ifdef SYNTH
float getFrq(int note)
{
    float freq=61.7337f;
    do
    {
        freq*=1.05946f;
    } while(--note);
    return freq;
}

void audio_callback(void *unused, unsigned char *byte_stream, int byte_stream_length)
{
    short *stream=(short*)byte_stream;
    static short vol[VOICES];
    static unsigned int note;
    static unsigned int song_clock;
    static unsigned int counter[VOICES];
    static unsigned int previous[VOICES];
    static float hertz[VOICES];
    static float freq;

    for (int i = 0; i < byte_stream_length>>1; ++i)
    {
        unsigned int pos=song_clock/(SAMPLERATE/SPEED);
        unsigned int current_pattern=(pos>>6)&7;
        unsigned int current_note=pos&63;

        stream[i]=0;
        for(int j=0;j<VOICES;j++)
        {
            note=cpatterns[j][(int)order[current_pattern]][current_note];
            if((previous[j]!=pos)&&note)
            {
                hertz[j]=getFrq(note);
                previous[j]=pos;
                vol[j]=8192;
            }
            if(!(song_clock&7))
            {
                vol[j]--;
            }
            if(vol[j]>=0)
            {
                freq=SAMPLERATE/hertz[j];
                counter[j]=(counter[j]>=freq)?0:counter[j];
                freq*=j==1?.5f:.7f;
                stream[i]+=(counter[j]<=freq)?vol[j]:-vol[j];
                counter[j]++;
            }
        }
        song_clock++;
    }
}
#endif

#ifdef SCORE

void drawScore(int value, int x)
{
    static char buffer[15];
    SDL_itoa(value,buffer,10);
    for(int i=0;buffer[i];i++)
    {
        drawcharacter((buffer[i]-48),((FONTSIZE<<2)*i)+x,SCREEN_HEIGHT-45);
    }
}


void drawcharacter(int num, int posX,int posY)
{
    for(int y=0;y<5;++y)
        for(int x=0;x<3;++x)
        {
            int i=y*3+x;
            if(16384 >> (i) & characters2[num])
            {
                drawRect(x*FONTSIZE+posX,y*FONTSIZE+posY,FONTSIZE,white);
            }
        }
}
#endif

char getRotatedIndex(char px, char py, char r)
{  
    do
    {
        char x=12+py-(px<<2);
        px=x&3;
        py=x>>2;
        //    asm volatile(
        //     // "addb %[py],%1;\n\t"
        //     "movb $4, %%bl\n\t"
        //     "divb %%bl\n\t"
        //     "movb %%ah, %[px]\n\t"
        //     : [px] "=r" (px), [py] "=r" (py)
        //     : "r" (x)
        // );
        // printf("x:%i px:%i py:%i\n",x,px,py);
        // asm volatile("push $231;pop %rax;syscall");
        // printf("x:%i px:%i py:%i\n",x,px,py);
        // exit(0);

    } while(--r);
    return (py<<2)+px;
}

bool doesPieceFit(int nTetromino, int nRotation, int nPosX, int nPosY)
{
    for(int px=0;px<4;++px)
    {
        for(int py=0;py<4;++py)
        {
            //Get index into piece
            int pi = (getRotatedIndex((px),(py),(nRotation)));
            //Get index into field
            int fi = (nPosY+py)*FIELDWIDTH+(nPosX+px);
            if(characters[nTetromino]&(1 << pi) && pBuffer[fi])
            {
                return(false);
            }
        }
    }
    return true;
}

bool fallDown()
{
    if(doesPieceFit(nCurrentPiece,nCurrentRotation,nCurrentX,nCurrentY+1))
    {
        ++nCurrentY;
        return(false);
    }
    else
    {
        initStone();
        return (!doesPieceFit(nCurrentPiece,nCurrentRotation,nCurrentX,nCurrentY));
    }
}

void processEventsSDL()
{
    SDL_Event e;
    static bool handlekeys;
    static char key;
    static char newRot;
    static char newX;
    static char newY;
    handlekeys=true;
    while(SDL_PollEvent(&e))
    {
        if (e.type==SDL_QUIT)
        {
            // SYS_exit_group(0);
            asm volatile("push $231;pop %rax;syscall");
        }
        if(e.type==SDL_KEYDOWN&&handlekeys)
        {
            handlekeys=false;
            key=(e.key.keysym.sym);
            newRot=nCurrentRotation+(key=='w');
            newX=(nCurrentX)+(key=='d')-(key=='a');
            newY=(nCurrentY)+(key=='s');
            
            if(doesPieceFit(nCurrentPiece,newRot,newX,newY))
            {
                #ifdef SCORE
                if(newY!=nCurrentY)
                {
                    score++;
                }
                #endif
                nCurrentRotation=newRot;
                nCurrentX=newX;
                nCurrentY=newY;
            }
        }

    }
}

void updateDisplay()
{
    SDL_FillRect(screenSurface,NULL,0x12121212);
    #ifdef SCORE
     drawScore(score,10);
     drawScore(lines,200);
     #endif
     static int i;
    for(int y=0;y<FIELDHEIGHT;++y)
    {
        for(int x=0;x<FIELDWIDTH;++x)
        {
            i=FIELDWIDTH*y+x;
            drawRect(x*50+10,y*50+10,48,(int)(colors[(int)(pBackBuffer[i])]));
            #ifdef DECO
            if(pBackBuffer[i]!=9)
            {
                drawRect(x*50+12,y*50+12,44,(int)(0));
                drawRect(x*50+18,y*50+18,32,(int)(colors[(int)(pBackBuffer[i])]));
            }
            #endif
        }
    }
    SDL_UpdateWindowSurface(window);
}

void placeTetromino(int piece,int x, int y, int rotation)
{
    static int i;
    for(int py=0;py<4;++py)
    {
        for(int px=0;px<4;++px)
        {
            if(1 << getRotatedIndex(px,py,rotation) & characters[piece])
            {
                i=(y+py)*FIELDWIDTH+(x+px);
                pBackBuffer[i]=(piece+1);
            }
        }
    }
}

void dropLine(int line)
{
    for(line=(line+1)*FIELDWIDTH;line>12;--line)
    {
        pBackBuffer[line]=pBackBuffer[line-FIELDWIDTH];
    }
    // _memcpy(pBackBuffer+FIELDWIDTH,pBackBuffer,line*FIELDWIDTH);
    _memset(pBackBuffer+1,0,10);
    initStone();
}

void initStone()
{
        shuffle();
        nCurrentRotation=0;
        nCurrentY=0;
        nCurrentX=(FIELDWIDTH>>2)+1;
        runtime=0;
        _memcpy(pBuffer,pBackBuffer,FIELDHEIGHT*FIELDWIDTH); 
}

void initGame()
{
    #ifdef SCORE
    score=0;
    lines=0;
    #endif
    _memset(pBackBuffer,9,FIELDWIDTH*FIELDHEIGHT);
    for(int y=0;y<FIELDHEIGHT-1;y++)
    {
        _memset(pBackBuffer+FIELDWIDTH*y+1,0,10);
    }
    initStone();
}

bool isLineComplete(int line)
{
    for(int px=0;px<FIELDWIDTH;++px)
    {
        if(!pBackBuffer[line*FIELDWIDTH+px])
        {
            return false;
        }
    }
    return true;
}

void updateGame()
{
    #ifdef SCORE
    static int multi=0;
    #endif
    _memcpy(pBackBuffer,pBuffer,FIELDHEIGHT*FIELDWIDTH);
    for(int py=0;py<FIELDHEIGHT-1;++py)
    {
        if(isLineComplete(py))
        {
            #ifdef SCORE
            lines++;
            multi+=25;
            score+=multi;
            #endif
            dropLine(py);
        }
    }
    placeTetromino(nCurrentPiece,nCurrentX,nCurrentY,nCurrentRotation);
    SDL_Delay(15);
}

void initSDL()
{
    #ifdef SYNTH

    SDL_AudioSpec want;
    want.freq = SAMPLERATE;
    want.format = AUDIO_S16SYS;
    want.channels=1;
    want.samples = BUFFERSIZE;
    want.callback = audio_callback;    
    SDL_OpenAudio((&want), NULL);
    SDL_PauseAudio(0);             
    #else
    SDL_Init(SDL_INIT_EVERYTHING);  
    #endif

    window=SDL_CreateWindow(NULL,0,0,SCREEN_WIDTH,SCREEN_HEIGHT,0);
    screenSurface = SDL_GetWindowSurface(window);
}


__attribute__((__externally_visible__, __section__(".text.startup._start"), __noreturn__))
extern void _start()
{    
    initGame();
    initSDL();
    for(;;)
    {
        updateGame(); 
        updateDisplay();     
        if((runtime&15)==0)
        {
            if(fallDown())
            {
                initGame();
                SDL_Delay(2000);
            }
        }
        runtime++;
        processEventsSDL();
    }
}
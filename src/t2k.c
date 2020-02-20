#include "tetris.h"
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
    rect=(SDL_Rect){x,y,w,w};
    SDL_FillRect(screenSurface,&rect,col);
}


void shuffle()
{
    int result=7;
    while(result==7||result==nCurrentPiece)
    {
        result=SDL_GetTicks()&7;
    }
    nCurrentPiece=result;
}

void updateBuffer()
{
    _memcpy(pBuffer,pBackBuffer,FIELDHEIGHT*FIELDWIDTH); 
}

#ifdef FULL
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

    stream=((short*)byte_stream);

    // generate three voices and mix them
    for (int i = 0; i < byte_stream_length>>1; ++i)
    {   
        if((song_clock)-(song_clock/SPEED*SPEED)==0)
        {
            for(int channel=0;channel<VOICES;++channel)
            {
                notes[channel]=cpatterns[channel][order[(noteCnt>>6)&7]][noteCnt&63];
                if(notes[channel]!=previous[channel]&&notes[channel])
                {
                    vol[channel]=1024;
                    previous[channel]=notes[channel];
                }
                vol[channel]-=100;
               
                if(notes[channel])
                {
                    hertz[channel]=getFrq(notes[channel]);
                }
            }
            noteCnt++;
        }
        stream[i]=0;
        for(int j=0;j<VOICES;++j)
        {
            if(vol[j]>0)
            {
                freq=SAMPLERATE/hertz[j]; 
                counter[j]=(counter[j]>=freq)?0:counter[j];
                // freq>>=j-(j>>1)+1;
                // freq*=vol[j]/512.0/16;
                freq>>=2;
                stream[i]+=(++counter[j]<=freq)?vol[j]:-vol[j];
            }
        }
        ++song_clock;
    }
}

void drawScore(int value, int x)
{
    static char buffer[15];
    SDL_itoa(value,buffer,10);
    int i=0;
    while(buffer[i])
    {
        drawcharacter(buffer[i++]-'0'+1,((FONTSIZE<<2)*i)+x,SCREEN_HEIGHT-45);
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

char Rotate(char px, char py, char r)
{  
    // r&=3;
    char x;
    while(r)
    {
        x=12+py-(px<<2);
        px=x&3;
        py=x>>2;
        --r;
    }
    return (py<<2)+px;
}

bool DoesPieceFit(int nTetromino, int nRotation, int nPosX, int nPosY)
{
    for(int px=0;px<4;++px)
    {
        for(int py=0;py<4;++py)
        {
            //Get index into piece
            int pi = (Rotate((px),(py),(nRotation)));
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

bool FallDown()
{
    if(DoesPieceFit(nCurrentPiece,nCurrentRotation,nCurrentX,nCurrentY+1))
    {
        ++nCurrentY;
        return(false);
    }
    else
    {
        initStone();
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
            // SDL_DestroyWindow(window);
            asm volatile("push $231;pop %rax;xorl %edi,%edi;syscall");
            __builtin_unreachable();
        }
        if(e.type==SDL_KEYDOWN&&handlekeys)
        {
            char key=(e.key.keysym.sym);
            char newRot=nCurrentRotation+(key=='w');
            char newX=(nCurrentX)+(key=='d')-(key=='a');
            char newY=(nCurrentY)+(key=='s');
            
            if(DoesPieceFit(nCurrentPiece,newRot,newX,newY))
            {
                #ifdef FULL
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
    handlekeys=true;
}

void updateDisplay()
{
    SDL_FillRect(screenSurface,NULL,0x12121212);
    // drawRect(0,0,SCREEN_HEIGHT,0x12121212);
    #ifdef FULL
     drawScore(score,10);
     drawScore(hiscore,400);
     #endif

    for(int y=0;y<FIELDHEIGHT;++y)
    {
        for(int x=0;x<FIELDWIDTH;++x)
        {
            int i=FIELDWIDTH*y+x;
            drawRect(x*50+10,y*50+10,48,(int)(colors[(int)(pBackBuffer[i])]));

            // if(pBackBuffer[i]!=9)
            //     drawRect(x*50+15,y*50+15,38,(int)(0));
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
                int i=(y+py)*FIELDWIDTH+(x+px);
                pBackBuffer[i]=(piece+1);
            }
        }
    }
}

void DropLine(int line)
{
    for(line=(++line)*FIELDWIDTH;line>12;--line)
    {
        pBackBuffer[line]=pBackBuffer[line-FIELDWIDTH];
    }
    _memset(pBackBuffer+1,0,9);
    initStone();
}

void initStone()
{
        shuffle();
        nCurrentRotation=0;
        nCurrentY= 0;
        nCurrentX = (FIELDWIDTH>>2)+1;
        runtime=0;
        updateBuffer();
}

void initGame()
{
    #ifdef FULL
    score=0;
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
    #ifdef FULL
    int multi=0;
    #endif
    _memcpy(pBackBuffer,pBuffer,FIELDHEIGHT*FIELDWIDTH);
    for(int py=0;py<FIELDHEIGHT-1;++py)
    {
        if(isLineComplete(py))
        {
            #ifdef FULL
            multi+=25;
            score+=multi;
            #endif
            DropLine(py);
        }
    }
    #ifdef FULL
    hiscore=score>hiscore?score:hiscore;
    #endif
    placeTetromino(nCurrentPiece,nCurrentX,nCurrentY,nCurrentRotation);
    SDL_Delay(15);
}

void initSDL()
{
    #ifndef FULL
     SDL_Init(SDL_INIT_EVERYTHING);              
    #else
    SDL_AudioSpec want; 
    want.freq = SAMPLERATE;
    want.format = AUDIO_S16SYS;
    want.channels=1;
    want.samples = BUFFERSIZE;
    want.callback = audio_callback;    
    SDL_OpenAudio((&want), NULL);
    SDL_PauseAudio(0);
    #endif

    window=SDL_CreateWindow(NULL,0,0,SCREEN_WIDTH,SCREEN_HEIGHT,0);
    screenSurface = SDL_GetWindowSurface(window);
}

void _start()
{
    asm volatile("sub $8, %rsp");
    handlekeys=true;
    initGame();
    initSDL();
    while(true)
    {
        updateGame(); 
        updateDisplay();     
        if((runtime&15)==0)
        {
            if(FallDown())
            {
                initGame();
                SDL_Delay(2000);
                handlekeys=false;
            }
        }
        runtime++;
        ProcessEventsSDL();
    }
     __builtin_unreachable();
}
#include <SDL2/SDL.h>
#include <time.h>
#include "symbols.h"

typedef int bool;
enum { false, true };

//tetris
//defines
#define nFieldWidth 12
#define nFieldHeight 18
#define SCREEN_WIDTH 620
#define SCREEN_HEIGHT 955

//tetris variables
char pBuffer[nFieldHeight*nFieldWidth];
char pBackBuffer[nFieldHeight*nFieldWidth];
char nCurrentPiece=0;
char nCurrentRotation=0;
char nCurrentX = (nFieldWidth>>1)-2;
char nCurrentY = 0;
SDL_Window *window;
SDL_Surface *screenSurface;
int score=0;




char Rotate(char px, char py, char r)
{
    r=r-(r&252);
    if(!r)
        return (py<<2)+px;
    else if(r==1)
        return (12)+py-(px<<2);
    else if(r==2)
        return (15)-(py<<2)-px;
    else
        return (3)-py+(px<<2);

}

bool DoesPieceFit(int nTetromino, int nRotation, int nPosX, int nPosY)
{
    for(int px=0;px<4;px++)
    {
        for(int py=0;py<4;py++)
        {
            // Get index into piece
            int pi = (Rotate((px),(py),(nRotation)));
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
        int random=rand();
        nCurrentPiece=random-(random/7*7);
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
    static SDL_Event e;
    SDL_PollEvent(&e);
    if(e.type==SDL_KEYDOWN)
    {
        char newRot=(nCurrentRotation), newX=(nCurrentX), newY=(nCurrentY);
        char letter=(e.key.keysym.sym);
        newRot+=(letter==('w'));
        newX-=(letter==('a'));
        newX+=(letter==('d'));
        newY+=(letter==('s'));
        if(DoesPieceFit(nCurrentPiece,newRot,newX,newY))
        {
            if(newY!=nCurrentY)
            {
                score++;
            }
            nCurrentRotation=newRot;
            nCurrentX=newX;
            nCurrentY=newY;
            return(true);
        }
    }

    if (e.type==SDL_QUIT)
    {
        exit(0);
    }
    return false;
}



void itoa(int num, char* str)
{
    int i = 8;
    while (num)
    {
        int rem= num-(num/10*10);
        str[i] = (rem + '0');
        i--;
        num/=10;
    }
}

void drawCharacter(int number, int posX, int posY, int size)
{
    unsigned short bit=(uint64_t)1 << 14;

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
    int i=0,mark;
    mark=i-2;
    i=3;
    if(value!=-1)
    {
        char buffer[10]={(char)'0',(char)'0',(char)'0',(char)'0',(char)'0',(char)'0',(char)'0',(char)'0',(char)'0',(char)0};
        itoa(value,buffer);

        while(buffer[i])
        {
            drawCharacter(buffer[i]-48,((mark+i)<<2)*size+x,y,size);
            i++;
        }
    }
}




void drawBufferSDL()
{
    SDL_FillRect(screenSurface,NULL,black);
    int color;
    for(int x=0;x<nFieldWidth;x++)
    {
        for(int y=0;y<nFieldHeight;y++)
        {
            int i=nFieldWidth*y+x;
            color=(colors[(pBackBuffer[i])]);
            SDL_Rect rect=(SDL_Rect){x*50+10,y*50+10,48,48};
            SDL_FillRect(screenSurface,&rect,color);
        }
    }
    drawScore(score,-18,SCREEN_HEIGHT-15-(3<<3),7);
    SDL_UpdateWindowSurface(window);
}

void placeTetromino(int piece,int x, int y, int rotation)
{
    for(int px=0;px<4;px++)
    {
        for(int py=0;py<4;py++)
        {
            if((1 << (Rotate((char)px,(char)(py),(char)(rotation)))) & tetromino[piece])
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
        char adjency=0;
        if(isLineComplete(py))
        {
            points+=25;
            adjency = adjency ? adjency+1 : 0;
            if(adjency==4)
            {
                points += 100;
                adjency=0;
            }

            DropLine(py);
        }
    }
    score+=points;
    placeTetromino(nCurrentPiece,nCurrentX,nCurrentY,nCurrentRotation);
    drawBufferSDL();
}





void go()
{
    srand(time(NULL));
    int random=rand();
    nCurrentPiece=random-(random/7*7);
    window=SDL_CreateWindow(NULL,SDL_WINDOWPOS_UNDEFINED,SDL_WINDOWPOS_UNDEFINED,SCREEN_WIDTH,SCREEN_HEIGHT,SDL_WINDOW_SHOWN);
    screenSurface = SDL_GetWindowSurface( window );
    while(true)
    {
        bool bGameOver=false;
        InitPlayField();
        redraw();
        int i=0;
        while(!bGameOver)
        {
            if(ProcessEventsSDL())
            {
                redraw();
            }
            SDL_Delay(8);
            if(i-(i&4294967168)==0)
            {
                redraw();
                if(FallDown())
                {
                    InitPlayField();
                    score=0;
                    i=0;
                    //drawScore(-1,150,(SCREEN_HEIGHT>>1)-64,16);
                    SDL_UpdateWindowSurface(window);
                    SDL_Delay(3000);
                }
                redraw();
            }
            i++;
        }
    }
}


__attribute__((__externally_visible__, __section__(".text.startup._start"),
    __noreturn__
#ifndef __clang__
    , __naked__
#endif
))
void _start()
{
    go();
}

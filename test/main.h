#ifndef MAIN_H
#define MAIN_H

#include <SDL2/SDL.h>
#include "symbols.h"
#include <time.h>

//tetris
extern "C" void _start();
int main();

static char Rotate(char px, char py, char r);
static bool DoesPieceFit(int nTetromino, int nRotation, int nPosX, int nPosY);
static bool FallDown();
static bool ProcessEventsSDL();
static bool isLineComplete(int line);
static void placeTetromino(int piece, int x, int y, int rotation);
static void DropLine(int line);
static void InitPlayField();
static void drawBufferSDL();
static void drawCharacter(int number, int posX, int posY, int size);
static void drawScore(int value, int x, int y, int size);
static void redraw();

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


#endif // MAIN_H

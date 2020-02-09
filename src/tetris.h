
#include <SDL2/SDL.h>
#include "symbols.h"
#include "tetris_sng.h"
#include <stdbool.h>
#include <stdint.h>



//defines
// #define DEBUG
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
static short *stream;

static int song_clock=0;
static int noteCnt;
static int counter[VOICES];
static int previous[VOICES];
static int notes[VOICES];

static short vol[VOICES];
static float hertz[VOICES];
static int temp;

//__attribute__ ((noreturn))
static void itoa(int val, char* buffer);
static void ProcessEventsSDL();
static void drawScore();
static void drawBufferSDL();
static void placeTetromino(int piece,int x, int y, int rotation);
static void DropLine(int line);
static void InitPlayField();
static void redraw();
static void drawcharacter(int num, int posX,int posY);
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
inline char Rotate(char px, char py, char r);
inline bool DoesPieceFit(int nTetromino, int nRotation, int nPosX, int nPosY);
void _start();
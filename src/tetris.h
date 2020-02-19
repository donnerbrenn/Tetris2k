
#define SDL_DISABLE_IMMINTRIN_H 1
#include <SDL2/SDL.h>
#include "symbols.h"
#include "tetris_sng.h"
#include <stdbool.h>
#include <stdint.h>



//defines
// #define DEBUG
#define FIELDWIDTH 12
#define FIELDHEIGHT 18
#define SCREEN_WIDTH 620
#define SCREEN_HEIGHT 960
#define SAMPLERATE 96000
#define BUFFERSIZE 4096
#define FONTSIZE 8

//tetris variables
static char pBuffer[FIELDHEIGHT*FIELDWIDTH];
static char pBackBuffer[FIELDWIDTH*FIELDHEIGHT];
static char nCurrentRotation;
static char nCurrentX;
static char nCurrentY;
static int score;
static int hiscore;
static int nCurrentPiece;
static SDL_Window *window;
static SDL_Surface *screenSurface;
static short *stream;

static int song_clock=0;
static int noteCnt;
static int counter[VOICES];
static int previous[VOICES];
static int notes[VOICES];

static short vol[VOICES];
static float hertz[VOICES];
static int freq;
static unsigned int runtime=0;

//__attribute__ ((noreturn))
static void ProcessEventsSDL();
static void drawScore(int value, int x);
static void updateDisplay();
static void placeTetromino(int piece,int x, int y, int rotation);
static void DropLine(int line);
inline void initGame();
static void updateGame();
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


inline void initStone();
inline char Rotate(char px, char py, char r);
inline bool DoesPieceFit(int nTetromino, int nRotation, int nPosX, int nPosY);
void _start();
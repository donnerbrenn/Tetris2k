#define SYNTH
#define SCORE
// #define DECO

#include <SDL2/SDL.h>
#include "symbols.h"
#ifdef SYNTH
#include "tetris_sng.h"
#endif
#include <stdbool.h>



#define FIELDWIDTH 12
#define FIELDHEIGHT 18
#define SCREEN_WIDTH 620
#define SCREEN_HEIGHT 960
#define SAMPLERATE 96000
#define BUFFERSIZE 8192
#define FONTSIZE 8

//tetris variables
static char pBuffer[FIELDHEIGHT*FIELDWIDTH];
static char pBackBuffer[FIELDWIDTH*FIELDHEIGHT];
static char nCurrentRotation;
static char nCurrentX;
static char nCurrentY;
#ifdef SCORE
static unsigned int score;
static unsigned int lines;
#endif
static unsigned int runtime=0;
static int nCurrentPiece;
static SDL_Surface *screenSurface;
static SDL_Window *window;

#ifdef SYNTH
static void audio_callback(void *unused, unsigned char *byte_stream, int byte_stream_length);
static float getFrq(int note);
#endif
#ifdef SCORE
static void drawcharacter(int num, int posX,int posY);
static void drawScore(int value, int x);
#endif

static void _memcpy(void* dest, void* src, size_t numbytes);
static void _memset(void* dest, char val, size_t numbytes);
static void processEventsSDL();
static void updateDisplay();
static void placeTetromino(int piece,int x, int y, int rotation);
static void dropLine(int line);
static void initGame();
static void updateGame();
static void shuffle();
static void initSDL();
static bool fallDown();
static bool isLineComplete(int line);
static void drawRect(int x, int y, int w, int col);
static void initStone();
inline char getRotatedIndex(char px, char py, char r);
inline bool doesPieceFit(int nTetromino, int nRotation, int nPosX, int nPosY);

void _start();

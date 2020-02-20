#define FULL

#include <SDL2/SDL.h>
#include "symbols.h"
#ifdef FULL
#include "tetris_sng.h"
#endif
#include <stdbool.h>
#include <stdint.h>



//defines
// #define DEBUG


#define FIELDWIDTH 12
#define FIELDHEIGHT 18
#define SCREEN_WIDTH 620
#define SCREEN_HEIGHT 960
#define SAMPLERATE 44100
#define BUFFERSIZE 4096
#define FONTSIZE 8

//tetris variables
static char pBuffer[FIELDHEIGHT*FIELDWIDTH];
static char pBackBuffer[FIELDWIDTH*FIELDHEIGHT];
static char nCurrentRotation;
static char nCurrentX;
static char nCurrentY;
#ifdef FULL
static int score;
static int hiscore;
#endif
static int nCurrentPiece;
static SDL_Window *window;
static SDL_Surface *screenSurface;
static SDL_Rect rect;
static unsigned int runtime=0;
bool handlekeys;


#ifdef FULL
static int noteCnt;
static short *stream;
static int song_clock=0;
static int counter[VOICES];
static int previous[VOICES];
static int notes[VOICES];
static short vol[VOICES];
static float hertz[VOICES];
static int freq;
#endif


#ifdef FULL
static void audio_callback(void *unused, uint8_t *byte_stream, int byte_stream_length);
static float getFrq(int note);
static void drawcharacter(int num, int posX,int posY);
static void drawScore(int value, int x);
#endif

static void ProcessEventsSDL();
static void updateDisplay();
static void placeTetromino(int piece,int x, int y, int rotation);
static void DropLine(int line);
static void initGame();
static void updateGame();
static void updateBuffer();
static void shuffle();
static void initSDL();
static bool FallDown();
static bool isLineComplete(int line);
static void drawRect(int x, int y, int w, int col);
static void _memcpy(void* dest, void* src, size_t numbytes);
static void _memset(void* dest,char val,size_t numbytes);

inline void initStone();
inline char Rotate(char px, char py, char r);
inline bool DoesPieceFit(int nTetromino, int nRotation, int nPosX, int nPosY);
void _start();
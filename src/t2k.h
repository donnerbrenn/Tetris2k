#define SYNTH
// #define SCORE

#define GL_GLEXT_PROTOTYPES

#include <SDL2/SDL.h>
#include <GL/gl.h>
#include "shader.h"
#include "symbols.h"
#ifdef SYNTH
#include "tetris_sng.h"
#endif
#include <stdbool.h>

#define FIELDWIDTH 12
#define FIELDHEIGHT 18
#define SCREEN_WIDTH 630
#define SCREEN_HEIGHT 960
#define SAMPLERATE 44100
#define BUFFERSIZE 32768
#define FONTSIZE 8

//tetris variables
static char pBuffer[FIELDHEIGHT*FIELDWIDTH];
static char pBackBuffer[FIELDWIDTH*FIELDHEIGHT];
static int glbuffer[FIELDHEIGHT*FIELDWIDTH];
static char nCurrentRotation;
static char nCurrentX;
static char nCurrentY;
#ifdef SCORE
static unsigned int score;
static unsigned int lines;
#endif
static int nCurrentPiece;
static SDL_Rect rect;
static unsigned int runtime=0;
static bool handlekeys;

#ifdef SYNTH
static void audio_callback(void *unused, unsigned char *byte_stream, int byte_stream_length);
static float getFrq(int note);
#endif
#ifdef SCORE
static void drawcharacter(int num, int posX,int posY);
static void drawScore(int value, int x);
#endif

//GL STUFF
static SDL_Window *GLWindow;
static GLuint f;
static GLuint p;
static GLint GLPlayfieldPos;
static GLint GLSizePos;

static void ProcessEventsSDL();

static void updateDisplay();
static void placeTetromino(int piece,int x, int y, int rotation);
static void DropLine(int line);
static void initGame();
static void updateGame();
static void updateBuffer();
static void shuffle();
static bool FallDown();
static bool isLineComplete(int line);
static void _memcpy(void* dest, void* src, int numbytes);
static void _memset(void* dest, char val, int numbytes);
static void initStone();
inline char Rotate(char px, char py, char r);
inline bool DoesPieceFit(int nTetromino, int nRotation, int nPosX, int nPosY);
static void updateGL();
static void initGL();
void _start();

#include "t2k.h"
void _memset(void* dest,char val,int numbytes)
{
    for(int i=0;i<numbytes;i++)
    {
        ((char*)dest)[i]=val;
    }
}

void _memcpy(void* dest, void* src, int numbytes) 
{
	for(int i=0;i<numbytes;i++)
    {
        ((char*)dest)[i]=((char*)src)[i];
    }
}

void shuffle()
{
    int result=7;
    
    do
    {
        result=SDL_GetTicks()&7;
    } while(result==7||result==nCurrentPiece);
    nCurrentPiece=result;
}

void updateBuffer()
{
    _memcpy(pBuffer,pBackBuffer,FIELDHEIGHT*FIELDWIDTH); 
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
    static uint song_clock;
    static uint counter[VOICES];
    static uint previous[VOICES];
    static uint note;
    static uint freq;
    static uint pos;
    static uint current_pattern;
    static uint current_note;
    static float hertz[VOICES];
    for (int i = 0; i < byte_stream_length>>1; ++i)
    {
        pos=song_clock/(SAMPLERATE/SPEED);
        current_pattern=(pos>>6)&7;
        current_note=pos&63;
        stream[i]=0;
        for(int j=0;j<VOICES;j++)
        {
            note=cpatterns[j][order[current_pattern]][current_note];
            if((previous[j]!=pos)&&(note))
            {
                hertz[j]=getFrq(note);
                previous[j]=pos;
                vol[j]=8192;
            }
            if((song_clock&7)==0)
            {
                vol[j]--;
            }
            if(vol[j]>0)
            {
                float freq=SAMPLERATE/hertz[j];
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

char Rotate(char px, char py, char r)
{  
    char x;
    do
    {
        x=12+py-(px<<2);
        px=x&3;
        py=x>>2;

    } while(--r);
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
    handlekeys=true;
    while(SDL_PollEvent(&e))
    {
       
        if (e.type==SDL_QUIT)
        {
            asm volatile("push $231;pop %rax;syscall");
            __builtin_unreachable();
        }
        if(e.type==SDL_KEYDOWN&&handlekeys)
        {
            handlekeys=false;
            char key=(e.key.keysym.sym);
            char newRot=nCurrentRotation+(key=='w');
            char newX=(nCurrentX)+(key=='d')-(key=='a');
            char newY=(nCurrentY)+(key=='s');
            
            if(DoesPieceFit(nCurrentPiece,newRot,newX,newY))
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
    int multi=0;
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
            DropLine(py);
        }
    }
    placeTetromino(nCurrentPiece,nCurrentX,nCurrentY,nCurrentRotation);
    SDL_Delay(15);
}


static void initGL()
{
    // SDL_Init(SDL_INIT_EVERYTHING);  
    SDL_AudioSpec want; 
    want.freq = SAMPLERATE;
    want.format = AUDIO_S16SYS;
    want.channels=1;
    want.samples = BUFFERSIZE;
    want.callback = audio_callback;    
    SDL_OpenAudio((&want), NULL);
    SDL_PauseAudio(0);             
    GLWindow=SDL_CreateWindow(NULL,0,0,SCREEN_WIDTH,SCREEN_HEIGHT,SDL_WINDOW_OPENGL);
    SDL_GL_CreateContext(GLWindow);
    f = glCreateShader(GL_FRAGMENT_SHADER);
	glShaderSource(f, 1, &shader_glsl, NULL);
	glCompileShader(f);

        #ifdef DEBUG
		GLint isCompiled = 0;
		glGetShaderiv(f, GL_COMPILE_STATUS, &isCompiled);
		if(isCompiled == GL_FALSE) {
			GLint maxLength = 0;
			glGetShaderiv(f, GL_INFO_LOG_LENGTH, &maxLength);

			char* error = malloc(maxLength);
			glGetShaderInfoLog(f, maxLength, &maxLength, error);
			printf("%s\n", error);

			exit(-10);
		}
        else
        {
            printf("Shader compilation was succesfull\n");
        }
        #endif
        


    p=glCreateProgram();
	glAttachShader(p,f);
	glLinkProgram(p);

        #ifdef DEBUG
    	GLint isLinked = 0;
		glGetProgramiv(p, GL_LINK_STATUS, (int *)&isLinked);
		if (isLinked == GL_FALSE) {
			GLint maxLength = 0;
			glGetProgramiv(p, GL_INFO_LOG_LENGTH, &maxLength);

			char* error = malloc(maxLength);
			glGetProgramInfoLog(p, maxLength, &maxLength,error);
			printf("%s\n", error);

			exit(-10);
		}
        else
        {
            printf("Shader linking was succesfull\n");
        }
        #endif
        

    glUseProgram(p);
    GLPlayfieldPos = glGetUniformLocation( p, VAR_PLAYFIELD ); 
    GLSizePos = glGetUniformLocation( p, VAR_SIZE ); 
    GLint size[2]={SCREEN_WIDTH,SCREEN_HEIGHT};
    glUniform1iv(GLSizePos,2,&size[0]);
    glUniform2f(GLSizePos,size[0],size[1]);
    SDL_GL_SetSwapInterval(1);
}

void updateGL()
{
    for(int i=0;i<FIELDHEIGHT*FIELDWIDTH;i++)
    {
        glbuffer[i]=pBackBuffer[i];
    }
    glUniform1iv(GLPlayfieldPos,FIELDHEIGHT*FIELDWIDTH,&glbuffer[0]);
    
    glRecti(-1,-1,1,1);
	SDL_GL_SwapWindow(GLWindow);
}

void _start()
{
    asm volatile("sub $8, %rsp");
    initGame();
    initGL();
    while(true)
    {
        updateGame(); 
        
        
        if((runtime&15)==0)
        {       
            if(FallDown())
            {
                initGame();
                SDL_Delay(2000);
            }
        }
        runtime++;
       ProcessEventsSDL();
       updateGL();
    }
     __builtin_unreachable();
}
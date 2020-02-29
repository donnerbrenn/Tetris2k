#ifndef PATTERN_H
#define PATTERN_H
#define PATTERNCOUNT 4
#define VOICES 3
#define SPEED 9
#define PATTERNLENGTH 64

const char order[]={0,1,0,1,2,3,0,1};

const char cpatterns[VOICES][PATTERNCOUNT][PATTERNLENGTH]=
{
    {
        {50,0 ,0 ,0 ,45,0 ,46,0 ,48,0 ,50,48,46,0 ,45,0 ,43,0 ,0 ,0 ,43,0 ,46,0 ,50,0 ,0 ,0 ,48,0 ,46,0 ,45,0 ,0 ,0 ,45,0 ,46,0 ,48,0 ,0 ,0 ,50,0 ,0 ,0 ,46,0 ,0 ,0 ,43,0 ,0 ,0 ,43,0 ,0 ,0 ,0 ,0 ,0 ,0 },
        {0 ,0 ,48,0 ,0 ,0 ,51,0 ,55,0 ,0 ,0 ,53,0 ,51,0 ,50,0 ,0 ,0 ,0 ,0 ,46,0 ,50,0 ,51,50,48,0 ,46,0 ,45,0 ,0 ,0 ,45,0 ,46,0 ,48,0 ,0 ,0 ,50,0 ,0 ,0 ,46,0 ,0 ,0 ,43,0 ,0 ,0 ,43,0 ,0 ,0 ,0 ,0 ,0 ,0 },
        {50,0 ,0 ,0 ,0 ,0 ,0 ,0 ,46,0 ,0 ,0 ,0 ,0 ,0 ,0 ,48,0 ,0 ,0 ,0 ,0 ,0 ,0 ,45,0 ,0 ,0 ,0 ,0 ,0 ,0 ,46,0 ,0 ,0 ,0 ,0 ,0 ,0 ,43,0 ,0 ,0 ,0 ,0 ,0 ,0 ,42,0 ,0 ,0 ,0 ,0 ,0 ,0 ,45,0 ,0 ,0 ,0 ,0 ,0 ,0 },
        {50,0 ,0 ,0 ,0 ,0 ,0 ,0 ,46,0 ,0 ,0 ,0 ,0 ,0 ,0 ,48,0 ,0 ,0 ,0 ,0 ,0 ,0 ,45,0 ,0 ,0 ,0 ,0 ,0 ,0 ,46,0 ,0 ,0 ,50,0 ,0 ,0 ,55,0 ,0 ,0 ,0 ,0 ,0 ,0 ,54,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 }
    },
    {
        {14,0 ,26,0 ,14,0 ,26,0 ,14,0 ,26,0 ,14,0 ,26,0 ,19,0 ,31,0 ,19,0 ,31,0 ,19,0 ,31,0 ,19,0 ,31,0 ,18,0 ,30,0 ,18,0 ,30,0 ,14,0 ,26,0 ,14,0 ,26,0 ,19,0 ,31,0 ,19,0 ,31,0 ,19,0 ,21,0 ,0 ,0 ,22,0 },
        {24,0 ,12,0 ,0 ,0 ,12,0 ,0 ,0 ,12,0 ,19,0 ,12,0 ,22,0 ,22,0 ,0 ,0 ,22,0 ,22,0 ,17,0 ,17,0 ,0 ,0 ,21,0 ,33,0 ,0 ,0 ,33,0 ,0 ,0 ,26,0 ,0 ,0 ,30,0 ,19,0 ,26,0 ,19,0 ,26,0 ,19,0 ,0 ,0 ,0 ,0 ,0 ,0 },
        {31,0 ,38,0 ,31,0 ,38,0 ,31,0 ,38,0 ,31,0 ,38,0 ,30,0 ,38,0 ,30,0 ,38,0 ,30,0 ,38,0 ,30,0 ,38,0 ,31,0 ,38,0 ,31,0 ,38,0 ,31,0 ,38,0 ,31,0 ,38,0 ,30,0 ,38,0 ,30,0 ,38,0 ,30,0 ,38,0 ,30,0 ,38,0 },
        {31,0 ,38,0 ,31,0 ,38,0 ,31,0 ,38,0 ,31,0 ,38,0 ,30,0 ,38,0 ,30,0 ,38,0 ,30,0 ,38,0 ,30,0 ,38,0 ,31,0 ,38,0 ,31,0 ,38,0 ,31,0 ,38,0 ,31,0 ,38,0 ,30,0 ,38,0 ,30,0 ,38,0 ,30,0 ,0 ,0 ,38,0 ,0 ,0 }
    },
    {
        {45,0 ,0 ,0 ,42,0 ,43,0 ,45,0 ,0 ,0 ,43,0 ,42,0 ,38,0 ,0 ,0 ,38,0 ,43,0 ,46,0 ,0 ,0 ,45,0 ,43,0 ,42,0 ,38,0 ,42,0 ,43,0 ,45,0 ,0 ,0 ,46,0 ,0 ,0 ,43,0 ,0 ,0 ,38,0 ,0 ,0 ,38,0 ,0 ,0 ,0 ,0 ,0 ,0 },
        {0 ,0 ,39,0 ,0 ,0 ,43,0 ,46,0 ,46,46,45,0 ,43,0 ,41,0 ,0 ,0 ,0 ,0 ,38,0 ,41,0 ,43,41,39,0 ,38,0 ,42,0 ,38,0 ,42,0 ,43,0 ,45,0 ,42,0 ,46,0 ,42,0 ,43,0 ,38,0 ,38,0 ,0 ,0 ,38,0 ,0 ,0 ,0 ,0 ,0 ,0 },
        {46,0 ,0 ,0 ,0 ,0 ,0 ,0 ,43,0 ,0 ,0 ,0 ,0 ,0 ,0 ,45,0 ,0 ,0 ,0 ,0 ,0 ,0 ,42,0 ,0 ,0 ,0 ,0 ,0 ,0 ,43,0 ,0 ,0 ,0 ,0 ,0 ,0 ,38,0 ,0 ,0 ,0 ,0 ,0 ,0 ,38,0 ,0 ,0 ,0 ,0 ,0 ,0 ,42,0 ,0 ,0 ,0 ,0 ,0 ,0 },
        {46,0 ,0 ,0 ,0 ,0 ,0 ,0 ,43,0 ,0 ,0 ,0 ,0 ,0 ,0 ,45,0 ,0 ,0 ,0 ,0 ,0 ,0 ,42,0 ,0 ,0 ,0 ,0 ,0 ,0 ,43,0 ,0 ,0 ,46,0 ,0 ,0 ,50,0 ,0 ,0 ,0 ,0 ,0 ,0 ,48,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 }
    }
};
#endif // PATTERN_H

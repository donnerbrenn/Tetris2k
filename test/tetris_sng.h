#ifndef PATTERN_H
#define PATTERN_H
#define LENGTH 8
#define VOICES 3
#define SPEED 10000
#define PATTERNLENGTH 64

const char cpatterns[VOICES][LENGTH][PATTERNLENGTH]=
{
    {
        {62,0,0,0,57,0,58,0,60,0,62,60,58,0,57,0,55,0,0,0,55,0,58,0,62,0,0,0,60,0,58,0,57,0,0,0,57,0,58,0,60,0,0,0,62,0,0,0,58,0,0,0,55,0,0,0,55,0,0,0,0,0,0,0},
        {0,0,60,0,0,0,63,0,67,0,0,0,65,0,63,0,62,0,0,0,0,0,58,0,62,0,63,62,60,0,58,0,57,0,0,0,57,0,58,0,60,0,0,0,62,0,0,0,58,0,0,0,55,0,0,0,55,0,0,0,0,0,0,0},
        {62,0,0,0,57,0,58,0,60,0,62,60,58,0,57,0,55,0,0,0,55,0,58,0,62,0,0,0,60,0,58,0,57,0,0,0,57,0,58,0,60,0,0,0,62,0,0,0,58,0,0,0,55,0,0,0,55,0,0,0,0,0,0,0},
        {0,0,60,0,0,0,63,0,67,0,0,0,65,0,63,0,62,0,0,0,0,0,58,0,62,0,63,62,60,0,58,0,57,0,0,0,57,0,58,0,60,0,0,0,62,0,0,0,58,0,0,0,55,0,0,0,55,0,0,0,0,0,0,0},
        {62,0,0,0,0,0,0,0,58,0,0,0,0,0,0,0,60,0,0,0,0,0,0,0,57,0,0,0,0,0,0,0,58,0,0,0,0,0,0,0,55,0,0,0,0,0,0,0,54,0,0,0,0,0,0,0,57,0,0,0,0,0,0,0},
        {62,0,0,0,0,0,0,0,58,0,0,0,0,0,0,0,60,0,0,0,0,0,0,0,57,0,0,0,0,0,0,0,58,0,0,0,62,0,0,0,67,0,0,0,0,0,0,0,66,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {62,0,0,0,57,0,58,0,60,0,62,60,58,0,57,0,55,0,0,0,55,0,58,0,62,0,0,0,60,0,58,0,57,0,0,0,57,0,58,0,60,0,0,0,62,0,0,0,58,0,0,0,55,0,0,0,55,0,0,0,0,0,0,0},
        {0,0,60,0,0,0,63,0,67,0,0,0,65,0,63,0,62,0,0,0,0,0,58,0,62,0,63,62,60,0,58,0,57,0,0,0,57,0,58,0,60,0,0,0,62,0,0,0,58,0,0,0,55,0,0,0,55,0,0,0,0,0,0,0}
    },
    {
        {26,0,38,0,26,0,38,0,26,0,38,0,26,0,38,0,31,0,43,0,31,0,43,0,31,0,43,0,31,0,43,0,30,0,42,0,30,0,42,0,26,0,38,0,26,0,38,0,31,0,43,0,31,0,43,0,31,0,33,0,0,0,34,0},
        {36,0,24,0,0,0,24,0,0,0,24,0,31,0,24,0,22,0,34,0,0,0,34,0,22,0,29,0,29,0,0,0,33,0,45,0,0,0,45,0,0,0,38,0,0,0,42,0,31,0,38,0,31,0,38,0,31,0,0,0,0,0,0,0},
        {26,0,38,0,26,0,38,0,26,0,38,0,26,0,38,0,31,0,43,0,31,0,43,0,31,0,43,0,31,0,43,0,30,0,42,0,30,0,42,0,26,0,38,0,26,0,38,0,31,0,43,0,31,0,43,0,31,0,33,0,0,0,34,0},
        {36,0,24,0,0,0,24,0,0,0,24,0,31,0,24,0,22,0,34,0,0,0,34,0,22,0,29,0,29,0,0,0,33,0,45,0,0,0,45,0,0,0,38,0,0,0,42,0,31,0,38,0,31,0,38,0,31,0,0,0,0,0,0,0},
        {43,0,50,0,43,0,50,0,43,0,50,0,43,0,50,0,42,0,50,0,42,0,50,0,42,0,50,0,42,0,50,0,43,0,50,0,43,0,50,0,43,0,50,0,43,0,50,0,42,0,50,0,42,0,50,0,42,0,50,0,42,0,50,0},
        {43,0,50,0,43,0,50,0,43,0,50,0,43,0,50,0,42,0,50,0,42,0,50,0,42,0,50,0,42,0,50,0,43,0,50,0,43,0,50,0,43,0,50,0,43,0,50,0,42,0,50,0,42,0,50,0,42,0,0,0,50,0,0,0},
        {26,0,38,0,26,0,38,0,26,0,38,0,26,0,38,0,31,0,43,0,31,0,43,0,31,0,43,0,31,0,43,0,30,0,42,0,30,0,42,0,26,0,38,0,26,0,38,0,31,0,43,0,31,0,43,0,31,0,33,0,0,0,34,0},
        {36,0,24,0,0,0,24,0,0,0,24,0,31,0,24,0,22,0,34,0,0,0,34,0,22,0,29,0,29,0,0,0,33,0,45,0,0,0,45,0,0,0,38,0,0,0,42,0,31,0,38,0,31,0,38,0,31,0,0,0,0,0,0,0}
    },
    {
        {57,0,0,0,54,0,55,0,57,0,0,0,55,0,54,0,50,0,0,0,50,0,55,0,58,0,0,0,57,0,55,0,54,0,50,0,54,0,55,0,57,0,0,0,58,0,0,0,55,0,0,0,50,0,0,0,50,0,0,0,0,0,0,0},
        {0,0,51,0,0,0,55,0,58,0,58,58,57,0,55,0,53,0,0,0,0,0,50,0,53,0,55,53,51,0,50,0,54,0,50,0,54,0,55,0,57,0,54,0,58,0,54,0,55,0,50,0,50,0,0,0,50,0,0,0,0,0,0,0},
        {57,0,0,0,54,0,55,0,57,0,0,0,55,0,54,0,50,0,0,0,50,0,55,0,58,0,0,0,57,0,55,0,54,0,50,0,54,0,55,0,57,0,0,0,58,0,0,0,55,0,0,0,50,0,0,0,50,0,0,0,0,0,0,0},
        {0,0,51,0,0,0,55,0,58,0,58,58,57,0,55,0,53,0,0,0,0,0,50,0,53,0,55,53,51,0,50,0,54,0,50,0,54,0,55,0,57,0,54,0,58,0,54,0,55,0,50,0,50,0,0,0,50,0,0,0,0,0,0,0},
        {58,0,0,0,0,0,0,0,55,0,0,0,0,0,0,0,57,0,0,0,0,0,0,0,54,0,0,0,0,0,0,0,55,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,54,0,0,0,0,0,0,0},
        {58,0,0,0,0,0,0,0,55,0,0,0,0,0,0,0,57,0,0,0,0,0,0,0,54,0,0,0,0,0,0,0,55,0,0,0,58,0,0,0,62,0,0,0,0,0,0,0,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {57,0,0,0,54,0,55,0,57,0,0,0,55,0,54,0,50,0,0,0,50,0,55,0,58,0,0,0,57,0,55,0,54,0,50,0,54,0,55,0,57,0,0,0,58,0,0,0,55,0,0,0,50,0,0,0,50,0,0,0,0,0,0,0},
        {0,0,51,0,0,0,55,0,58,0,58,58,57,0,55,0,53,0,0,0,0,0,50,0,53,0,55,53,51,0,50,0,54,0,50,0,54,0,55,0,57,0,54,0,58,0,54,0,55,0,50,0,50,0,0,0,50,0,0,0,0,0,0,0}
    }
};

#endif // PATTERN_H

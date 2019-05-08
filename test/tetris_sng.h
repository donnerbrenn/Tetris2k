#ifndef PATTERN_H
#define PATTERN_H
#define length 8
#define voices 3
#define speed 4500

const char cpatterns[voices][length][128]=
{
    {
        {62,0,0,0,0,0,0,0,57,0,0,0,58,0,0,0,60,0,0,0,62,0,60,0,58,0,0,0,57,0,0,0,55,0,0,0,0,0,0,0,55,0,0,0,58,0,0,0,62,0,0,0,0,0,0,0,60,0,0,0,58,0,0,0,57,0,0,0,0,0,0,0,57,0,0,0,58,0,0,0,60,0,0,0,0,0,0,0,62,0,0,0,0,0,0,0,58,0,0,0,0,0,0,0,55,0,0,0,0,0,0,0,55,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,60,0,0,0,0,0,0,0,63,0,0,0,67,0,0,0,0,0,0,0,65,0,0,0,63,0,0,0,62,0,0,0,0,0,0,0,0,0,0,0,58,0,0,0,62,0,0,0,63,0,62,0,60,0,0,0,58,0,0,0,57,0,0,0,0,0,0,0,57,0,0,0,58,0,0,0,60,0,0,0,0,0,0,0,62,0,0,0,0,0,0,0,58,0,0,0,0,0,0,0,55,0,0,0,0,0,0,0,55,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {62,0,0,0,0,0,0,0,57,0,0,0,58,0,0,0,60,0,0,0,62,0,60,0,58,0,0,0,57,0,0,0,55,0,0,0,0,0,0,0,55,0,0,0,58,0,0,0,62,0,0,0,0,0,0,0,60,0,0,0,58,0,0,0,57,0,0,0,0,0,0,0,57,0,0,0,58,0,0,0,60,0,0,0,0,0,0,0,62,0,0,0,0,0,0,0,58,0,0,0,0,0,0,0,55,0,0,0,0,0,0,0,55,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,60,0,0,0,0,0,0,0,63,0,0,0,67,0,0,0,0,0,0,0,65,0,0,0,63,0,0,0,62,0,0,0,0,0,0,0,0,0,0,0,58,0,0,0,62,0,0,0,63,0,62,0,60,0,0,0,58,0,0,0,57,0,0,0,0,0,0,0,57,0,0,0,58,0,0,0,60,0,0,0,0,0,0,0,62,0,0,0,0,0,0,0,58,0,0,0,0,0,0,0,55,0,0,0,0,0,0,0,55,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {62,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,58,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,57,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,58,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,55,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,54,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,57,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {62,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,58,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,57,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,58,0,0,0,0,0,0,0,62,0,0,0,0,0,0,0,67,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,66,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {62,0,0,0,0,0,0,0,57,0,0,0,58,0,0,0,60,0,0,0,62,0,60,0,58,0,0,0,57,0,0,0,55,0,0,0,0,0,0,0,55,0,0,0,58,0,0,0,62,0,0,0,0,0,0,0,60,0,0,0,58,0,0,0,57,0,0,0,0,0,0,0,57,0,0,0,58,0,0,0,60,0,0,0,0,0,0,0,62,0,0,0,0,0,0,0,58,0,0,0,0,0,0,0,55,0,0,0,0,0,0,0,55,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,60,0,0,0,0,0,0,0,63,0,0,0,67,0,0,0,0,0,0,0,65,0,0,0,63,0,0,0,62,0,0,0,0,0,0,0,0,0,0,0,58,0,0,0,62,0,0,0,63,0,62,0,60,0,0,0,58,0,0,0,57,0,0,0,0,0,0,0,57,0,0,0,58,0,0,0,60,0,0,0,0,0,0,0,62,0,0,0,0,0,0,0,58,0,0,0,0,0,0,0,55,0,0,0,0,0,0,0,55,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
    },
    {
        {26,0,0,0,38,0,0,0,26,0,0,0,38,0,0,0,26,0,0,0,38,0,0,0,26,0,0,0,38,0,0,0,31,0,0,0,43,0,0,0,31,0,0,0,43,0,0,0,31,0,0,0,43,0,0,0,31,0,0,0,43,0,0,0,30,0,0,0,42,0,0,0,30,0,0,0,42,0,0,0,26,0,0,0,38,0,0,0,26,0,0,0,38,0,0,0,31,0,0,0,43,0,0,0,31,0,0,0,43,0,0,0,31,0,0,0,33,0,0,0,0,0,0,0,34,0,0,0},
        {36,0,0,0,24,0,0,0,0,0,0,0,24,0,0,0,0,0,0,0,24,0,0,0,31,0,0,0,24,0,0,0,22,0,0,0,34,0,0,0,0,0,0,0,34,0,0,0,22,0,0,0,29,0,0,0,29,0,0,0,0,0,0,0,33,0,0,0,45,0,0,0,0,0,0,0,45,0,0,0,0,0,0,0,38,0,0,0,0,0,0,0,42,0,0,0,31,0,0,0,38,0,0,0,31,0,0,0,38,0,0,0,31,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {26,0,0,0,38,0,0,0,26,0,0,0,38,0,0,0,26,0,0,0,38,0,0,0,26,0,0,0,38,0,0,0,31,0,0,0,43,0,0,0,31,0,0,0,43,0,0,0,31,0,0,0,43,0,0,0,31,0,0,0,43,0,0,0,30,0,0,0,42,0,0,0,30,0,0,0,42,0,0,0,26,0,0,0,38,0,0,0,26,0,0,0,38,0,0,0,31,0,0,0,43,0,0,0,31,0,0,0,43,0,0,0,31,0,0,0,33,0,0,0,0,0,0,0,34,0,0,0},
        {36,0,0,0,24,0,0,0,0,0,0,0,24,0,0,0,0,0,0,0,24,0,0,0,31,0,0,0,24,0,0,0,22,0,0,0,34,0,0,0,0,0,0,0,34,0,0,0,22,0,0,0,29,0,0,0,29,0,0,0,0,0,0,0,33,0,0,0,45,0,0,0,0,0,0,0,45,0,0,0,0,0,0,0,38,0,0,0,0,0,0,0,42,0,0,0,31,0,0,0,38,0,0,0,31,0,0,0,38,0,0,0,31,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {43,0,0,0,50,0,0,0,43,0,0,0,50,0,0,0,43,0,0,0,50,0,0,0,43,0,0,0,50,0,0,0,42,0,0,0,50,0,0,0,42,0,0,0,50,0,0,0,42,0,0,0,50,0,0,0,42,0,0,0,50,0,0,0,43,0,0,0,50,0,0,0,43,0,0,0,50,0,0,0,43,0,0,0,50,0,0,0,43,0,0,0,50,0,0,0,42,0,0,0,50,0,0,0,42,0,0,0,50,0,0,0,42,0,0,0,50,0,0,0,42,0,0,0,50,0,0,0},
        {43,0,0,0,50,0,0,0,43,0,0,0,50,0,0,0,43,0,0,0,50,0,0,0,43,0,0,0,50,0,0,0,42,0,0,0,50,0,0,0,42,0,0,0,50,0,0,0,42,0,0,0,50,0,0,0,42,0,0,0,50,0,0,0,43,0,0,0,50,0,0,0,43,0,0,0,50,0,0,0,43,0,0,0,50,0,0,0,43,0,0,0,50,0,0,0,42,0,0,0,50,0,0,0,42,0,0,0,50,0,0,0,42,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0},
        {26,0,0,0,38,0,0,0,26,0,0,0,38,0,0,0,26,0,0,0,38,0,0,0,26,0,0,0,38,0,0,0,31,0,0,0,43,0,0,0,31,0,0,0,43,0,0,0,31,0,0,0,43,0,0,0,31,0,0,0,43,0,0,0,30,0,0,0,42,0,0,0,30,0,0,0,42,0,0,0,26,0,0,0,38,0,0,0,26,0,0,0,38,0,0,0,31,0,0,0,43,0,0,0,31,0,0,0,43,0,0,0,31,0,0,0,33,0,0,0,0,0,0,0,34,0,0,0},
        {36,0,0,0,24,0,0,0,0,0,0,0,24,0,0,0,0,0,0,0,24,0,0,0,31,0,0,0,24,0,0,0,22,0,0,0,34,0,0,0,0,0,0,0,34,0,0,0,22,0,0,0,29,0,0,0,29,0,0,0,0,0,0,0,33,0,0,0,45,0,0,0,0,0,0,0,45,0,0,0,0,0,0,0,38,0,0,0,0,0,0,0,42,0,0,0,31,0,0,0,38,0,0,0,31,0,0,0,38,0,0,0,31,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
    },
    {
        {57,0,0,0,0,0,0,0,54,0,0,0,55,0,0,0,57,0,0,0,0,0,0,0,55,0,0,0,54,0,0,0,50,0,0,0,0,0,0,0,50,0,0,0,55,0,0,0,58,0,0,0,0,0,0,0,57,0,0,0,55,0,0,0,54,0,0,0,50,0,0,0,54,0,0,0,55,0,0,0,57,0,0,0,0,0,0,0,58,0,0,0,0,0,0,0,55,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,51,0,0,0,0,0,0,0,55,0,0,0,58,0,0,0,58,0,58,0,57,0,0,0,55,0,0,0,53,0,0,0,0,0,0,0,0,0,0,0,50,0,0,0,53,0,0,0,55,0,53,0,51,0,0,0,50,0,0,0,54,0,0,0,50,0,0,0,54,0,0,0,55,0,0,0,57,0,0,0,54,0,0,0,58,0,0,0,54,0,0,0,55,0,0,0,50,0,0,0,50,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {57,0,0,0,0,0,0,0,54,0,0,0,55,0,0,0,57,0,0,0,0,0,0,0,55,0,0,0,54,0,0,0,50,0,0,0,0,0,0,0,50,0,0,0,55,0,0,0,58,0,0,0,0,0,0,0,57,0,0,0,55,0,0,0,54,0,0,0,50,0,0,0,54,0,0,0,55,0,0,0,57,0,0,0,0,0,0,0,58,0,0,0,0,0,0,0,55,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,51,0,0,0,0,0,0,0,55,0,0,0,58,0,0,0,58,0,58,0,57,0,0,0,55,0,0,0,53,0,0,0,0,0,0,0,0,0,0,0,50,0,0,0,53,0,0,0,55,0,53,0,51,0,0,0,50,0,0,0,54,0,0,0,50,0,0,0,54,0,0,0,55,0,0,0,57,0,0,0,54,0,0,0,58,0,0,0,54,0,0,0,55,0,0,0,50,0,0,0,50,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {58,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,55,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,57,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,54,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,55,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,54,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {58,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,55,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,57,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,54,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,55,0,0,0,0,0,0,0,58,0,0,0,0,0,0,0,62,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {57,0,0,0,0,0,0,0,54,0,0,0,55,0,0,0,57,0,0,0,0,0,0,0,55,0,0,0,54,0,0,0,50,0,0,0,0,0,0,0,50,0,0,0,55,0,0,0,58,0,0,0,0,0,0,0,57,0,0,0,55,0,0,0,54,0,0,0,50,0,0,0,54,0,0,0,55,0,0,0,57,0,0,0,0,0,0,0,58,0,0,0,0,0,0,0,55,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
        {0,0,0,0,51,0,0,0,0,0,0,0,55,0,0,0,58,0,0,0,58,0,58,0,57,0,0,0,55,0,0,0,53,0,0,0,0,0,0,0,0,0,0,0,50,0,0,0,53,0,0,0,55,0,53,0,51,0,0,0,50,0,0,0,54,0,0,0,50,0,0,0,54,0,0,0,55,0,0,0,57,0,0,0,54,0,0,0,58,0,0,0,54,0,0,0,55,0,0,0,50,0,0,0,50,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
    }
};

#endif // PATTERN_H

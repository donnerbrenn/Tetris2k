#ifndef SYMBOLS_H
#define SYMBOLS_H


//define colors as 32 integers / hex for easy reading

enum color
{
    black=0x00000000,
    white=0x00FFFFFF,
    grey=0x00808080,
    red=0x00FF0000,
    green=0x0000FF00,
    blue=0x000000FF,
    cyan=0x0000FFFF,
    yellow=0x00FFFF00,
    purple=0x00FF00FF,
    orange=0x00FF8000
};

enum tetronimos
{
    O=0x0660,
    L=0x0622,
    J=0x0644,
    I=0x2222,
    Z=0x2640,
    T=0x2620,
    S=0x4620
};

enum chars
{
    C0=0x7B6F,     //0
    C1=0x2C97,     //1
    C2=0x73E7,     //2
    C3=0x72CF,     //3
    C4=0x5BC9,     //4
    C5=0x79CF,     //5
    C6=0x79EF,     //6
    C7=0x7292,     //7
    C8=0x7BEF,     //8
    C9=0x7BCF,     //9
    CA=0x7BED,     //A
    CB=0x7BAF,     //B
    CC=0x7927,     //C
    CD=0x6B6E,     //D
    CE=0x79A7,     //E
    CF=0x79A4,     //F
    CG=0x796F,     //G
    CH=0x5BED,     //H
    CI=0x2492,     //I
    CJ=0x126F,     //J
    CK=0x5BAD,     //K
    CL=0x4927,     //L
    CM=0x5F6D,     //M
    CN=0x5FED,     //N
    CO=0x7B6F,     //O
    CP=0x7BE4,     //P
    CQ=0x7B79,     //Q
    CR=0x7BAD,     //R
    CS=0x388E,     //S
    CT=0x7492,     //T
    CU=0x5B6F,     //U
    CV=0x5B6A,     //V
    CW=0x5B7F,     //W
    CX=0x5AAD,     //X
    CY=0x5BD2,     //Y
    CZ=0x72A7      //Z
};

//create the "color palette"
unsigned int colors[10]={black,grey,green,blue,cyan,yellow,purple,orange,white,red};


//the game blocks or so called tetrominos
unsigned short tetromino[7]=
{
    O,L,J,I,Z,T,S
};

//letters c64 style - just numbers for our score
unsigned short characters[10]=
{
    C0,C1,C2,C3,C4,C5,C6,C7,C8,C9
};
#endif // SYMBOLS_H

#include <stdio.h>
#include <SDL2/SDL.h>

/*__attribute__((__section__(".rodata.hello-_start$f")))
static const char *f = "foo";*/

__attribute__((__externally_visible__, __section__(".text.startup._start"),
    __noreturn__
#ifndef __clang__
    , __naked__
#endif
))

int _start(void) {
    SDL_Init(SDL_INIT_VIDEO);
    SDL_Window *w = SDL_CreateWindow("nice", SDL_WINDOWPOS_UNDEFINED,
        SDL_WINDOWPOS_UNDEFINED, 1280, 720, SDL_WINDOW_OPENGL);
    puts("ohai");//printf("%s\n", "ohai");
    SDL_Delay(3000);
    SDL_DestroyWindow(w);
    asm volatile("int3");//exit(42);
    __builtin_unreachable();
}



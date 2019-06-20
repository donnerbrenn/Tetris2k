
#include <stddef.h>

extern int main(int argc, char* argv[]);

extern int __libc_start_main(int (*main)(int, char**),
        int argc, char** argv,
        void (*init)(void), void(*fini)(void),
        void (*rtld_fini)(void),
        void* stack) __attribute__((__noreturn__));

__attribute__((__externally_visible__, __section__(".text.startup._start"),
            __noreturn__, __used__
#ifdef __x86_64__
        , __naked__
#endif
))
int _start(void* stack
#ifdef USE_DL_FINI
        , void (*dl_fini)(void)
#endif
) {
#ifndef __x86_64__
    int argc=0;
    char** argv=NULL;
#endif

// avoid problems when -fno-plt is enabled
#ifdef __x86_64__
    asm volatile(
                "xor  %%ecx, %%ecx\n"
                 "push %%rcx\n"
                 "push %%rcx\n"
                 "pop  %%r8\n"
                 "pop  %%r9\n"
                 "jmp *__libc_start_main@GOTPCREL(%%rip)\n"
            :
            :"S"(0), "D" (main), "d" (NULL)
            :);
#else
    __libc_start_main(main, argc, argv, NULL, NULL,
#ifdef USE_DL_FINI
            dl_fini
#else
            NULL
#endif
            , (void*)stack);
#endif

    __builtin_unreachable();
}


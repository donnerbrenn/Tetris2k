
#include <stddef.h>

extern void main();

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
static int _start(void* stack
#ifdef USE_DL_FINI
        , void (*dl_fini)(void)
#endif
) {
    // int argc=*(size_t*)stack;
    // char** argv=(void*)(&((size_t*)stack)[1]);

// avoid problems when -fno-plt is enabled
#ifdef __x86_64__
    asm volatile("xor  %%ecx, %%ecx\n"
                 "push %%rcx\n"
                 "push %%rcx\n"
                 "pop  %%r8\n"
                 "pop  %%r9\n"
                 "jmp *__libc_start_main@GOTPCREL(%%rip)\n"
            :
            :"S"(NULL), "D" (main), "d" (NULL)
            :);
#else
    __libc_start_main(main, NULL, NULL, NULL, NULL,
#ifdef USE_DL_FINI
            dl_fini
#else
            NULL
#endif
            , NULL);
#endif

    __builtin_unreachable();
}


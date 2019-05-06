
#include <stddef.h>

extern void main();

extern int __libc_start_main(int (*main)(int, char**),
        int argc, char** argv,
        void (*init)(void), void(*fini)(void),
        void (*rtld_fini)(void),
        void* stack) __attribute__((__noreturn__));
__attribute__((__externally_visible__, __section__(".text.startup._start"), __noreturn__, __used__))

extern int _start() {
    __libc_start_main(main, NULL, NULL, NULL, NULL,NULL, NULL);
//    __builtin_unreachable();
}


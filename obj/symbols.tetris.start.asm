; vim: set ft=nasm:
bits 32
%include "header32.asm"
dynamic.needed:
dd 1;DT_NEEDED
dd (_symbols.libsdl2_2 - _strtab)
dd 1;DT_NEEDED
dd (_symbols.libc - _strtab)
dynamic.end:
%ifndef UNSAFE_DYNAMIC
    dd DT_NULL
%endif
[section .rodata.neededlibs]
_strtab:
	_symbols.libsdl2_2: db "libSDL2-2.0.so.0",0
	_symbols.libc: db "libc.so.6",0
[section .data.smolgot]
[section .text.smolplt]
_symbols:
		global SDL_PauseAudioDevice
		SDL_PauseAudioDevice:
			dd 0xdc2da7c7
		global SDL_Delay
		SDL_Delay:
			dd 0x34dd93b6
		global SDL_OpenAudioDevice
		SDL_OpenAudioDevice:
			dd 0xb45f4c3b
		global SDL_FillRect
		SDL_FillRect:
			dd 0x41dc825c
		global SDL_UpdateWindowSurface
		SDL_UpdateWindowSurface:
			dd 0xf0fa782b
		global SDL_Init
		SDL_Init:
			dd 0x3fac837b
		global SDL_GetWindowSurface
		SDL_GetWindowSurface:
			dd 0xf6f06c68
		global SDL_CreateWindow
		SDL_CreateWindow:
			dd 0x4acb1f33
		global SDL_PollEvent
		SDL_PollEvent:
			dd 0x92f25140
		global time
		time:
			dd 0x7c9e7894
		global __libc_start_main
		__libc_start_main:
			dd 0xf63d4e2e
		global rand
		rand:
			dd 0x7c9d3dea
		global srand
		srand:
			dd 0x1060307d
		global exit
		exit:
			dd 0x7c967e3f
		global sprintf
		sprintf:
			dd 0xa5b50f0b
db 0
_symbols.end:
%include "loader32.asm"

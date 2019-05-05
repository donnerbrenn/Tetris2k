; vim: set ft=nasm:
%define USE_HASH16 1
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
		global SDL_FillRect
		SDL_FillRect:
			dd 0x73b4
		global SDL_CreateWindow
		SDL_CreateWindow:
			dd 0x238a
		global SDL_OpenAudioDevice
		SDL_OpenAudioDevice:
			dd 0x6770
		global SDL_UpdateWindowSurface
		SDL_UpdateWindowSurface:
			dd 0x2b1e
		global SDL_uitoa
		SDL_uitoa:
			dd 0x3769
		global SDL_sinf
		SDL_sinf:
			dd 0x5416
		global SDL_GetWindowSurface
		SDL_GetWindowSurface:
			dd 0x8b46
		global SDL_PauseAudioDevice
		SDL_PauseAudioDevice:
			dd 0xafa9
		global SDL_Init
		SDL_Init:
			dd 0xbc22
		global SDL_GetTicks
		SDL_GetTicks:
			dd 0x9979
		global SDL_PollEvent
		SDL_PollEvent:
			dd 0xf481
		global SDL_Delay
		SDL_Delay:
			dd 0xf67c
		global __libc_start_main
		__libc_start_main:
			dd 0x4aa8
		global _Exit
		_Exit:
			dd 0x3397
db 0
_symbols.end:
%include "loader32.asm"

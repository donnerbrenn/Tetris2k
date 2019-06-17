; vim: set ft=nasm:
bits 64
%include "header64.asm"
dynamic.needed:
    dq 1;DT_NEEDED
    dq (_symbols.libc - _strtab)
    dq 1;DT_NEEDED
    dq (_symbols.libsdl2_2 - _strtab)
dynamic.symtab:
    dq DT_SYMTAB        ; d_tag
    dq 0                ; d_un.d_ptr
dynamic.end:
%ifndef UNSAFE_DYNAMIC
    dq DT_NULL
%endif
[section .rodata.neededlibs]
_strtab:
	_symbols.libc: db "libc.so.6",0
	_symbols.libsdl2_2: db "libSDL2-2.0.so.0",0
[section .data.smolgot]
_symbols:
global exit
exit:
		_symbols.libc.exit: dq 0x7c967e3f
global __libc_start_main
__libc_start_main:
		_symbols.libc.__libc_start_main: dq 0xf63d4e2e
global SDL_GetTicks
SDL_GetTicks:
		_symbols.libsdl2_2.SDL_GetTicks: dq 0xb38f265
global SDL_Delay
SDL_Delay:
		_symbols.libsdl2_2.SDL_Delay: dq 0x34dd93b6
global SDL_uitoa
SDL_uitoa:
		_symbols.libsdl2_2.SDL_uitoa: dq 0x385699a9
global SDL_Init
SDL_Init:
		_symbols.libsdl2_2.SDL_Init: dq 0x3fac837b
global SDL_sinf
SDL_sinf:
		_symbols.libsdl2_2.SDL_sinf: dq 0x3fc376b7
global SDL_FillRect
SDL_FillRect:
		_symbols.libsdl2_2.SDL_FillRect: dq 0x41dc825c
global SDL_CreateWindow
SDL_CreateWindow:
		_symbols.libsdl2_2.SDL_CreateWindow: dq 0x4acb1f33
global SDL_PollEvent
SDL_PollEvent:
		_symbols.libsdl2_2.SDL_PollEvent: dq 0x92f25140
global SDL_OpenAudioDevice
SDL_OpenAudioDevice:
		_symbols.libsdl2_2.SDL_OpenAudioDevice: dq 0xb45f4c3b
global SDL_PauseAudioDevice
SDL_PauseAudioDevice:
		_symbols.libsdl2_2.SDL_PauseAudioDevice: dq 0xdc2da7c7
global SDL_UpdateWindowSurface
SDL_UpdateWindowSurface:
		_symbols.libsdl2_2.SDL_UpdateWindowSurface: dq 0xf0fa782b
global SDL_GetWindowSurface
SDL_GetWindowSurface:
		_symbols.libsdl2_2.SDL_GetWindowSurface: dq 0xf6f06c68
db 0
_symbols.end:
_smolplt:
_smolplt.end:
%include "loader64.asm"

default: all

BIN=bin
OBJ=obj
SRC=src

CC=gcc-8

LIBS=-lSDL2
LDFLAGS= $(LIBS) 
LDFLAGS+=-Wl,--print-gc-sections
LDFLAGS+=-Wl,--build-id=none
LDFLAGS+=-Wl,-z,norelro
LDFLAGS+=-Wl,-z,nocombreloc
LDFLAGS+=-Wl,--gc-sections 
LDFLAGS+=-fuse-ld=gold
LDFLAGS+=-nodefaultlibs -nostdlib
LDFLAGS+=-nostartfiles 
LDFLAGS+=-Wl,--spare-dynamic-tags=7
LDFLAGS+=-Wl,--whole-archive

CFLAGS=-Os -s -Wall -Wextra -Wpedantic
CFLAGS+= -fno-plt
CFLAGS+= -fno-stack-protector -fno-stack-check -fno-stack-limit
CFLAGS+= -fno-unwind-tables -fno-asynchronous-unwind-tables
CFLAGS+= -fno-exceptions
CFLAGS+= -funsafe-math-optimizations -ffast-math
CFLAGS+= -fomit-frame-pointer
CFLAGS+= -fno-pic -fno-PIC
CFLAGS+= -no-pie -fno-PIE 
CFLAGS+= -ffunction-sections -fdata-sections 
CFLAGS+= -mno-fancy-math-387 -mno-ieee-fp 
CFLAGS+= -std=gnu11 -march=nocona -malign-data=cacheline

STRIP= -R .bss
STRIP+=-R .gnu.hash
STRIP+=-R .note
STRIP+=-R .note.GNU-stack
STRIP+=-R .comment
STRIP+=-R .eh_frame
STRIP+=-R .eh_frame_hdr
STRIP+=-R .got
STRIP+=-R .got.plt
STRIP+=-R .gnu.version
STRIP+=-R .shstrtab
STRIP+=-R .gnu.version_r
STRIP+=-R .data

main.o: $(SRC)/tetris.c
	$(CC) -c -o $@ $< $(CFLAGS) 
	wc -c $@

main.elf: main.o
	 $(CC) $(CFLAGS) $(LDFLAGS)  $< -o $@ -Wl,--verbose

main.nover: main.elf
	./noelfver $< > $@
	
main.stripped: main.nover
	objcopy $< $(STRIP) -R .note.gnu.gold-version
	readelf -as $<
	sstrip -z $<
	mv $< $@
	wc -c $@

main.lzma: main.stripped
	python3 opt_lzma.py $< -o $@

vondehi.elf: vondehi/vondehi.asm
	-rm $@
	nasm -fbin  -DNO_CHEATING -DNO_UBUNTU_COMPAT -o"$@" "$<"

t2k: vondehi.elf main.lzma
	cat $^ > $@
	chmod +x t2k
	-rm main.* vondehi.elf
	wc -c t2k

all: t2k

clean:
	-rm t2k main*
	-rm vondehi

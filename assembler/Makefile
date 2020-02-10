STRIP= -R .bss
STRIP+=-R .note
STRIP+=-R .comment
STRIP+=-R .eh_frame
STRIP+=-R .eh_frame_hdr
STRIP+=-R .got
STRIP+=-R .got.plt
STRIP+=-R .gnu.hash
STRIP+=-R .gnu
STRIP+=-R .shstrtab
STRIP+=-R .data

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

GCC=gcc-8

t2k.noelfver: t2k.elf
	./noelfver $< > $@

t2k.stripped: t2k.noelfver
	strip $< $(STRIP)
	readelf -as $<
	sstrip -z $<
	mv $< $@
	wc -c $@



t2k.elf: assembler.S
	$(GCC) -c -o $@.o $< $(CFLAGS)
	$(GCC) $(CFLAGS) $(LDFLAGS)  $@.o -o $@ -Wl,--verbose
	wc -c $@

t2k.packed: t2k.stripped
	python3 opt_lzma.py $< -o $@

t2k.vndh: vondehi.elf t2k.packed
	cat $^ > $@
	chmod +x $@

t2k: t2k.vndh
	mv $< $@
	wc -c $@


all: t2k

clean: 
	-rm t2k*

default: all

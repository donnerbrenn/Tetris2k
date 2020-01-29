default: all

BIN=bin
OBJ=obj
SRC=src

CC=gcc-8

LIBS=-lSDL2
LDFLAGS=$(LIBS) -Wl,--entry -Wl,_start -Wl,--print-gc-sections  -Wl,--build-id=none -Wl,-z,norelro

CFLAGS=-Os -s
CFLAGS+= -fno-plt
CFLAGS+= -fno-stack-protector -fno-stack-check -fno-stack-limit
CFLAGS+= -fno-unwind-tables -fno-asynchronous-unwind-tables
CFLAGS+= -fno-exceptions
CFLAGS+= -funsafe-math-optimizations -ffast-math
CFLAGS+= -fomit-frame-pointer
CFLAGS+= -fno-pic -fno-PIC
CFLAGS+= -no-pie -fno-PIE
CFLAGS+= -ffunction-sections -fdata-sections -Wl,--gc-sections
CFLAGS+= -mno-fancy-math-387 -mno-ieee-fp #-flto
CFLAGS+= -nodefaultlibs -nostartfiles -std=gnu11 -fuse-ld=gold

STRIP= -R .bss
STRIP+=-R .gnu.hash
STRIP+=-R .note
STRIP+=-R .comment
STRIP+=-R .eh_frame
STRIP+=-R .eh_frame_hdr
STRIP+=-R .note.gnu.build-id
STRIP+=-R .got
STRIP+=-R .got.plt
STRIP+=-R .gnu.version
STRIP+=-R .shstrtab
STRIP+=-R .gnu.version_r
STRIP+=-R .note.ABI-tag
STRIP+=-R .note.gnu.gold-version
STRIP+=-S 


main.o: $(SRC)/tetris.c
	$(CC) -c -o $@ $< $(CFLAGS) -march=nano
	wc -c $@

main: main.o
	$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@

main.nover: main
	./noelfver $< > $@

main.stripped: main.nover
	strip $< $(STRIP)
	readelf -as $<
	sed -i 's/_edata/\x00\x00\x00\x00\x00\x00/g' $<;
	sed -i 's/__bss_start/\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00/g' $<;
	sed -i 's/_end/\x00\x00\x00\x00/g' $<;
	sed -i 's/GLIBC_2\.2\.5/\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00/g' $<;
	sstrip -z $<
	mv $< $@
	wc -c $@

main.lzma: main.stripped
	python3 opt_lzma.py $< -o $@

vondehi/vondehi: vondehi/vondehi.asm
	-rm $@
	nasm -fbin -DNO_CHEATING -DNO_FILE_MANAGER_COMPAT -DNO_UBUNTU_COMPAT -o"$@" "$<"

t2k: vondehi/vondehi main.lzma
	cat $^ > $@
	chmod +x t2k
	rm main.lzma main.stripped main main.o
	wc -c t2k

all: t2k

clean:
	-rm t2k
	-rm vondehi/vondehi

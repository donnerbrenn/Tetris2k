BIN=bin
OBJ=obj
SRC=src

CC=gcc

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
CFLAGS+= -nolibc -nodefaultlibs -nostartfiles -std=gnu11

main.o: $(SRC)/tetris.c
	$(CC) -c -o $@ $< $(CFLAGS) -march=nano
	wc -c $@

main: main.o
	$(CC) $(CFLAGS) -lSDL2 $< -o $@

main.nover: main
	./noelfver $< > $@

main.stripped: main.nover
	strip $< -R .note -R .comment -R .eh_frame -R .eh_frame_hdr -R .note.gnu.build-id -R .got -R .got.plt -R .gnu.version -R .shstrtab -R .gnu.version_r -R .note.ABI-tag -R .note.gnu.gold-version -s 
	sed -i 's/_edata/\x00\x00\x00\x00\x00\x00/g' $<;
	sed -i 's/__bss_start/\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00/g' $<;
	sed -i 's/_end/\x00\x00\x00\x00/g' $<;
	sed -i 's/GLIBC_2\.2\.5/\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00/g' $<;
	sstrip -z $<
	mv $< $@

main.lzma: main.stripped
	python3 opt_lzma.py $< -o $@

t2k: shelldropper.sh main.lzma
	cat $^ > $@
	chmod +x t2k
	wc -c t2k

all: t2k

clean:
	-rm main.lzma main.stripped main.o t2k

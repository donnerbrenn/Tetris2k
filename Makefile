LIBS := -lSDL2

BITS=64#$(shell getconf LONG_BIT)

BIN=bin
OBJ=obj
SRC=src


#CC=gcc-8


CFLAGS=-Os -s
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
CFLAGS+= -flto -nostdlib -std=gnu11

all : $(BIN)/ t2k t2k.sh

%/:
	mkdir -p $@

packer : vondehi/vondehi.asm 
	cd vondehi; nasm -DNO_FILE_MANAGER_COMPAT -fbin -o vondehi vondehi.asm

main.o: $(SRC)/tetris.c Makefile
ifeq ($(BITS),32)
	$(CC) -m$(BITS) -c -o $@ $< $(CFLAGS) -march=i386
else
	$(CC) -m$(BITS) -c -o $@ $< $(CFLAGS) -march=core2
endif

crt1.o: $(SRC)/crt1.c
	$(CC) -m$(BITS) -c -o $@ $< $(CFLAGS)
	
main.needssmol.o: main.o crt1.o
	$(CC) -m$(BITS) -Wl,-i -flinker-output=nolto-rel -o "$@" $^ $(CFLAGS)  \
 		-Wl,--entry -Wl,_start -Wl,--print-gc-sections
main.symbols.asm: main.needssmol.o
ifeq ($(BITS),32)
	python3 smol/src/smol.py -s --det $(LIBS) -lc "$<" "$@"
else
	python3 smol/src/smol.py --det $(LIBS) -lc "$<" "$@"
endif

main.smolstub.o: main.symbols.asm
	nasm -DUSE_INTERP -DNO_START_ARG -DUNSAFE_DYNAMIC -DUSE_DNLOAD_LOADER -DALIGN_STACK -felf$(BITS) -I smol/rt/ -o "$@" "$^"
main.elf: main.needssmol.o main.smolstub.o
ifeq ($(BITS),32)
	ld -Map=smol.map --cref -m elf_i386 -nostartfiles -T smol/ld/link.ld --oformat=binary -o "$@" $^
else
	ld -Map=smol.map --cref -m elf_x86_64 -nostartfiles -T smol/ld/link.ld --oformat=binary -o "$@" $^
endif	
t2k.sh : main.elf.bad_packed
	mv $< $@
	wc -c $@
	mv $@ $(BIN)

t2k : main.elf.packed
	mv $< $@
	wc -c $@
	mv $@ $(BIN)

%.xz : % Makefile
	-rm $@
	# lzma --format=lzma -9 --extreme --lzma1=preset=9,lc=0,lp=0,pb=0,nice=24 --keep --stdout $< > $@
	python3 ./opt_lzma.py $< -o $@

%.packed : %.xz packer Makefile
	cat ./vondehi/vondehi $< > $@
	chmod +x $@

%.bad_packed : %.xz shelldropper.sh Makefile
	cat shelldropper.sh $< > $@
	chmod +x $@

clean:
	rm -rf main.elf *.asm *.map *.o $(BIN)/

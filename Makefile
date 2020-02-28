CC = cc-8

CFLAGS = -Os -s -march=nocona  -fverbose-asm
CFLAGS+= -fno-plt #-fdump-tree-all
CFLAGS+= -fno-stack-protector -fno-stack-check
CFLAGS+= -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-exceptions
CFLAGS+= -funsafe-math-optimizations -ffast-math
CFLAGS+= -fomit-frame-pointer
CFLAGS+= -ffunction-sections -fdata-sections 
CFLAGS+= -fmerge-all-constants 
CFLAGS+= -fno-PIC -fno-PIE
CFLAGS+= -std=gnu11
CFLAGS+= -malign-data=cacheline
CFLAGS+= -mno-fancy-math-387 -mno-ieee-fp

# CFLAGS+=-flto

LIBS=-lSDL2
LDFLAGS=$(LIBS)
LDFLAGS+=-nostartfiles -nostdlib -nodefaultlibs
LDFLAGS+=-Wl,--build-id=none 
LDFLAGS+=-Wl,-z,norelro
LDFLAGS+=-Wl,-z,nocombreloc
LDFLAGS+=-Wl,--gc-sections 
LDFLAGS+=-Wl,--hash-style=sysv
LDFLAGS+=-Wl,-z,nodynamic-undefined-weak
LDFLAGS+=-Wl,--no-ld-generated-unwind-info
LDFLAGS+=-Wl,--no-eh-frame-hdr
LDFLAGS+=-Wl,-z,noseparate-code 
LDFLAGS+=-Wl,--hash-style=sysv
LDFLAGS+=-no-pie -fno-pic
LDFLAGS+=-Wl,--whole-archive
LDFLAGS+=-Wl,--print-gc-sections
LDFLAGS+=-Wl,--spare-dynamic-tags=4
LDFLAGS+=-Wl,-flto -T linker.ld

STRIP+=-R .got
STRIP+=-R .got.plt
STRIP+=-R .bss
STRIP+=-R .hash

all: 
all: t2k

vondehi.elf: vondehi/vondehi.asm
	nasm -fbin  -DNO_CHEATING -DNO_UBUNTU_COMPAT -o"$@" "$<"
	wc -c $@

%.o: %.c
	$(CC) $(CFLAGS) -S $< -o $@.S
	grep -v 'GCC:\|note.GNU-stack' $@.S > $@.S.S
	mv $@.S.S $@.S
	$(CC) $(CFLAGS) -c $@.S -o $@

t2k.elf: src/t2k.o
	$(CC) -Wl,-Map=src/t2k.map $(CFLAGS) $(LDFLAGS) $< -o $@


%.stripped: %.elf
	./noelfver $< > $@
	objcopy $(STRIP) $@
	readelf -a  $@
	sstrip -z $@
	wc -c $@

%.lzma: %.stripped
	python3 opt_lzma.py $< -o $@

t2k.smol: src/t2k.o #not working - hopefully i can find a solution for the crashing smol-binary
	python3 smol/src/smol.py  -lSDL2 "src/t2k.o" "t2k.smol.syms.asm"
	nasm -I smol/rt/ -f elf64 -DALIGN_STACK -DUSE_INTERP  t2k.smol.syms.asm -o stub.t2k.start.o
	cc -Wl,-Map=t2k.map -m64 -T smol/ld/link.ld -Wl,--oformat=binary -m64 -nostartfiles -nostdlib src/t2k.o stub.t2k.start.o -o $@
	wc -c $@

t2k: vondehi.elf t2k.lzma #t2k.smol
	cat $^ > $@
	chmod +x $@
	# rm t2k.*
	rm src/t2k.o
	rm $^
	wc -c $@ 

t2k.cmix: t2k.stripped
	cmix -c $< $@.cm
	cat cmix/cmixdropper.sh $@.cm > $@
	rm $@.cm
	chmod +x $@
	wc -c $@

clean:
	-rm -f t2k* src/t2k.o*
	-rm vondehi/vondehi.elf

CC = cc-8

CFLAGS = -Os -s -march=nocona  -fverbose-asm
CFLAGS+= -fno-plt
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

LIBS=-lSDL2 -lGL# -lc
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
LDFLAGS+=-Wl,--spare-dynamic-tags=2
LDFLAGS+=-T linker.ld


all: t2k

src/shader.h: src/shader.glsl
	mono ./shader_minifier.exe $< -o $@ 

vondehi.elf: vondehi/vondehi.asm
	nasm -fbin  -DNO_CHEATING -DNO_UBUNTU_COMPAT -o"$@" "$<"
	wc -c $@

%.o: %.c src/shader.h
	$(CC) $(CFLAGS) -S $< -o $@.S #-DDEBUG
	grep -v 'GCC:\|note.GNU-stack' $@.S > $@.S.S
	mv $@.S.S $@.S
	$(CC) $(CFLAGS) -c $@.S -o $@

t2k.elf: src/t2k.o
	$(CC) -Wl,-Map=src/t2k.map $(CFLAGS) $(LDFLAGS) $< -o $@
	wc -c $@


%.stripped: %.elf
	./noelfver $< > $@
	strip --strip-all -R .crap $@
	readelf -a  $@
	./Section-Header-Stripper/section-stripper.py $@
	wc -c $@

%.lzma: %.stripped
	./nicer.py $< -o $@ -v
	./LZMA-Vizualizer/LzmaSpec $@
	./LZMA-Vizualizer/contrib/parsemap.py --lzmaspec ./LZMA-Vizualizer/LzmaSpec $@ src/t2k.map

t2k.smol: src/t2k.o #not working - hopefully i can find a solution for the crashing smol-binary
	python3 smol/src/smol.py  -lSDL2 "src/t2k.o" "t2k.smol.syms.asm"
	nasm -I smol/rt/ -f elf64 -DALIGN_STACK -DUSE_INTERP  t2k.smol.syms.asm -o stub.t2k.start.o
	cc -Wl,-Map=t2k.map -m64 -T smol/ld/link.ld -Wl,--oformat=binary -m64 -nostartfiles -nostdlib src/t2k.o stub.t2k.start.o -o $@
	wc -c $@

t2k.cmix: t2k.stripped
	cmix -c $< $@.cm
	cat cmix/cmixdropper.sh $@.cm > $@
	rm $@.cm
	chmod +x $@
	wc -c $@

heatmap: t2k.lzma
	../LZMA-Vizualizer/LzmaSpec $<
	wc -c $<
	rm $<

clean:
	-rm -f t2k* src/t2k.o*
	-rm vondehi/vondehi.elf
	-rm src/shader.h


VNDH_FLAGS :=-l -v --vndh vondehi --vndh_unibin
t2k: t2k.stripped
	./autovndh.py $(VNDH_FLAGS) "$<" > "$@"
	chmod +x $@
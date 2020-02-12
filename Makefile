CC = cc-8

CFLAGS = -Os -s -march=nocona 
CFLAGS+= -fno-plt
CFLAGS+= -fno-stack-protector -fno-stack-check
CFLAGS+= -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-exceptions
CFLAGS+= -funsafe-math-optimizations -ffast-math
CFLAGS+= -fomit-frame-pointer
CFLAGS+= -ffunction-sections -fdata-sections 
CFLAGS+= -fno-unroll-loops -fmerge-all-constants 
CFLAGS+= -fno-PIC
CFLAGS+= -fno-PIE -std=gnu11


LDFLAGS=-lSDL2
LDFLAGS+=-nostartfiles -nostdlib -nodefaultlibs
LDFLAGS+=-Wl,--build-id=none 
LDFLAGS+=-Wl,-z,norelro
LDFLAGS+=-Wl,-z,nocombreloc
LDFLAGS+=-Wl,--gc-sections 
LDFLAGS+=-Wl,--hash-style=sysv
# LDFLAGS+=-fuse-ld=gold 
LDFLAGS+=-Wl,-z,nodynamic-undefined-weak
LDFLAGS+=-Wl,--no-ld-generated-unwind-info
LDFLAGS+=-Wl,--no-eh-frame-hdr
LDFLAGS+=-Wl,-z,noseparate-code 
LDFLAGS+=-Wl,--hash-style=sysv
# LDFLAGS+=-Wl,-flto
LDFLAGS+=-no-pie  -fno-pic
LFLAGS+=-Wl,--whole-archive
LDFLAGS+=-Wl,--print-gc-sections


STRIP=-R .gnu.hash
STRIP+=-R .comment
STRIP+=-R .note.GNU-stack
STRIP+=-R .data
STRIP+=-R .note.gnu.gold-version
STRIP+=-R .note
STRIP+=-R .note.ABI-tag
STRIP+=-R .shstrtab
STRIP+=-R .eh_frame
STRIP+=-R .eh_frame_hdr
STRIP+=-R .got
STRIP+=-R .got.plt
STRIP+=-R .bss
STRIP+=-R .shstrtab  
STRIP+=-R .init
STRIP+=-R .fini
STRIP+=-R .hash
STRIP+=-R .init_array 
STRIP+=-R .fini_array 
# STRIP+=-R .gnu.version_r




all: 
all: t2k

debug: LFLAGS += -ggdb
debug: cmix

vondehi.elf: vondehi/vondehi.asm
	nasm -fbin  -DNO_CHEATING -DNO_UBUNTU_COMPAT -o"$@" "$<"


%.o: %.cpp
	$(CC) $(CFLAGS) -c $< -o $@

t2k: src/tetris.o vondehi.elf
	# python3 smol/src/smol.py -d -lSDL2 src/tetris.o "t2k.smol.syms.asm"
	# nasm -f elf64 -g -F dwarf -DUSE_INTERP -DUSE_DNLOAD_LOADER -I "smol/rt/" -o "src/t2k.smol.stub.o" "t2k.smol.syms.asm"
	# ld -m elf_x86_64 -nostartfiles --oformat=binary -T smol/ld/link.ld -Map=main.smol.map --cref -o "t2k.smol" src/t2k.smol.stub.o
	# mv t2k.smol $@.noelfver

	$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
	strip -s $@
	objcopy $(STRIP) $@
	./noelfver $@ > $@.noelfver
	readelf -S $@
	sstrip -z $@.noelfver
	wc -c $@.noelfver
	python3 opt_lzma.py $@.noelfver -o $@.lzma
	cat vondehi.elf $@.lzma > $@
	chmod +x $@
	wc -c $@

clean:
	-rm -f t2k*
	-rm src/tetris.o
	-rm vondehi.elf
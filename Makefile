OBJDIR := obj
BINDIR := bin
SRCDIR := smol/rt
PYDIR  := smol/src
LDDIR  := smol/ld
TESTDIR:= test

BITS ?= 32#$(shell getconf LONG_BIT)

# -mpreferred-stack-boundary=3 messes up the stack and kills SSE!
#COPTFLAGS=-Os  -fwhole-program -fno-plt \
#  -ffast-math -funsafe-math-optimizations -fno-stack-protector -fomit-frame-pointer \
#  -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables

COPTFLAGS=-Os 
COPTFLAGS+= -march=i386
COPTFLAGS+= -mtune=i386
COPTFLAGS+= -fno-plt
COPTFLAGS+= -fwhole-program
COPTFLAGS+= -fno-stack-protector
COPTFLAGS+= -fno-stack-check
COPTFLAGS+= -fno-unwind-tables
COPTFLAGS+= -fno-asynchronous-unwind-tables
COPTFLAGS+= -fno-exceptions
COPTFLAGS+= -funsafe-math-optimizations
COPTFLAGS+= -fomit-frame-pointer
COPTFLAGS+= -ffast-math
COPTFLAGS+= -no-pie
COPTFLAGS+= -flto
COPTFLAGS+= -fno-pic
COPTFLAGS+= -ffunction-sections
COPTFLAGS+= -fdata-sections
COPTFLAGS+= -fno-plt 
CFLAGS= -std=gnu11 -nostartfiles $(COPTFLAGS) # -DUSE_DL_FINI

ASFLAGS=-I $(SRCDIR)/
LDFLAGS_ :=

LDFLAGS += -m$(BITS) -Wl,--build-id=none -Wl,--hash-style=gnu -Wl,-z,norelro
ASFLAGS += -f elf$(BITS)
LDFLAGS_ := -m$(BITS)

LDFLAGS += -nostartfiles -nostdlib 
LDFLAGS_ := $(LDFLAGS_) -T $(LDDIR)/link.ld -Wl,--oformat=binary $(LDFLAGS)

CFLAGS   += -m$(BITS) 


LIBS=-lc -lSDL2

SMOLFLAGS += -s
ASFLAGS   +=  -DUSE_INTERP -DNO_START_ARG -DUNSAFE_DYNAMIC -DUSE_DNLOAD_LOADER  #-DALIGN_STACK
#-DUSE_DNLOAD_LOADER #-DUSE_DT_DEBUG #-DUSE_DL_FINI #-DNO_START_ARG #-DUNSAFE_DYNAMIC

NASM    ?= nasm
PYTHON3 ?= python3

all:  $(BINDIR)/tetris-crt.vondehi $(BINDIR)/tetris-crt.shelldropper  $(BINDIR)/tetris-crt  #$(BINDIR)/tetris $(BINDIR)/tetris.vondehi $(BINDIR)/tetris-crt.shelldropper $(BINDIR)/tetris.shelldropper
	rm $(BINDIR)/*.lzma
	wc -c $^ | sort
	


clean:
	@$(RM) -vrf $(OBJDIR) $(BINDIR)

%/:
	@mkdir -vp "$@"

.SECONDARY:



$(OBJDIR)/%.lto.o: $(SRCDIR)/%.c $(OBJDIR)/
	$(CC)  $(CFLAGS) -c "$<" -o "$@"

$(OBJDIR)/%.lto.o: $(TESTDIR)/%.c $(OBJDIR)/
	$(CC)  $(CFLAGS) -c "$<" -o "$@"

$(OBJDIR)/%.o: $(SRCDIR)/%.c $(OBJDIR)/
	$(CC) $(CFLAGS) -c "$<" -o "$@"

$(OBJDIR)/%.o: $(TESTDIR)/%.c $(OBJDIR)/
	$(CC) $(CFLAGS) -c "$<" -o "$@"

$(OBJDIR)/%.start.o: $(OBJDIR)/%.lto.o $(OBJDIR)/crt1.lto.o
	$(CC) $(LDFLAGS) -r -o "$@" $^

$(OBJDIR)/symbols.%.asm: $(OBJDIR)/%.o
	$(PYTHON3) $(PYDIR)/smol.py $(SMOLFLAGS) $(LIBS) "$<" "$@"

$(OBJDIR)/stub.%.o: $(OBJDIR)/symbols.%.asm $(SRCDIR)/header$(BITS).asm $(SRCDIR)/loader$(BITS).asm
	$(NASM) $(ASFLAGS) $< -o $@

$(OBJDIR)/stub.%.start.o: $(OBJDIR)/symbols.%.start.asm $(SRCDIR)/header$(BITS).asm $(SRCDIR)/loader$(BITS).asm
	$(NASM) $(ASFLAGS) $< -o $@


$(BINDIR)/%.vondehi: ext/vondehi $(OBJDIR)/%.o $(OBJDIR)/stub.%.o $(BINDIR)/
	$(CC) -Wl,-Map=$(BINDIR)/$*.map $(LDFLAGS_) $(OBJDIR)/$*.o $(OBJDIR)/stub.$*.o -o "$@"
	#./smol/rmtrailzero.py "$@" "$(OBJDIR)/$(notdir $@)" && mv "$(OBJDIR)/$(notdir $@)" "$@" && chmod +x "$@"
	mv "$@" t
	lzma --format=lzma -9 --extreme --lzma1=preset=9,lc=0,lp=0,pb=0 t
	cat ext/vondehi t.lzma > "$@" && rm t.lzma && chmod +x "$@"

$(BINDIR)/%:  $(OBJDIR)/%.o $(OBJDIR)/stub.%.o $(BINDIR)
	$(CC) -Wl,-Map=$(BINDIR)/$*.map $(LDFLAGS_) $(OBJDIR)/$*.o $(OBJDIR)/stub.$*.o -o "$@"


$(BINDIR)/%.shelldropper: ext/shelldropper  $(OBJDIR)/%.o $(OBJDIR)/stub.%.o $(BINDIR)
	$(CC) -Wl,-Map=$(BINDIR)/$*.map $(LDFLAGS_) $(OBJDIR)/$*.o $(OBJDIR)/stub.$*.o -o "$@"
	./smol/rmtrailzero.py "$@" "$(OBJDIR)/$(notdir $@)" && mv "$(OBJDIR)/$(notdir $@)" "$@" && chmod +x "$@"
	mv "$@" t &&lzma --format=lzma -9 --extreme --lzma1=preset=9,lc=1,lp=0,pb=0 t
	cat ext/shelldropper t.lzma > "$@" && rm t.lzma && chmod +x "$@"

$(BINDIR)/%-crt: $(OBJDIR)/%.start.o $(OBJDIR)/stub.%.start.o $(BINDIR)/
	$(CC) -Wl,-Map=$@.map $(LDFLAGS_) $(OBJDIR)/$*.start.o $(OBJDIR)/stub.$*.start.o -o "$@"


$(BINDIR)/%-crt.lzma: $(BINDIR)/%-crt
	lzma --format=lzma -9 --extreme --lzma1=preset=9,lc=0,lp=0,pb=0 --stdout $< > $@

$(BINDIR)/%-crt.vondehi: ext/vondehi $(BINDIR)/%-crt.lzma
	cat $^ > $@
	chmod +x $@

$(BINDIR)/%-crt.shelldropper: ext/shelldropper $(BINDIR)/%-crt.lzma
	cat $^ > $@
	chmod +x $@
	




.PHONY: all clean
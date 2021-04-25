BITS ?=64#$(shell getconf LONG_BIT)

OBJDIR := obj
BINDIR := bin
RTDIR := rt
SRCDIR:= src

SYNTH=true
SCORE=true
DECO=false

NASM ?= nasm
OBJCOPY ?= objcopy

CC=gcc-8
USELTO=false
ALIGNSTACK=true

ifeq ($(BITS),32)
	SECTIONORDER=dt
else
	SECTIONORDER=td
endif

#dlfixup, dnload or default
ifeq ($(BITS),64)
	SMOLLOADER=dlfixup
else
	SMOLLOADER=dnload
endif


COPTFLAGS= -Os -march=nocona
COPTFLAGS+= -fno-plt -fno-stack-protector -fno-stack-check -fno-unwind-tables \
	-fno-asynchronous-unwind-tables -fomit-frame-pointer -ffast-math -no-pie \
	-fno-pic -fno-PIE -ffunction-sections -fdata-sections -fmerge-all-constants \
	-funsafe-math-optimizations -malign-data=cacheline -fsingle-precision-constant \
	 -fno-exceptions -mno-fancy-math-387 -mno-ieee-fp -fno-builtin -mfpmath=387 


ifeq ($(BITS),32)
	-mpreferred-stack-boundary=2 -falign-functions=1 -falign-jumps=1 -falign-loops=1 
endif

ifeq ($(SYNTH),true)
	COPTFLAGS += -DSYNTH 
endif
ifeq ($(SCORE),true)
	COPTFLAGS += -DSCORE 
endif
ifeq ($(DECO),true)
	COPTFLAGS += -DDECO
endif

ifeq ($(USELTO),true)
	COPTFLAGS+=-flto
endif


CFLAGS = -std=gnu11 -nodefaultlibs -fno-PIC $(COPTFLAGS) -m$(BITS)
CFLAGS += -Wall -Wextra #-Wpedantic

LIBS = -lSDL2 -lc

PWD ?= .

SMOLFLAGS = --smolrt "$(PWD)/smol/rt" --smolld "$(PWD)/smol/ld" \
	 -g -fno-start-arg -fno-ifunc-support --section-order=$(SECTIONORDER)
ifeq ($(ALIGNSTACK),true)
	SMOLFLAGS+=-falign-stack
else
	SMOLFLAGS+=-fno-align-stack
endif
ifeq ($(SMOLLOADER),dlfixup)
	SMOLFLAGS+= -fuse-$(SMOLLOADER)-loader
endif
ifeq ($(SMOLLOADER),dnload)
	SMOLFLAGS+= -fuse-$(SMOLLOADER)-loader -c
endif

# SMOLFLAGS += -I /lib/ld*.so

PYTHON3 ?= python3

all: vndh #sh cmix

$(BINDIR)/t2k: $(BINDIR)/t2k.smol
	./autovndh.py $(VNDH_FLAGS) $< > $@
	chmod +x $@

clean:
	@$(RM) -vrf $(OBJDIR) $(BINDIR)

%/:
	@mkdir -vp "$@"

bin/t2k.okp: bin/t2k.smol
	./makeokp.sh

.SECONDARY:

$(OBJDIR)/%.o: $(SRCDIR)/%.c $(OBJDIR)/
	$(CC) $(CFLAGS) -c "$<" -o "$@"
	$(OBJCOPY) $@ --set-section-alignment *=1 -g -x -X -S --strip-unneeded
	size $@

VNDH_FLAGS :=-l -v --vndh vondehi 
$(BINDIR)/%.dbg $(BINDIR)/%.smol: $(OBJDIR)/%.o $(BINDIR)/
	$(PYTHON3) ./smol/smold.py --debugout "$@.dbg" $(SMOLFLAGS) --ldflags=-Wl,-Map=$(BINDIR)/$*.map $(LIBS) "$<" "$@"
	$(PYTHON3) ./smol/smoltrunc.py "$@" "$(OBJDIR)/$(notdir $@)" && mv "$(OBJDIR)/$(notdir $@)" "$@" && chmod +x "$@"
	wc -c $@

$(BINDIR)/%.lzma: $(BINDIR)/t2k.smol
	./autovndh.py $(VNDH_FLAGS) --nostub  $< > $@
	rm $<

heatmap: $(BINDIR)/%.lzma
	../LZMA-Vizualizer/LzmaSpec $<
	@stat --printf="$@: %s bytes\n" $<
	rm $<

$(BINDIR)/t2k.sh: shelldropper.sh $(BINDIR)/t2k.lzma
	cat $^ > $@
	chmod +x $@

xlink: $(BINDIR)/t2k.smol
	cat $< | ~/coding/xlink/bin/xlink

cmix: $(BINDIR)/t2k.cmix
	wc -c $<

vndh: $(BINDIR)/t2k
	wc -c $<

# $(BINDIR)/t2k.okp: $(BINDIR)/t2k.smol
# 	cp $< oneKpaq
# 	cd oneKpaq
# 	pwd
# 	./onekpaq.py 1 3 t2k.smol t2k.okp --stub oneKpaq/onekpaq_stub_lnx32.asm
# 	mv oneKpaq/t2k.okp $@
	


okp: $(BINDIR)/t2k.okp
	wc -c $<

sh: $(BINDIR)/t2k.sh
	wc -c $<

$(BINDIR)/t2k.cmix: $(BINDIR)/t2k.smol
	cmix -c $< $@.cm
	cat cmix/cmixdropper.sh $@.cm > $@
	rm $@.cm
	chmod +x $@
	@stat --printf="$@: %s bytes\n" $@

.PHONY: all clean

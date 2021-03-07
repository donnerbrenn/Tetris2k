OBJDIR := obj
BINDIR := bin
RTDIR := rt
SRCDIR:= src

NASM ?= nasm
OBJCOPY ?= objcopy


CC=gcc-8
USELTO=false
SMOLLOADER=dlfixup
ALIGNSTACK=false

BITS ?= $(shell getconf LONG_BIT)

COPTFLAGS= -Os -march=nocona
COPTFLAGS+= -fno-plt -fno-stack-protector -fno-stack-check -fno-unwind-tables \
	-fno-asynchronous-unwind-tables -fomit-frame-pointer -ffast-math -no-pie \
	-fno-pic -fno-PIE -ffunction-sections -fdata-sections -fmerge-all-constants \
	-funsafe-math-optimizations -malign-data=cacheline -fsingle-precision-constant \
	-fwhole-program -fno-exceptions -fvisibility=hidden \
	-mno-fancy-math-387 -mno-ieee-fp 
COPTFLAGS += -DSYNTH 
COPTFLAGS += -DSCORE 
# COPTFLAGS += -DALIGN
# COPTFLAGS += -DDECO


CFLAGS = -g -std=gnu11 -nodefaultlibs -fno-PIC $(COPTFLAGS) -m$(BITS)
CFLAGS += -Wall -Wextra #-Wpedantic

LIBS = -lSDL2 -lc

PWD ?= .

SMOLFLAGS = --smolrt "$(PWD)/smol/rt" --smolld "$(PWD)/smol/ld" \
	-c  -fuse-$(SMOLLOADER)-loader -fno-start-arg -fno-ifunc-support -funsafe-dynamic \
	# --hang-on-startup

# SMOLFLAGS = --smolrt "$(PWD)/smol/rt" --smolld "$(PWD)/smol/ld" \
# 	-g -c -fuse-dlfixup-loader -fno-start-arg -fno-ifunc-support -funsafe-dynamic


PYTHON3 ?= python3

all: vndh #sh cmix

$(BINDIR)/t2k: $(BINDIR)/t2k.smol
	./autovndh.py $(VNDH_FLAGS) $< > $@
	chmod +x $@

clean:
	@$(RM) -vrf $(OBJDIR) $(BINDIR)

%/:
	@mkdir -vp "$@"

.SECONDARY:

$(OBJDIR)/%.o: $(SRCDIR)/%.c $(OBJDIR)/
ifeq ($(USELTO),true)
	$(CC) $(CFLAGS) -flto -c "$<" -o "$@"
else
	$(CC) $(CFLAGS) -c "$<" -o "$@"
endif
	$(OBJCOPY) $@ --set-section-alignment *=1 -g -x -X -S --strip-unneeded
	size $@

VNDH_FLAGS :=-l -v --vndh vondehi 
$(BINDIR)/%.dbg $(BINDIR)/%.smol: $(OBJDIR)/%.o $(BINDIR)/
ifeq ($(ALIGNSTACK),true)
	$(PYTHON3) ./smol/smold.py -falign-stack --debugout "$@.dbg" $(SMOLFLAGS) --ldflags=-Wl,-Map=$(BINDIR)/$*.map $(LIBS) "$<" "$@"
else
	$(PYTHON3) ./smol/smold.py -fno-align-stack --debugout "$@.dbg" $(SMOLFLAGS) --ldflags=-Wl,-Map=$(BINDIR)/$*.map $(LIBS) "$<" "$@"
endif
	$(PYTHON3) ./smol/smoltrunc.py "$@" "$(OBJDIR)/$(notdir $@)" && mv "$(OBJDIR)/$(notdir $@)" "$@" && chmod +x "$@"
	wc -c $@

$(BINDIR)/%.lzma: $(BINDIR)/t2k.smol
	./autovndh.py $(VNDH_FLAGS) --nostub  "$<" > "$@"
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
	

sh: $(BINDIR)/t2k.sh
	wc -c $<

$(BINDIR)/t2k.cmix: $(BINDIR)/t2k.smol
	cmix -c $< $@.cm
	cat cmix/cmixdropper.sh $@.cm > $@
	rm $@.cm
	chmod +x $@
	@stat --printf="$@: %s bytes\n" $@

.PHONY: all clean


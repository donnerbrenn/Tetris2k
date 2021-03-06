OBJDIR := obj
BINDIR := bin
RTDIR := rt
SRCDIR:= src

NASM ?= nasm
OBJCOPY ?= objcopy

CC=gcc-8

BITS ?= $(shell getconf LONG_BIT)

COPTFLAGS= -Os -march=nocona
COPTFLAGS+= -fno-plt -fno-stack-protector -fno-stack-check -fno-unwind-tables \
	-fno-asynchronous-unwind-tables -fomit-frame-pointer -ffast-math -no-pie \
	-fno-pic -fno-PIE -ffunction-sections -fdata-sections -fmerge-all-constants \
	-funsafe-math-optimizations -malign-data=cacheline -fsingle-precision-constant \
	-fwhole-program -fno-exceptions -fvisibility=hidden \
	-mpreferred-stack-boundary=4 -mno-fancy-math-387 -mno-ieee-fp #-flto 

CFLAGS = -g -std=gnu11 -nodefaultlibs -fno-PIC $(COPTFLAGS) -m$(BITS)
CFLAGS += -Wall -Wextra #-Wpedantic

LIBS = -lSDL2 -lc

PWD ?= .

SMOLFLAGS = --smolrt "$(PWD)/smol/rt" --smolld "$(PWD)/smol/ld" \
	-c -fuse-dnload-loader -fno-start-arg -fno-ifunc-support -funsafe-dynamic 

# SMOLFLAGS = --smolrt "$(PWD)/smol/rt" --smolld "$(PWD)/smol/ld" \
# 	-g -c -fuse-dlfixup-loader -fno-start-arg -fno-ifunc-support -funsafe-dynamic


PYTHON3 ?= python3

all: vndh #heatmap

$(BINDIR)/t2k: $(BINDIR)/t2k.smol
	./autovndh.py $(VNDH_FLAGS) $< > $@
	chmod +x $@

clean:
	@$(RM) -vrf $(OBJDIR) $(BINDIR)

%/:
	@mkdir -vp "$@"

.SECONDARY:

$(OBJDIR)/%.o: $(SRCDIR)/%.c $(OBJDIR)/
	$(CC) $(CFLAGS) -c "$<" -o "$@"
	$(OBJCOPY) $@ --set-section-alignment *=1 -g -x -X -S --strip-unneeded
	size $@

VNDH_FLAGS :=-l -v --vndh vondehi #--vndh_unibin
$(BINDIR)/%.dbg $(BINDIR)/%.smol: $(OBJDIR)/%.o $(BINDIR)/
	$(PYTHON3) ./smol/smold.py --debugout "$@.dbg" $(SMOLFLAGS) --ldflags=-Wl,-Map=$(BINDIR)/$*.map $(LIBS) "$<" "$@"
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


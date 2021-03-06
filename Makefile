OBJDIR := obj
BINDIR := bin
SRCDIR := rt
TESTDIR:= src

NASM ?= nasm
OBJCOPY ?= objcopy

CC=gcc

BITS ?= $(shell getconf LONG_BIT)

COPTFLAGS= -Os -march=nocona
COPTFLAGS+= -fno-plt -fno-stack-protector -fno-stack-check -fno-unwind-tables \
  -fno-asynchronous-unwind-tables -fomit-frame-pointer -ffast-math -no-pie \
  -fno-pic -fno-PIE -ffunction-sections -fdata-sections \
  -fmerge-all-constants -mno-fancy-math-387 -mno-ieee-fp -funsafe-math-optimizations \
  -fsingle-precision-constant -flto -nostdlib -nostartfiles \
  -fwhole-program -fno-exceptions -mpreferred-stack-boundary=3 -fvisibility=hidden -flto 

CFLAGS=-g -Wall -Wextra -Wpedantic -std=gnu11 -nostartfiles -fno-PIC $(COPTFLAGS) #-DUSE_DL_FINI
CFLAGS   += -m$(BITS) $(shell pkg-config --cflags sdl2)

LIBS = -lSDL2 -lc

PWD ?= .

SMOLFLAGS = --smolrt "$(PWD)/smol/rt" --smolld "$(PWD)/smol/ld" \
  --verbose -g -c -fuse-dlfixup-loader -fno-start-arg -funsafe-dynamic 

PYTHON3 ?= python3

all: vndh #cmix

$(BINDIR)/t2k: $(BINDIR)/t2k.smol
	./autovndh.py $(VNDH_FLAGS) $< > $@
	chmod +x $@

clean:
	@$(RM) -vrf $(OBJDIR) $(BINDIR)

%/:
	@mkdir -vp "$@"

.SECONDARY:

$(OBJDIR)/%.o: $(TESTDIR)/%.c $(OBJDIR)/
	$(CC) $(CFLAGS) -c "$<" -o "$@"

VNDH_FLAGS :=-l -v --vndh vondehi #--vndh_unibin
$(BINDIR)/%.dbg $(BINDIR)/%.smol: $(OBJDIR)/%.o $(BINDIR)/
	$(PYTHON3) ./smol/smold.py --debugout "$@.dbg" $(SMOLFLAGS) --ldflags=-Wl,-Map=$(BINDIR)/$*.map $(LIBS) "$<" "$@"
	$(PYTHON3) ./smol/smoltrunc.py "$@" "$(OBJDIR)/$(notdir $@)" && mv "$(OBJDIR)/$(notdir $@)" "$@" && chmod +x "$@"

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
	chmod +x $@

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


CC = cc-8

CFLAGS = -Os -s -march=nocona 
CFLAGS += -fno-plt
CFLAGS += -fno-stack-protector -fno-stack-check
CFLAGS += -fno-PIC -fno-PIE
CFLAGS += -Wall
CFLAGS += -no-pie
CFLAGS += -nostartfiles -nostdlib 

LIBS=-lSDL2 -lc

VNDH_FLAGS :=-l -v --vndh vondehi --vndh_unibin
SMOLARGS= -c -fuse-interp -falign-stack -fuse-dnload-loader -funsafe-dynamic -fuse-dt-debug -fno-start-arg --det

all: t2k

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@


%.lzma: %.smol
	./autovndh.py $(VNDH_FLAGS) --nostub  "$<" > "$@"
	rm $<


t2k.smol: src/t2k.o
	python3 ./smol/smold.py --smolrt "smol/rt" --smolld "smol/ld" $(SMOLARGS)  $(LIBS) $< $@
	wc -c $@

t2k.cmix: t2k.smol
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


t2k: t2k.smol
	./autovndh.py $(VNDH_FLAGS) "$<" > "$@"
	rm $<
	chmod +x $@
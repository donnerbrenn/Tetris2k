CC = cc-8

CFLAGS = -Os -s -march=nocona 
CFLAGS += -fno-plt
CFLAGS += -fno-stack-protector -fno-stack-check
CFLAGS += -fno-PIC -fno-PIE
CFLAGS += -Wall
CFLAGS += -no-pie

LIBS=-lSDL2

all: t2k

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

%.lzma: %.smol
	./nicer.py $< -o $@ -v

SMOLARGS= -fuse-interp -falign-stack -fuse-dnload-loader -funsafe-dynamic -fuse-dt-debug -fno-start-arg --det
t2k.smol: src/t2k.o
	python3 ./smol/smold.py --smolrt "$(PWD)/smol/rt" --smolld "$(PWD)/smol/ld" $(SMOLARGS)  $(LIBS) $< $@
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
	-rm vondehi/vondehi.elf

VNDH_FLAGS :=-l -v --vndh vondehi --vndh_unibin
t2k: t2k.smol
	./autovndh.py $(VNDH_FLAGS) "$<" > "$@"
	chmod +x $@
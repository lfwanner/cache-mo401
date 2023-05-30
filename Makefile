CCPREFIX=
CC=$(CCPREFIX)riscv64-unknown-elf-gcc
override CFLAGS+=-std=gnu99 -O2 -ffast-math -fno-common -fno-builtin-printf -fno-tree-loop-distribute-patterns
LDFLAGS=-static -nostdlib -nostartfiles -lm -lgcc -T bare.ld -DPREALLOCATE=1 -mcmodel=medany

objects = mmult.bin
all: $(objects)

$(objects): %.bin: %.c
	$(CC) $(CFLAGS) $(LDFLAGS) crt.S syscalls.c -o $@ $<

clean:
	rm -r *.bin


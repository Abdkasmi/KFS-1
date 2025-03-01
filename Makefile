CC = gcc
ASM = nasm
LD = ld
CFLAGS = -m32 -ffreestanding -nostdlib -fno-builtin -fno-stack-protector
ASMFLAGS = -f elf32
LDFLAGS = -m elf_i386 -T linker.ld

KERNEL = kernel.bin
ISO = kernel.iso

all: $(KERNEL) $(ISO)

$(KERNEL): boot.o kernel.o
	$(LD) $(LDFLAGS) -o $@ $^

boot.o: boot.asm
	$(ASM) $(ASMFLAGS) -o $@ $<

kernel.o: kernel.c
	$(CC) $(CFLAGS) -c -o $@ $<

$(ISO): $(KERNEL)
	mkdir -p isodir/boot/grub
	cp $(KERNEL) isodir/boot/
	echo 'menuentry "My Kernel" {' > isodir/boot/grub/grub.cfg
	echo '  multiboot /boot/kernel.bin' >> isodir/boot/grub/grub.cfg
	echo '}' >> isodir/boot/grub/grub.cfg
	grub-mkrescue -o $(ISO) isodir

re: clean all

clean:
	rm -f *.o $(KERNEL) $(ISO)
	rm -rf isodir

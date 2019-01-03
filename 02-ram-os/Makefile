-include env.mk

# Find GCC
#ifndef GCCPREFIX
GCCPREFIX := $(shell if objdump -i 2>&1 | grep 'elf64-x86-64' > /dev/null 2>&1; \
			then echo ''; \
\
			else echo "---" 1>&2 ; \
			echo "Cannot find GCC" 1>&2; \
			echo "Please specify GCCPREFIX in env.mk" 1>&2; \
			echo "---" 1>&2; \
			exit 1; \
		fi)

# Find QEMU
ifndef QEMU_SYSTEM
QEMU_SYSTEM := qemu-system-x86_64
endif

ifndef QEMU
QEMU := $(shell if which qemu > /dev/null 2>&1; \
			then echo qemu; exit; \
			elif which $(QEMU_SYSTEM) > /dev/null 2>&1; \
			then echo $(QEMU_SYSTEM); exit; \
			else echo "---" 1>&2; \
			echo "Cannot find QEMU" 1>&2; \
			echo "Please specify QEMU in env.mk" 1>&2; \
			echo "---" 1>&2; \
			exit 1; \
		fi)
endif
AS := $(GCCPREFIX)as
LD := $(GCCPREFIX)ld

LDFLAGS := -m elf_i386 --oformat binary

all: qemu

os.img: os.o image.ld
	$(LD) $(LDFLAGS) -T image.ld -o $@ $<

os.o: boot.S
	$(AS) --32 -n -o $@ $<

qemu: os.img
	$(QEMU) $< --nographic

qemu-x: os.img
	$(QEMU) $< 

qemu-gdb: os.img
	$(QEMU) --nographic -drive file=$<,format=raw -gdb tcp::8900 -S

gdb: debug.gdb
	gdb -n -x $<

clean:
	rm os.img os.o

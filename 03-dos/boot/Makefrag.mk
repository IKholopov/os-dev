BOOTDIR = ./boot
$(OBJDIR)/boot.o: $(BOOTDIR)/boot.S $(BOOTDIR)/bprintf.S
	$(AS) --32 -n -o $@ $<

$(OBJDIR)/libos.a: $(OBJDIR)/boot.o
	$(AR) r -o $@ $^

BOOT_OBJ := $(OBJDIR)/boot.o
$(IMGDIR)/boot.img: $(BOOT_OBJ) $(BOOTDIR)/boot.ld
	$(LD) $(LDFLAGS) -T $(BOOTDIR)/boot.ld -o $@ $(BOOT_OBJ)

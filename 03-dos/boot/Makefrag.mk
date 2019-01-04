BOOTDIR = ./boot

$(OBJDIR)/blib.o: $(BOOTDIR)/bprintf.S $(BOOTDIR)/bdisk.S
	$(AS) --32 -n -o $@ $^
$(OBJDIR)/boot.o: $(BOOTDIR)/boot.S
	$(AS) --32 -n -o $@ $<

BOOT_OBJ := $(OBJDIR)/boot.o $(OBJDIR)/blib.o 
$(IMGDIR)/boot.img: $(BOOT_OBJ) $(BOOTDIR)/boot.ld
	$(LD) $(LDFLAGS) -T $(BOOTDIR)/boot.ld -o $@ $(BOOT_OBJ)

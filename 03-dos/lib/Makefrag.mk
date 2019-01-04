LIBDIR := ./lib
$(OBJDIR)/lib.o: $(LIBDIR)/disk.S
	$(AS) --32 -n -o $@ $^

$(OBJDIR)/libos.a: $(OBJDIR)/blib.o $(OBJDIR)/lib.o
	$(AR) r -o $@ $^

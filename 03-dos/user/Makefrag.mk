USRDIR := ./user

USER_OBJ := $(OBJDIR)/main.o
$(OBJDIR)/main.o: $(USRDIR)/main.S
	$(AS) --32 -n -o $@ $<

$(IMGDIR)/user.img: $(USER_OBJ) $(OBJDIR)/libos.a $(USRDIR)/user.ld
	$(LD) $(LDFLAGS) -T $(USRDIR)/user.ld -o $@ $(USER_OBJ) -L./$(OBJDIR) -los

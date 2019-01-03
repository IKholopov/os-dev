all: os.img

os.img: os.o
	ld --oformat binary -o $@ $<

os.o: boot.S
	as -o $@ $<

clean:
	rm os.img os.o

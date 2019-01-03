.global _start
.text
_start:
	mov $0x0e, %ah
	mov $'H, %al
	int $0x10
	mov $'i, %al
	int $0x10
	mov $',, %al
	int $0x10
	mov $' , %al
	int $0x10
	mov $'b, %al
	int $0x10
	mov $'o, %al
	int $0x10
	mov $'o, %al
	int $0x10
	mov $'t, %al
	int $0x10
	mov $' , %al
	int $0x10
	mov $'O, %al
	int $0x10
	mov $'S, %al
	int $0x10
	mov $'!, %al
	int $0x10
	mov $'\r, %al
	int $0x10
	mov $'\n, %al
	int $0x10
	
	jmp .
	
.space 510-(.-_start)
.word 0xaa55	

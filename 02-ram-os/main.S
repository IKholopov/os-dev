.code16
.globl _main
.text	
_main:
	pushw %bp
	mov %sp, %bp
	
	pushw $0x10
	pushw $0x9000
	movw $message, %bx
	call bprintf

	mov %bp, %sp
	pop %bp
	ret
.data
message:
	.ascii "Lena is %h/%h!\r\n\0"

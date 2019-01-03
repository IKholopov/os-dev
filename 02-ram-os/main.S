.code16
.globl _main
.text	
_main:
	pushw %bp
	mov %sp, %bp
	
	movw $message, %bx
	call bprintf
	
	pushw $0xFD90
	pushw $0xAB7
	movw $message_fmt, %bx
	call bprintf

	mov %bp, %sp
	pop %bp
	ret
.data
message:
	.ascii "Hello, RAM OS!\r\n\0"
message_fmt:
	.ascii "First value is %h and second is %h. That is it?\r\n\0"

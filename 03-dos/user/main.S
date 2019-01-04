.code16
.globl _main
.text	
_main:
	pushw %bp
	mov %sp, %bp
	
	movw $message, %bx
	call bprintf

	movb $0x03, %ch
	movb $0x01, %dh
	movw $0x9800, %bx
	call bdiskload

	movw $0x9800, %si
	pushw (%si)
	movw $0x9802, %si
	pushw (%si)
	movw $message_fmt, %bx
	call bprintf

	popw %ax
	addw $0x01, %ax
	movw $0x9802, %si
	movw %ax, (%si)
	popw %ax
	addw $0x05, %ax
	shlw %ax
	movw $0x9800, %si
	movw %ax, (%si)

	movb $0x03, %ch
	movb $0x01, %dh
	movw $0x9800, %bx
	call bdiskstore

	mov %bp, %sp
	pop %bp
	ret
.data
message:
	.ascii "Hello, RAM OS!\r\n\0"
message_fmt:
	.ascii "You ran me %h times. Current secret is %h?\r\n\0"

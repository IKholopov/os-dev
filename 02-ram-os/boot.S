.code16
.globl _boot_start	
.text
_boot_start:
	movb $0x0e, %ah 	# Set up tty
	movw $0x8000, %bp	# Set up stack
	movw %bp, %sp		
	movw $ram_msg, %bx	# Print welcoming message
	call bprintf
	movw $hello_message, %bx
	call bprintf
	
	jmp .

bprintf:
	movb (%bx), %al
	cmp $0, %al
	je bprintf_ret
	int $0x10
	incw %bx
	jmp bprintf
bprintf_ret:
	ret

.data
hello_message:
	.ascii "Hello, RAM OS!\r\n\0"
ram_msg:
	.ascii "RAM OS v1.0\r\n\0"

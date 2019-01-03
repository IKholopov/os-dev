.code16
.globl _start	
boot_start:
.text
_start:
	mov $0x0e, %ah
	movw $hello_message, %bx
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

hello_message:
	.ascii "Hello, RAM OS!\r\n\0"
	
.space 510-(.-boot_start)
.word 0xaa55	

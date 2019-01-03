.code16
.globl _boot_start	
.text
_boot_start:
	mov $0x0e, %ah
	movw $ram_msg, %bx
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

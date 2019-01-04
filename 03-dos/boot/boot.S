.code16
.globl _boot_start	
.text
_boot_start:
	movw $0x8000, %bp	# Set up stack
	movw %bp, %sp		
	movw $ram_msg, %bx	# Print welcoming message
	call bprintf
	movb $0x02, %ch
	movb $0x04, %dh
	movw $0x9000, %bx
	call bdiskload
	movw $0x9000, %ax
	call %ax
	movw $finished_msg, %bx
	call bprintf
	jmp .
	
.data
ram_msg:
	.ascii "RAM OS v1.0\r\n\0"
finished_msg:
	.ascii "Execution finished\r\n\0"

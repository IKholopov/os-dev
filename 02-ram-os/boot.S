.code16
.globl _boot_start	
.text
_boot_start:
	movw $0x9000, %bp	# Set up stack
	movw %bp, %sp		
	movw $ram_msg, %bx	# Print welcoming message
	call bprintf
	call _main
	jmp .
	
.include "bprintf.S"
.data
ram_msg:
	.ascii "RAM OS v1.0\r\n\0"

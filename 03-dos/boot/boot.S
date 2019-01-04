.code16
.globl _boot_start	
.text
_boot_start:
	movw $0x8000, %bp	# Set up stack
	movw %bp, %sp		
	movw $ram_msg, %bx	# Print welcoming message
	call bprintf
	# call _main
	movw $finished_msg, %bx
	call bprintf
	jmp .
	
.data
ram_msg:
	.ascii "RAM OS v1.0\r\n\0"
finished_msg:
	.ascii "Execution finished\r\n\0"

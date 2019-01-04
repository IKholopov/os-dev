.globl  bdiskload
.code16
.text
bdiskload:			# load from disk %dh sectors,
				# starting at %ch sector
	pushw %dx
	movb $0x02, %ah 	# Read disk
	movb %ch, %cl		# Start from sector %ch
	movb %dh, %al		# Read %dh sectors
	movb $0x0, %ch		# Cylinder 0
	movb $0x0, %dh		# Head 0
	int $0x013		# Read with interupt
	
	jc bdiskload_failure		# Carry flag is set -> error
	popw %dx
	cmp %dh, %al
	jne bdiskload_failure
	ret
bdiskload_failure:
	mov $diskload_failure_msg, %bx
	call bprintf
	jmp .


.data
diskload_failure_msg:	
	.ascii "Failed to read disk!\r\n\0"

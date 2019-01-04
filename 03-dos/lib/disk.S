.globl  bdiskstore
.code16
.text	
	
bdiskstore:			# store to disk %dh sectors,
				# starting at %ch sector
	pushw %dx
	movb $0x03, %ah 	# Write to disk
	movb %ch, %cl		# Start from sector %ch
	movb %dh, %al		# Read %dh sectors
	movb $0x0, %ch		# Cylinder 0
	movb $0x0, %dh		# Head 0
	int $0x013		# Read with interupt
	
	jc bdiskstore_failure		# Carry flag is set -> error
	popw %dx
	cmp %dh, %al
	jne bdiskstore_failure
	ret
bdiskstore_failure:
	mov $diskstore_failure_msg, %bx
	call bprintf
	jmp .

.data
diskstore_failure_msg:
	.ascii "Failed to write disk!\r\n\0"

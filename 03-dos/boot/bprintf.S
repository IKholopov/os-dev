.code16
.globl bprintf
.text	
bprintc:
	movb $0x0e, %ah
	movb (%bx), %al
	int $0x10
	ret
	
bprintf:
	pushw %bp
	movw %sp, %bp
	movw $4, %si
bprintf_next_char:	
	movb (%bx), %al
	cmpb $0, %al
	je bprintf_ret
	cmpb $'%, %al
	je bprintf_subtitution
bprintf_regular:	
	call bprintc
	jmp bprintf_continue
bprintf_subtitution:
	incw %bx
	movb (%bx), %al
	cmpb $'h, %al
	je bprintf_hex
	decw %bx
	jmp bprintf_regular
bprintf_hex:
	pushw %bx
	movw (%bp, %si), %bx
	pushw $0
	call bprintf_get_value_and_shift
	mov %al, %ch
	call bprintf_get_value_and_shift
	mov %al, %cl
	pushw %cx
	call bprintf_get_value_and_shift
	mov %al, %ch
	call bprintf_get_value_and_shift
	mov %al, %cl
	pushw %cx 
	movb $'x, %ch
	movb $'0, %cl
	pushw %cx
	movw %sp, %bx
	call bprintf
	addw $2, %si
	addw $8, %sp
	popw %bx
	jmp bprintf_continue
bprintf_continue:
	incw %bx
	jmp bprintf_next_char
bprintf_ret:
	popw %bp
	ret
bprintf_get_value_and_shift:
	movw %bx, %ax
	andb $0x0F, %al
	shrw $4, %bx
	cmp $9, %al
	jg bprintf_get_value_and_shift_letter
	addb $'0, %al
	ret
bprintf_get_value_and_shift_letter:
	addb $'7, %al
	ret


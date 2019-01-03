.code16
.globl _main
.text	
_main:	
	movw $hello_message, %bx
	call bprintf
	pushw $0x9BC0
	pushw $0x03AF
	movw $test_format, %bx
	call bprintf
.data
hello_message:
	.ascii "Hello, RAM OS!\r\n\0"
test_format:
	.ascii "test %h and other is %h value\r\n\0"

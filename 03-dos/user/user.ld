OUTPUT_FORMAT(binary)
ENTRY(_start)
SECTIONS
{
	MNT_POINT = 0x9000;
	. = MNT_POINT;
	.text :
	{
	      *(.text);
	}
	.data :
	{
	      *(.data);
	}
}

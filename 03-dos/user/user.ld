OUTPUT_FORMAT(binary)
ENTRY(_start)
SECTIONS
{
	MNT_POINT = 0x7e00;
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

OUTPUT_FORMAT(binary)
ENTRY(_boot_start)
SECTIONS
{
	BOOT_MNT = 0x7c00;
	BOOT_DATA_OFFSET = 0x150;
	BOOT_MAGIC_OFFSET = 0x1fe;
	. = BOOT_MNT;
	.text :
	{
	      *(.text);
	      . = BOOT_DATA_OFFSET;
	}
	.data :
	{
	      *(.data);
	      . = BOOT_MAGIC_OFFSET - BOOT_DATA_OFFSET;
	      SHORT(0xaa55);
	}
}

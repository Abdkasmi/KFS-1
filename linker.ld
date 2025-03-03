/*
ENTRY(start)                /* Define the entry point (must match the symbol in your ASM code) */
/*
SECTIONS {
    . = 1M;                 /* Start loading the kernel at 1 MB (conventional for kernels) */
 /*   
    .multiboot : {
        *(.multiboot);      /* Include all .multiboot sections */
/*    }: text

    .text : {
        *(.text);           /* Include all .text sections */
/*    }: text
    
    /* Read-only data section */
/*    .rodata : {
        *(.rodata)
    }: text

    /* Data section (writable, not executable) */
/*    .data : {
        *(.data)
    }: data

    .bss : {                /* Uninitialized data section */
/*        *(.bss);
    }: data
}
    /* Define program headers for RWX permissions */
/*PHDRS {
    text PT_LOAD FLAGS(5);   /* R-X (5 = Read + Execute) */
/*    data PT_LOAD FLAGS(6);   /* RW- (6 = Read + Write) */
/*}
*/

OUTPUT_FORMAT(elf32-i386)
ENTRY(_start)
SECTIONS
{
	. = 2M;

	.text BLOCK(4K) : ALIGN(4K)
	{
		*(.multiboot)
		*(.text)
	}

	.rodata BLOCK(4K) : ALIGN(4K)
	{
		*(.rodata)
	}
}

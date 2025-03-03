ENTRY(start)                /* Define the entry point (must match the symbol in your ASM code) */

SECTIONS {
    . = 1M;                 /* Start loading the kernel at 1 MB (conventional for kernels) */
    
    /* Define program headers for RWX permissions */
    PHDRS {
        text PT_LOAD FLAGS(5);   /* R-X (5 = Read + Execute) */
        data PT_LOAD FLAGS(6);   /* RW- (6 = Read + Write) */
    }
    
    .multiboot : {
        *(.multiboot);      /* Include all .multiboot sections */
    }: text

    .text : {
        *(.text);           /* Include all .text sections */
    }: text
    
    /* Read-only data section */
    .rodata : {
        *(.rodata)
    }: text

    /* Data section (writable, not executable) */
    .data : {
        *(.data)
    }: data

    .bss : {                /* Uninitialized data section */
        *(.bss);
    }: data
}

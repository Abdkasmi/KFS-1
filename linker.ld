ENTRY(start)                /* Define the entry point (must match the symbol in your ASM code) */

SECTIONS {
    . = 1M;                 /* Start loading the kernel at 1 MB (conventional for kernels) */

    .multiboot : {
        *(.multiboot);      /* Include all .multiboot sections */
    }

    .text : {
        *(.text);           /* Include all .text sections */
    }
    
    /* Read-only data section */
    .rodata : {
        *(.rodata)
    }

    /* Data section (writable, not executable) */
    .data : {
        *(.data)
    }

    .bss : {                /* Uninitialized data section */
        *(.bss);
    }
}

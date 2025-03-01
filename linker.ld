ENTRY(start)                /* Define the entry point (must match the symbol in your ASM code) */

SECTIONS {
    . = 1M;                 /* Start loading the kernel at 1 MB (conventional for kernels) */

    .multiboot : {          /* Ensure the multiboot header is at the beginning */
        *(.multiboot);      /* Include all .multiboot sections */
    }

    .text : {               /* Code section */
        *(.text);           /* Include all .text sections */
    }

    .bss : {                /* Uninitialized data section */
        *(.bss);            /* Include all .bss sections */
    }
}

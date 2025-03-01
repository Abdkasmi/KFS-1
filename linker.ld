ENTRY(start)
SECTIONS {
    . = 1M; /* Start at 1MB (conventional for kernels) */
    .text : { *(.multiboot) *(.text) }
    .bss : { *(.bss) }
}

bits 32
section .multiboot
    dd 0x1BADB002              ; Magic number for GRUB
    dd 0x00                    ; Flags
    dd - (0x1BADB002 + 0x00)   ; Checksum

section .text
global start
extern kernel_main             ; Defined in the C kernel

start:
    cli                        ; Disable interrupts
    mov esp, stack_space       ; Set up stack
    call kernel_main           ; Call the kernel main function
    hlt                        ; Halt the CPU

section .bss
resb 8192                      ; Reserve 8KB for the stack
stack_space:

section .note.GNU-stack noalloc noexec nowrite progbits

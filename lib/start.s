.intel_syntax noprefix

.section .init_array
    .quad _init

.section .fini_array
    .quad _fini

.globl _init
_init:
    ret

.globl _fini
_fini:
    ret

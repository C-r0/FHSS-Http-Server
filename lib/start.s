.intel_syntax noprefix

.section .init_array, "aw"
    .quad _init

.section .fini_array, "aw"
    .quad _fini

.section .text
.globl _init
_init:
    ret

.globl _fini
_fini:
    ret

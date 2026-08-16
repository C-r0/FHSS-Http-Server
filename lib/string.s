.intel_syntax noprefix

.text
.globl print
.type print, @function
print:
    mov rax, 1
    syscall
    ret

.globl strcmp
.type strcmp, @function
strcmp:
    # rdi
    # rsi
.strcmp_loop:
    mov al, byte [rdi]
    cmp al, byte[rsi]
    jne .strcmp_not_equal
    test al, al
    je .strcmp_equal
    inc rdi
    inc rsi
    jmp .strcmp_loop
.strcmp_not_equal:
    mov rax, 1
    ret
.strcmp_equal:
    mov rax, 0
    ret

.globl strlen
.type strlen, @function
strlen:
    # rdi
    xor rax, rax
.strlen_loop:
    cmp byte ptr [rdi + rax], 0
    je .strlen_done
    inc rax
    jmp .strlen_loop
.strlen_done:
    ret

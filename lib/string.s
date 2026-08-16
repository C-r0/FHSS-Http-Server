.intel_syntax noprefix

.section .text
.globl print
.type print, @function
print:
    # rdi = fd
    # rsi = buf
    # rdx = len

    mov rax, 1
    syscall
    ret

.globl strcmp
.type strcmp, @function
strcmp:
    # rdi = str1
    # rsi = str2
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
    # rdi = str

    xor rax, rax
.strlen_loop:
    cmp byte ptr [rdi + rax], 0
    je .strlen_done
    inc rax
    jmp .strlen_loop
.strlen_done:
    ret

.globl inttostr
.type inttostr, @function
inttostr:
    # RECEIVE
    # rdi = int
    # rsi = buf
    # SEND
    # rax = int
    # rdx = int

    mov r10, rsi

    test rdi, rdi
    je .inttostr_zero

    mov rax, rdi
    xor rcx, rcx
    mov rbx, 10
.inttostr_loop:
    xor edx, edx
    div rbx
    add dl, 48
    push rdx
    inc rcx
    test rax, rax
    jne .inttostr_loop
.inttostr_save_nofchar:
    mov r8, rcx
.inttostr_write_string:
    pop rdx
    mov byte ptr [r10], dl
    inc r10
    dec rcx
    jne .inttostr_write_string
    mov byte ptr [r10], 0
    mov rax, r8
    ret
.inttostr_zero:
    mov byte ptr [r10], '0'
    mov byte ptr [r10+1], 0
    xor rax, rax
    ret

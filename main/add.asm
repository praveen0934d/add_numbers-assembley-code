section .text
global _start

add_numbers:
    push rbp
    mov rbp, rsp

    mov rax, rdi
    add rax, rsi

    pop rbp
    ret


_start:
    and rsp, -16
    mov rdi, 10
    mov rsi, 5
    call add_numbers

    mov rax, 60
    xor rdi, rdi
    syscall
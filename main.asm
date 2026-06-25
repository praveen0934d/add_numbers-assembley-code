; main.asm — calls add_numbers and prints result
section .data
    fmt db "Sum: %d", 10, 0

section .text
global main
extern add_numbers
extern printf

main:
    push rbp
    mov rbp, rsp

    mov rdi, 10
    mov rsi, 20
    call add_numbers

    mov rsi, rax
    lea rdi, [fmt]
    xor rax, rax
    call printf

    mov rsp, rbp
    pop rbp
    ret
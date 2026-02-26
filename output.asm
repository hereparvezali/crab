section .data

section .bss

section .text
global _start

_start:
    push rbp
    mov rbp, rsp
    sub rsp, 16

    ; let x = ...
    mov rax, 5
    push rax
    mov rax, 2
    pop rbx
    cqo
    idiv rbx
    push rax
    mov rax, 6
    push rax
    mov rax, 4
    pop rbx
    imul rax, rbx
    pop rbx
    cqo
    idiv rbx
    mov [rbp-8], rax

    ; let y = ...
    mov rax, 1
    mov [rbp-16], rax

.while_start_0:
    ; while condition
    mov rax, [rbp-16]
    push rax
    mov rax, [rbp-8]
    pop rbx
    cmp rax, rbx
    setg al
    movzx rax, al
    cmp rax, 0
    je .while_end_1
    ; while body
    ; x = ...
    mov rax, [rbp-16]
    push rax
    mov rax, [rbp-8]
    pop rbx
    sub rax, rbx
    mov [rbp-8], rax

    jmp .while_start_0
.while_end_1:

    ; exit
    mov rax, [rbp-16]
    push rax
    mov rax, [rbp-8]
    pop rbx
    add rax, rbx
    mov rdi, rax
    mov rax, 60
    syscall


    ; default exit
    mov rax, 60
    xor rdi, rdi
    syscall

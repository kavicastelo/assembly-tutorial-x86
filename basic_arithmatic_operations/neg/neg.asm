section .data
    fmt db "Result: %d", 10, 0

section .bss

section .text
global main
extern printf

main:
    ; Function prologue
    push rbp
    mov rbp, rsp

    ; Call negation function with parameter 10
    mov rdi, 10
    call neg

    ; Print the result using printf
    mov rcx, fmt  ; First argument: format string
    mov rdx, rax  ; Second argument: result of negation
    call printf

    ; Function epilogue
    mov eax, 0
    pop rbp
    ret

neg:
    neg rdi
    ret

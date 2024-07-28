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

    ; Call mod function with parameters 10 and 4
    mov rdi, 10
    mov rsi, 4
    call mod

    ; Print the result using printf
    mov rcx, fmt  ; First argument: format string
    mov rdx, rax  ; Second argument: result of mod
    call printf

    ; Function epilogue
    mov eax, 0
    pop rbp
    ret

mod:
    mov rax, rdi
    mov rdx, 0
    div rsi
    mov rax, rdx
    ret

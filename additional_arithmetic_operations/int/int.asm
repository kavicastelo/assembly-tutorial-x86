section .data
    fmt db "Integer Part: %d", 10, 0

section .text
global main
extern printf

main:
    ; Function prologue
    push rbp
    mov rbp, rsp

    ; Call int function with parameter 10.5 (simulated with 10 for simplicity)
    mov rdi, 10
    call integer

    ; Print the result using printf
    mov rcx, fmt  ; First argument: format string
    mov rdx, rax  ; Second argument: result of int
    call printf

    ; Function epilogue
    mov eax, 0
    pop rbp
    ret

integer:
    ; Function prologue
    push rbp
    mov rbp, rsp

    ; Simply pass the integer value
    mov rax, rdi

    ; Function epilogue
    pop rbp
    ret

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

    ; Call divide function with parameters 8 and 4
    mov rdi, 8
    mov rsi, 4
    call divide

    ; Print the result using printf
    mov rcx, fmt  ; First argument: format string
    mov rdx, rax  ; Second argument: result of divide
    call printf

    ; Function epilogue
    mov eax, 0
    pop rbp
    ret

divide:
    ; Function prologue
    push rbp
    mov rbp, rsp

    ; Access parameters
    mov rax, rdi   ; rax = first parameter (a)
    cqo            ; Sign-extend rax into rdx:rax
    idiv rsi       ; rax = a / b, rdx = a % b

    ; Function epilogue
    pop rbp
    ret

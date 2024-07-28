section .data
    fmt db "Quotient: %d", 10, 0

section .text
global main
extern printf

main:
    ; Function prologue
    push rbp
    mov rbp, rsp

    ; Call qty function with parameters 10 and 4
    mov rdi, 10
    mov rsi, 4
    call quantity

    ; Print the result using printf
    mov rcx, fmt  ; First argument: format string
    mov rdx, rax  ; Second argument: result of qty
    call printf

    ; Function epilogue
    mov eax, 0
    pop rbp
    ret

quantity:
    ; Function prologue
    push rbp
    mov rbp, rsp

    ; Perform division
    mov rax, rdi
    cqo            ; Sign-extend rax into rdx:rax
    idiv rsi       ; rax = a / b, rdx = a % b

    ; Function epilogue
    pop rbp
    ret

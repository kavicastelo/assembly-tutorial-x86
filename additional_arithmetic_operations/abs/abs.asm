section .data
    fmt db "Absolute Value: %d", 10, 0

section .text
global main
extern printf

main:
    ; Function prologue
    push rbp
    mov rbp, rsp

    ; Call abs function with parameter -10
    mov rdi, -10
    call absoluteVal

    ; Print the result using printf
    mov rcx, fmt  ; First argument: format string
    mov rdx, rax  ; Second argument: result of abs
    call printf

    ; Function epilogue
    mov eax, 0
    pop rbp
    ret

absoluteVal:
    ; Function prologue
    push rbp
    mov rbp, rsp

    ; Check if the value is negative
    test rdi, rdi
    jns .done  ; If non-negative, skip negation
    neg rdi    ; Negate the value
.done:
    mov rax, rdi

    ; Function epilogue
    pop rbp
    ret

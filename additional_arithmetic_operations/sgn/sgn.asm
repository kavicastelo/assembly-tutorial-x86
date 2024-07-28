section .data
    fmt db "Signum: %d", 10, 0

section .text
global main
extern printf

main:
    ; Function prologue
    push rbp
    mov rbp, rsp

    ; Call sgn function with parameter -10
    mov rdi, -10
    call sgn

    ; Print the result using printf
    mov rcx, fmt  ; First argument: format string
    mov rdx, rax  ; Second argument: result of sgn
    call printf

    ; Function epilogue
    mov eax, 0
    pop rbp
    ret

sgn:
    ; Function prologue
    push rbp
    mov rbp, rsp

    ; Determine the sign
    test rdi, rdi
    jz .zero  ; If zero, jump to zero case
    js .negative ; If negative, jump to negative case
    mov rax, 1  ; Positive case
    jmp .done
.negative:
    mov rax, -1 ; Negative case
    jmp .done
.zero:
    mov rax, 0  ; Zero case
.done:

    ; Function epilogue
    pop rbp
    ret

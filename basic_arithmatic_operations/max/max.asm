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

    ; Call max function with parameters 10 and 4
    mov rdi, 10
    mov rsi, 4
    call max

    ; Print the result using printf
    mov rcx, fmt  ; First argument: format string
    mov rdx, rax  ; Second argument: result of max
    call printf

    ; Function epilogue
    mov rsp, rbp
    pop rbp
    ret

; Function to find the maximum of two numbers
max:
    cmp rdi, rsi
    jg .max
    mov rax, rsi
    ret
.max:
    mov rax, rdi
    ret

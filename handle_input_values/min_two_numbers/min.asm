section .data
    prompt1 db "Enter first integer: ", 0
    prompt2 db "Enter second integer: ", 0
    fmt_in db "%lld", 0
    fmt_out db "Result: %lld", 10, 0

section .bss
    num1 resq 1
    num2 resq 1
    result resq 1

section .text
global main
extern printf, scanf

main:
    ; Function prologue
    push rbp
    mov rbp, rsp

    ; Prompt for the first integer
    lea rcx, [rel prompt1]
    call printf

    ; Read the first integer
    lea rcx, [rel fmt_in]
    lea rdx, [rel num1]
    call scanf

    ; Prompt for the second integer
    lea rcx, [rel prompt2]
    call printf

    ; Read the second integer
    lea rcx, [rel fmt_in]
    lea rdx, [rel num2]
    call scanf

    ; Call min function
    mov rdi, [rel num1]
    mov rsi, [rel num2]
    lea rax, [rel result]
    call min

    ; Print the result
    mov rcx, fmt_out
    mov rdx, rax
    call printf

    ; Function epilogue
    mov rsp, rbp
    pop rbp
    ret

min:
    cmp rdi, rsi
    jge .L2
    mov rax, rdi
    ret

.L2:
    mov rax, rsi
    ret

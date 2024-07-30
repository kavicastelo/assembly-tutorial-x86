section .data
    prompt1 db "Enter first integer: ", 0
    prompt2 db "Enter second integer: ", 0
    fmt_in db "%d", 0
    fmt_out db "Result: %d", 10, 0

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

    ; Perform the addition
    mov rax, [rel num1]
    add rax, [rel num2]
    mov [rel result], rax

    ; Print the result
    lea rcx, [rel fmt_out]
    mov rdx, [rel result]
    call printf

    ; Function epilogue
    mov eax, 0
    pop rbp
    ret

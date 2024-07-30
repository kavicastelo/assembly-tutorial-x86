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

    ; Multiply the two numbers
    mov rax, [rel num1]
    imul rax, [rel num2]

    ; Store the result
    mov [rel result], rax

    ; Write the result
    lea rcx, [rel fmt_out]
    mov rdx, [rel result]
    call printf

    ; Function epilogue
    mov eax, 0
    pop rbp
    ret

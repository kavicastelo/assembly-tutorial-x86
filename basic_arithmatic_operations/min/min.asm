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

    ; Call min function with parameters 10 and 4
    mov rdi, 10
    mov rsi, 4
    call min

    ; Print the result using printf
    mov rcx, fmt  ; First argument: format string
    mov rdx, rax  ; Second argument: result of min
    call printf

    ; Function epilogue
    mov rsp, rbp
    pop rbp
    ret

; Function to find the minimum of two numbers
min:
    cmp rdi, rsi
    jge min2
    mov rax, rdi
    ret
min2:
    mov rax, rsi
    ret

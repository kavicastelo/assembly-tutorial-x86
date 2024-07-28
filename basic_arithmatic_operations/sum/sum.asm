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

    ; Call sum function with parameters 3 and 4
    mov rdi, 10
    mov rsi, 4
    call sum

    ; Print the result using printf
    mov rcx, fmt  ; First argument: format string
    mov rdx, rax  ; Second argument: result of sum
    call printf

    ; Function epilogue
    mov eax, 0
    pop rbp
    ret

sum:
    ; Function prologue
    push rbp
    mov rbp, rsp

    ; Access parameters
    mov rax, rdi   ; rax = first parameter (a)
    add rax, rsi   ; rax += second parameter (b)

    ; Function epilogue
    pop rbp
    ret

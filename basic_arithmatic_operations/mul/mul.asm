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

    ; Call multiply function with parameters 10 and 4
    mov rdi, 10
    mov rsi, 4
    call multiply

    ; Print the result using printf
    mov rcx, fmt  ; First argument: format string
    mov rdx, rax  ; Second argument: result of sum
    call printf

    ; Function epilogue
    mov eax, 0
    pop rbp
    ret

multiply:
    ; Function prologue
    push rbp
    mov rbp, rsp

    ; Access parameters
    mov rax, rdi   ; rax = first parameter (a)
    mov rbx, rsi   ; rbx = second parameter (b)

    ; Perform multiplication
    imul rbx      ; rax = rax * rbx

    ; Function epilogue
    pop rbp
    ret

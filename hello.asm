section .data
    hello db 'Hello, world!', 0    ; The string to print

section .text
    global _start

_start:
    ; Write to stdout
    mov rax, 1              ; syscall number (sys_write)
    mov rdi, 1              ; file descriptor (stdout)
    mov rsi, hello          ; pointer to string
    mov rdx, 13             ; string length
    syscall                 ; call kernel

    ; Exit
    mov rax, 60             ; syscall number (sys_exit)
    xor rdi, rdi            ; exit code 0
    syscall                 ; call kernel

section .data
    hello db 'Hello, world!', 0    ; The string to print

section .text
    extern GetStdHandle, WriteConsoleA, ExitProcess
    global _start

_start:
    ; Get the handle to the standard output (stdout)
    mov rax, -11             ; STD_OUTPUT_HANDLE
    call GetStdHandle

    ; Save the handle
    mov rdi, rax

    ; Write the string to stdout
    mov rax, 1              ; syscall number (sys_write)
    mov rsi, rdi            ; handle to stdout
    mov rdx, hello          ; pointer to string
    mov rcx, 13             ; string length
    call WriteConsoleA

    ; Exit the process
    mov rax, 0              ; exit code 0
    call ExitProcess

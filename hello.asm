section .data
    hello db 'Hello, world!', 0

section .text
    global _start

    extern GetStdHandle
    extern WriteConsoleA
    extern ExitProcess

_start:
    ; Get the handle for stdout
    mov rcx, -11           ; STD_OUTPUT_HANDLE
    call GetStdHandle

    ; Write to stdout
    mov rcx, rax           ; handle to stdout
    mov rdx, hello         ; pointer to string
    mov r8, 13             ; string length
    lea r9, [rsp+8]        ; pointer to number of bytes written (dummy variable)
    call WriteConsoleA

    ; Exit
    xor rcx, rcx           ; exit code 0
    call ExitProcess

section .data
    fmt db "Floating Point Part: %f", 10, 0
    float_value dq 10.5
    result dq 0.0

section .text
global main
extern printf

main:
    ; Function prologue
    push rbp
    mov rbp, rsp

    ; Load floating-point value into the FPU
    mov rax, float_value
    fld qword [rax]

    ; Call floatVal function
    call floatVal

    ; Store result from the FPU to memory
    mov rax, result
    fstp qword [rax]

    ; Print the result using printf
    mov rcx, fmt         ; First argument: format string
    mov rdx, result       ; Second argument: address of result
    movsd xmm0, qword [rdx]     ; Move the double to xmm0 for printf
    call printf

    ; Function epilogue
    mov eax, 0
    pop rbp
    ret

floatVal:
    ; Function prologue
    push rbp
    mov rbp, rsp

    ; Get the integer part
    fld st0                ; Copy the value to the top of the stack
    frndint                ; Round to integer
    fsub                   ; Subtract integer part from original value (st0 - st1)

    ; Function epilogue
    pop rbp
    ret

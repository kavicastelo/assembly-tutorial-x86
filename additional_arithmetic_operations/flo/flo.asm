section .data
    fmt db "Floating Point Part: %f", 10, 0
    float_value dq 10.5

section .bss
    result resq 1

section .text
global main
extern printf

main:
    ; Function prologue
    push rbp
    mov rbp, rsp

    ; Load the floating-point value into xmm0
    movsd xmm0, qword [rel float_value]

    ; Get the fractional part
    movapd xmm1, xmm0        ; Copy the value to xmm1
    roundsd xmm1, xmm0, 0    ; Round to integer in xmm1
    subsd xmm0, xmm1         ; Subtract integer part from xmm0

    ; Store the result
    movsd qword [rel result], xmm0

    ; Prepare arguments for printf
    lea rcx, [rel fmt]       ; First argument: format string
    movsd xmm1, qword [rel result]  ; Move the double to xmm1 for printf
    movq rdx, xmm1           ; Duplicate second argument as per convention
    call printf

    ; Function epilogue
    mov eax, 0
    pop rbp
    ret

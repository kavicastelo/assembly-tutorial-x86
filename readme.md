# Assembly Language Guide for Windows 64-bit

## Introduction

This guide is designed to help you learn assembly language from the ground up, focusing on the 64-bit Windows
architecture. We'll cover everything from setting up your environment to understanding registers and writing basic
programs. High-level programming language comparisons are included to make concepts more understandable.

## Table of Contents
1. [Setting Up the Environment](#setting-up-the-environment)
2. [Basic Syntax and Structure](#basic-syntax-and-structure)
3. [Registers](#registers)
4. [Simple Input and Output](#simple-input-and-output)
5. [Arithmetic Operations](#arithmetic-operations)
6. [Control Flow](#control-flow)
7. [Functions and Calling Conventions](#functions-and-calling-conventions)
8. [Learning Strategies](#learning-strategies)

## Setting Up the Environment
1. **Install NASM:** Download and install NASM from the [official site](https://www.nasm.us).
2. **Install MinGW or GCC:** Download and install MinGW or GCC for Windows.
3. **Set up IntelliJ IDEA:** Use IntelliJ IDEA with the necessary plugins to support assembly language.

## Basic Syntax and Structure
An assembly program is divided into sections:
- **.data:** Contains initialized data
- **.text:** Contains executable code
- **.bss:** Contains uninitialized data

### Example

```asm
section .data
    hello db 'Hello, world!', 0

section .text
    global _start

_start:
    ; Your code here
```

## Registers
Registers are limited storage locations in the CPU, each with specific purposes.

### General-Purpose Registers
- **RAX, RBX, RCX, RDX:** Arithmetic operations, loop counters, function returns.
- **RSP, RBP, RSI, RDI:** Stack pointer, base pointer, source index, destination index.
- **R8, R9, R10, R11, R12, R13, R14, R15:** Reserved for future use.
- **RIP:** Points to the next instruction to execute.
- **RFLAGS:** CPU flags.

### Segment Registers
- **CS, SS, DS, ES, FS, GS:** Segment selectors.

### Example
C Code:
```c
int main() {
    int a = 5;
    int b = 10;
    int sum = a + b;
    return sum;
}
```

Assembly Code:
```asm
section .text
global _start

_start:
    mov rax, 5       ; a = 5
    mov rbx, 10      ; b = 10
    add rax, rbx     ; sum = a + b
    mov rdi, rax     ; return sum
    call ExitProcess
```

## Simple Input and Output
### Printing a String
C Code:
```c
#include <stdio.h>
int main() {
    printf("Hello, World!");
    return 0;
}
```

Assembly Code:
```asm
section .data
    hello db 'Hello, World!', 0

section .text
global _start
extern GetStdHandle
extern WriteConsoleA
extern ExitProcess

_start:
    mov rcx, -11           ; STD_OUTPUT_HANDLE
    call GetStdHandle

    mov rcx, rax           ; handle to stdout
    mov rdx, hello         ; pointer to string
    mov r8, 13             ; string length
    lea r9, [rsp+8]        ; dummy variable
    call WriteConsoleA

    xor rcx, rcx           ; exit code 0
    call ExitProcess
```

## Arithmetic Operations
### Addition Example
C Code:
```c
int add(int a, int b) {
    return a + b;
}
```

Assembly Code:
```asm
section .text
global _start

_start:
    mov rax, 5       ; a = 5
    mov rbx, 10      ; b = 10
    add rax, rbx     ; result = a + b
    call ExitProcess
```

## Control Flow
### Loop Example
C Code:
```c
int sum_n(int n) {
    int sum = 0;
    for (int i = 1; i <= n; i++) {
        sum += i;
    }
    return sum;
}
```

Assembly Code:
```asm
section .text
global _start

_start:
    mov rcx, 10      ; n = 10
    mov rax, 0       ; sum = 0
    mov rbx, 1       ; i = 1

loop_start:
    add rax, rbx     ; sum += i
    inc rbx          ; i++
    cmp rbx, rcx
    jle loop_start   ; if i <= n, repeat

    call ExitProcess
```

## Functions and Calling Conventions
### Function Example
C Code:
```c
int multiply(int a, int b) {
    return a * b;
}
int main() {
    int result = multiply(5, 10);
    return result;
}
```

Assembly Code:
```asm
section .text
global _start
extern multiply

_start:
    mov rcx, 5       ; a = 5
    mov rdx, 10      ; b = 10
    call multiply
    ; result is in rax
    call ExitProcess

multiply:
    imul rax, rcx, rdx
    ret
```

## Learning Strategies
- **Start Small:** Begin with simple programs and gradually increase complexity.
- **Use Debuggers:** Tools like `gdb` can help you step through your code and understand what's happening.
- **Read Documentation:** Manuals and tutorials specific to x86-64 assembly can be very helpful.
- **Practice Regularly:** Writing and experimenting with code is the best way to learn.

@echo off
setlocal

REM
set "FILENAME=%~n1"

REM
set "NASM_PATH=D:\mingw64\bin\nasm.exe"
set "GCC_PATH=D:\mingw64\bin\gcc.exe"

REM
"%NASM_PATH%" -f win64 "%1"

REM
"%GCC_PATH%" -nostdlib -o "%FILENAME%.exe" "%FILENAME%.obj" -lkernel32

echo Build successful: %FILENAME%.exe

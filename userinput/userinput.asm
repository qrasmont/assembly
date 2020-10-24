section .data
    askName db "Name please? "
    bye     db "Bye "

section .bss
    name resb 16 ; reserve 16 bytes

section .text
    global _start

_start:

    call _printAskName ; go to label then come back
    call _getName
    call _printBye
    call _printName

    mov rax, 60 ; set syscall to sys_exit-
    mov rdi, 0  ; set error code
    syscall     ; excute syscall

_getName:
    mov rax, 0 ; set syscall to sys_read
    mov rdi, 0 ; set input to stdin
    mov rsi, name
    mov rdx, 16
    syscall
    ret

_printAskName:
    mov rax, 1
    mov rdi, 1
    mov rsi, askName
    mov rdx, 13
    syscall
    ret ; return to call statement

_printBye:
    mov rax, 1
    mov rdi, 1
    mov rsi, bye
    mov rdx, 4
    syscall
    ret

_printName:
    mov rax, 1
    mov rdi, 1
    mov rsi, name
    mov rdx, 16
    syscall
    ret

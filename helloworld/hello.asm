; Data section: all needed data goes here
section .data
    ; Define some data we'll use.
    ; hw: the name for reference later in the code.
    ; db: define byte: define raw bytes of data.
    ; ,10 is "\n".
    hw db "Hello, World!",10

; Text section: where the code goes
section .text
    global _start

_start:
    ; Use sys_write to print to stdout.
    ; Set the needed values in the registers.
    ; Then execute the syscall.
    mov rax, 1  ; set syscall to sys_write
    mov rdi, 1  ; output to stdout
    mov rsi, hw ; set the memory addr of the content to write
    mov rdx, 14 ; the size of the content to write
    syscall     ; excute syscall

    mov rax, 60 ; set syscall to sys_exit-
    mov rdi, 0  ; set error code
    syscall     ; excute syscall

; Bss section: use to reserve memory for future use
; section .bss

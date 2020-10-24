section .data
    smlstr db "small str",10,0
    bigstr db "big ass string of doom, what ?",10,0

section .text
    global _start

_start:
    mov rax, smlstr
    call _print

    mov rax, bigstr
    call _print

    mov rax, 60
    mov rdi, 0
    syscall

; input: rax (pointer to string)
; output; print string at rax
_print:
    push rax ; push rax value to stack
    mov rbx, 0 ; init rbx to 0
_printLoop:
    inc rax ;increment rax
    inc rbx
    mov cl, [rax] ; mov rax byte in the first byte of rcx
    cmp cl, 0 ; compare cl to 0
    jne _printLoop ; loop if cl not 0

    ; else: print string
    mov rax, 1
    mov rdi, 1
    pop rsi ; pop the rax we pushed to rsi
    mov rdx, rbx ; set sizeof string to rbx
    syscall
    ret

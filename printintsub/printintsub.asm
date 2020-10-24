section .bss
    digitSpace resb 100
    digitSpacePos resb 8

section .text
    global _start

_start:
    mov rax, 42
    call _printRAX

    mov rax, 60
    mov rdi, 0
    syscall

_printRAX:
    mov rcx, digitSpace
    mov rbx, 10 ; newline
    mov [rcx], rbx ; add newline to digitSpace
    inc rcx
    mov [digitSpacePos], rcx
_convASCIILoop:
    mov rdx, 0 ; in a division if rdx is not 0 it's concatenated to result
    mov rbx, 10
    div rbx ; div rax by rbx
    push rax
    add rdx, 48 ; convert division remainder to ASCII char

    mov rcx, [digitSpacePos]    ; get digit space
    mov [rcx], dl               ; mov remainder to digitSpace
    inc rcx
    mov [digitSpacePos], rcx    ; store position

    ; Check if we should keep dividing
    pop rax
    cmp rax, 0
    jne _convASCIILoop

_printNumLoop:
    mov rcx, [digitSpacePos]

    mov rax, 1
    mov rdi, 1
    mov rsi, rcx
    mov rdx, 1
    syscall

    ; decrement because we converted last digit to fist digit
    mov rcx, [digitSpacePos]
    dec rcx
    mov [digitSpacePos], rcx

    cmp rcx, digitSpace
    jge _printNumLoop

    ret

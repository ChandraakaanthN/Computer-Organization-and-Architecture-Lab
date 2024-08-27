org 100h
num1 dw 1234h
num2 dw 5678h
start:  
    mov ax, num1
    add ax, num2
    mov bx, ax
    mov al, ah
    call print_hex_byte
    mov al, bl
    call print_hex_byte
    mov ah, 4Ch
    int 21h
ret
print_hex_byte:
    mov ah, al
    and ah, 0F0h
    shr ah, 4
    add ah, 30h
    cmp ah, 39h
    jle print_upper_nibble
    add ah, 7
print_upper_nibble:
    mov dl, ah
    mov ah, 02h
    int 21h
    mov ah, al
    and ah, 0Fh
    add ah, 30h
    cmp ah, 39h
    jle print_lower_nibble
    add ah, 7
print_lower_nibble:
    mov dl, ah
    mov ah, 02h
    int 21h
    ret

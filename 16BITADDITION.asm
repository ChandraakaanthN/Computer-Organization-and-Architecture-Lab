org 100h   ; Start address of the program

; Define two 16-bit numbers to add
num1 dw 1234h  ; First number (hexadecimal)
num2 dw 5678h  ; Second number (hexadecimal)

start:  
    ; Load the first number into AX register
    mov ax, num1
    
    ; Add the second number to AX
    add ax, num2
    
    ; The result is now in AX
    ; Convert the result to a printable ASCII value for display
    
    ; Save the result for display
    mov bx, ax

    ; Convert the upper byte of AX to ASCII and display
    mov al, ah
    call print_hex_byte
    
    ; Convert the lower byte of AX to ASCII and display
    mov al, bl
    call print_hex_byte
    
    ; End the program
    mov ah, 4Ch
    int 21h

ret

print_hex_byte:
    ; Convert upper nibble to a character
    mov ah, al
    and ah, 0F0h  ; Mask the lower nibble
    shr ah, 4     ; Shift right by 4 to get the upper nibble
    add ah, 30h   ; Convert to ASCII digit (0-9)
    cmp ah, 39h
    jle print_upper_nibble
    add ah, 7     ; Convert to ASCII letter (A-F) if necessary

print_upper_nibble:
    mov dl, ah    ; Move the first digit to DL for printing
    mov ah, 02h   ; BIOS interrupt to display character
    int 21h

    ; Convert lower nibble to a character
    mov ah, al
    and ah, 0Fh   ; Mask the upper nibble
    add ah, 30h   ; Convert to ASCII digit (0-9)
    cmp ah, 39h
    jle print_lower_nibble
    add ah, 7     ; Convert to ASCII letter (A-F) if necessary

print_lower_nibble:
    mov dl, ah    ; Move the second digit to DL for printing
    mov ah, 02h   ; BIOS interrupt to display character
    int 21h
    ret

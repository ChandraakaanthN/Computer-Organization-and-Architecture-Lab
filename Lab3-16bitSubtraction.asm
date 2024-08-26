org 100h   ; Start address of the program

; Define two 16-bit numbers
num1 dw 0ABCDh  ; First number (hexadecimal)
num2 dw 01234h  ; Second number (hexadecimal)

start:
    ; Load the first 16-bit number into AX
    mov ax, num1
    
    ; Subtract the second 16-bit number from AX
    sub ax, num2  ; AX = 0ABCDh - 01234h
    
    ; Save the result for display
    mov bx, ax    ; BX = AX (result stored in BX)

    ; Convert and display the upper byte of the result
    mov ah, bh    ; Move upper byte of BX into AH
    call print_hex_digit  ; Convert and print the upper nibble
    mov ah, bl    ; Move lower byte of BX into AH
    call print_hex_digit  ; Convert and print the lower nibble

    ; End the program
    mov ah, 4Ch   ; Terminate the program
    int 21h

ret

; Subroutine to convert a nibble in AH to ASCII and display it
print_hex_digit:
    and ah, 0F0h  ; Mask the lower nibble
    shr ah, 4     ; Shift right by 4 to move the upper nibble to lower nibble
    add ah, 30h   ; Convert to ASCII digit (0-9)
    cmp ah, 39h
    jle print_digit
    add ah, 7     ; Convert to ASCII letter (A-F) if necessary

print_digit:
    mov dl, ah    ; Move the digit to DL for printing
    mov ah, 02h   ; BIOS interrupt to display character
    int 21h       ; Call interrupt 21h to print the character in DL
    ret

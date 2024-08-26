org 100h   ; Start address of the program

; Define two 8-bit numbers
num1 db 29h  ; First number (hexadecimal)
num2 db 17h  ; Second number (hexadecimal)

start:
    ; Load the first number into AL
    mov al, num1
    
    ; Subtract the second number from AL
    sub al, num2  ; AL = 29h - 17h = 12h
    
    ; Save the result for display
    mov bl, al

    ; Convert the upper nibble (4 bits) of AL to a character
    mov ah, al
    and ah, 0F0h     ; Mask the lower nibble (keep upper nibble)
    shr ah, 4        ; Shift right by 4 to move the upper nibble to lower nibble
    add ah, 30h      ; Convert to ASCII digit (0-9)
    cmp ah, 39h
    jle print_first_digit
    add ah, 7        ; Convert to ASCII letter (A-F) if necessary

print_first_digit:
    mov dl, ah       ; Move the first digit (upper nibble) to DL for printing
    mov ah, 02h      ; BIOS interrupt to display character
    int 21h          ; Call interrupt 21h to print the character in DL

    ; Convert the lower nibble of AL to a character
    mov ah, bl
    and ah, 0Fh      ; Mask the upper nibble (keep lower nibble)
    add ah, 30h      ; Convert to ASCII digit (0-9)
    cmp ah, 39h
    jle print_second_digit
    add ah, 7        ; Convert to ASCII letter (A-F) if necessary

print_second_digit:
    mov dl, ah       ; Move the second digit (lower nibble) to DL for printing
    mov ah, 02h      ; BIOS interrupt to display character
    int 21h          ; Call interrupt 21h to print the character in DL

    ; End the program
    mov ah, 4Ch      ; Terminate the program
    int 21h

ret

ORG 100h           ; Set origin for COM file format

MOV CX, 10         ; Set loop counter to 26 (for letters 'Z' to 'A')
MOV AL, '0'        ; Initialize AL with ASCII code for 'Z'

PrintLoop:
    MOV DL, AL     ; Move the current character to DL (for printing)
    MOV AH, 02h    ; DOS interrupt function to print a character
    INT 21h        ; Call DOS interrupt

    inc AL         ; Decrement AL to get the previous ASCII character ('Y', 'X', etc.)
    LOOP PrintLoop ; Repeat until CX reaches 0

MOV AH, 4Ch        ; DOS interrupt function to exit program
INT 21h            ; Call DOS interrupt to exit                 
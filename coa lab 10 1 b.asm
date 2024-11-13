ORG 100h ; Origin, to specify that the program starts at 100h (COM file format)

; Initialize the starting character 'Z'
MOV CX, 26          ; Loop counter for 26 letters
MOV DL, 'Z'         ; ASCII value of 'Z'

print_loop:
    ; Print the character in DL
    MOV AH, 02h         ; DOS function: write character to stdout
    INT 21h

    ; Decrement the character
    DEC DL

    ; Loop until we have printed all letters
    LOOP print_loop

; Terminate the program
MOV AH, 4Ch         ; DOS function: exit
INT 21h

END ; End of program

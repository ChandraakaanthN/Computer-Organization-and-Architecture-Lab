ORG 100h ; Origin, to specify that the program starts at 100h (COM file format) 
;Display message "Enter an uppercase letter: " 
MOV DX, OFFSET msg_input ; Load the address of the message 
MOV AH, 09h ; Function 09h of INT 21h is used to display a string 
INT 21h 
; Call DOS interrupt to print the message 
MOV AH, 01h ; Function 01h of INT 21h is used to read a character 
INT 21h 
mov cl,al 
CMP AL, '0' ; Compare AL with 'A' 
JL NotDigit ; If the input is less than 'A', it is not uppercase 
CMP AL, '9' ; Compare AL with 'Z' 
JG NotDigit 
MOV DX, OFFSET msg_input ; Load the address of the message 
MOV AH, 09h ; Function 09h of INT 21h is used to display a string 
INT 21h 
;Read a single character from the user 
MOV AH, 01h ; Function 01h of INT 21h is used to read a character 
INT 21h 
mov bl,al 
; Call DOS interrupt to get the character 
CMP AL, '0' ; Compare AL with 'A' 
JL NotDigit ; If the input is less than 'A', it is not uppercase
CMP AL, '9' ; Compare AL with 'Z'
JG NotDigit ; If the input is greater than 'Z', it is not uppercase
cmp cl,bl
je Equal
MOV DX, OFFSET msg_outputNotEqual ; Load the address of the message
MOV AH, 09h ; Function 09h of INT 21h is used to display a string
INT 21h
jmp EndProgram
Equal:
MOV DX, OFFSET msg_outputEqual ; Load the address of the error message
MOV AH, 09h ; Function 09h of INT 21h is used to display a string
INT 21h
EndProgram:
;Terminate the program
MOV AH, 4Ch ; Function 4Ch of INT 21h terminates the program
INT 21h ; Call DOS interrupt to exit
NotDigit:
;If the input is not an uppercase letter, display an error message
MOV DX, OFFSET msg_error ; Load the address of the error message
MOV AH, 09h ; Function 09h of INT 21h is used to display a string
INT 21h
msg_input DB 'Enter a digit: $'
msg_outputEqual DB 0Dh, 0Ah, 'They are equal $' ; Output message
msg_outputNotEqual DB 0Dh, 0Ah, 'They are not equal $' ; Output message
msg_error DB 0Dh, 0Ah, 'Error: Not a digit! $' ; Error message
END ;End of program
.MODEL SMALL
.STACK 100H
.DATA
MSG DB 0DH,0AH,'Masked Value (Reversed): $'

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    MOV BH,127        ; Sample value
    AND BH,0AAH       ; Mask even positions

    MOV AH,9
    LEA DX,MSG
    INT 21H

    MOV CX,8          ; 8 bits

PRINT_LOOP:
    MOV DL,'0'
    
    TEST BH,1         ; Check LSB
    JZ PRINT_BIT
    
    MOV DL,'1'

PRINT_BIT:
    MOV AH,2
    INT 21H
    
    SHR BH,1          ; Shift right (no rotate!)
    LOOP PRINT_LOOP

    MOV AH,4CH
    INT 21H

MAIN ENDP
END MAIN
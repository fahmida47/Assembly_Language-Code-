.MODEL SMALL
.STACK 100H
.DATA
ODD_COUNT  DB 0
EVEN_COUNT DB 0

MSG1 DB 0DH,0AH,'Odd Numbers: $'
MSG2 DB 0DH,0AH,'Even Numbers: $'

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    MOV CX,10          ; Read 10 digits

READ_LOOP:
    MOV AH,1
    INT 21H            ; Input character in AL
    
    SUB AL,30H         ; Convert ASCII to number
    
    AND AL,1           ; Check LSB
    JZ EVEN_LABEL
    
    INC ODD_COUNT
    JMP CONTINUE

EVEN_LABEL:
    INC EVEN_COUNT

CONTINUE:
    LOOP READ_LOOP

    ; Print Odd count
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    
    MOV AL,ODD_COUNT
    ADD AL,30H
    MOV DL,AL
    MOV AH,2
    INT 21H

    ; Print Even count
    MOV AH,9
    LEA DX,MSG2
    INT 21H
    
    MOV AL,EVEN_COUNT
    ADD AL,30H
    MOV DL,AL
    MOV AH,2
    INT 21H

    MOV AH,4CH
    INT 21H

MAIN ENDP
END MAIN
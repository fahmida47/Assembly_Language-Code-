.MODEL SMALL
.STACK 100H

.CODE

MAIN PROC
    
    CALL INDEC
    MOV CX,AX
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AX,1
    MOV BX,1
    CMP CX,0
    JE PRINT
    
    
    FACTORIAL_LOOP:
    MUL BX
    INC BX
    LOOP FACTORIAL_LOOP
    
    
    PRINT:
    
    CALL OUTDEC
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP

INCLUDE OUTDEC.ASM
INCLUDE INDEC.ASM
END MAIN
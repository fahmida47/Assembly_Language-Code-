.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC
    
    CALL INDEC
    PUSH AX
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    
    CALL INDEC
    MOV BX,AX
    
    POP AX
    
    
    PUSH AX
    PUSH BX
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    POP BX
    POP AX
    
    
    ;GCD
    
    
    GCD_LOOP:
    
    CMP BX,0
    JE DONE
    
    MOV DX,0
    DIV BX
    
    MOV AX,BX
    MOV BX,DX
    
    JMP GCD_LOOP
    
    DONE:
    
    CALL OUTDEC
    
    MOV AH,4CH
    INT 21H
MAIN ENDP

INCLUDE INDEC.ASM
INCLUDE OUTDEC.ASM
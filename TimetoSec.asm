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
    
    POP AX
    
    MOV DX,0
    MOV CX,3600
    DIV CX
    
    PUSH DX
    
    CALL OUTDEC
    
    
    MOV AH,2
    MOV DL,':'
    INT 21H
    
    POP AX
    
    MOV DX,0
    MOV CX,60
    DIV CX
    
    PUSH DX
    
    CALL OUTDEC
    
    MOV AH,2
    MOV DL,':'
    INT 21H
    
    POP AX
    CALL OUTDEC
    
    MOV AH,4CH
    INT 21H
    
MAIN ENDP

INCLUDE OUTDEC.ASM
INCLUDE INDEC.ASM

END MAIN
.MODEL SMALL
.STACK 100H

.DATA
MSG DB "MASKED VALUE: $"
NL DB 0DH,0AH,'$'

VAL DB ?


.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    
    LEA DX,MSG
    MOV AH,9
    INT 21H
    
    
    MOV DH,80H
    XOR DH,0AAH
    
    MOV VAL,DH
    
    LEA DX,NL
    MOV AH,9
    INT 21H
    
    XOR CX,CX
    
    MOV CL,8
    
    PRINT_BIN:
    
    ROL VAL,1
    JC PRINT_ONE
    MOV DL,'0'
    MOV AH,2
    INT 21H
    JMP NEXT
    
    PRINT_ONE:
    MOV DL,'1'
    MOV AH,2
    INT 21H
    
    NEXT:
    LOOP PRINT_BIN
    
    MOV AH,4CH
    INT 21H
    
    END MAIN
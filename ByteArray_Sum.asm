.MODEL SMALL
.STACK 100h
.DATA
NEW_LINE DB 0AH,0DH,'$' 
W DB 1,2,3,4,5
SUM DB 0       

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    ;BYTE ARRAY PRINT
    MOV CX,5
    XOR AX,AX
    LEA SI,W
    
    PRINT:
    MOV AL,[SI]
    CALL OUTDEC
    INC SI
    
    PUSH AX
    
    MOV AH,9
    LEA DX,NEW_LINE
    INT 21H 
    
    POP AX
 
    LOOP PRINT 
    
    LEA SI, W
    MOV CX, 5
    XOR AX, AX

SUM_:
    ADD AL, [SI] 
    INC SI
    LOOP SUM_
    
    CALL OUTDEC 

   
MOV AH, 4CH
INT 21H
MAIN ENDP
INCLUDE INDEC.ASM
INCLUDE OUTDEC.ASM
END MAIN
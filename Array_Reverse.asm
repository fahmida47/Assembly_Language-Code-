.MODEL SMALL
.STACK 100H

.DATA
NEWLINE DB 0AH,0DH,'$'
MSG2 DB 'REVERSE :$'
ARR DW 100 DUP(0)
N DW ?

.CODE 
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    ; ------- INPUT N -------
    CALL INDEC
    MOV N,AX
    PUSH AX
    MOV AH,9
    LEA DX,NEWLINE
    INT 21H 
    POP AX
    
    ; ------- INPUT ARRAY -------
    MOV CX,N
    LEA SI,ARR 
    
INPUT: 
    CALL INDEC 
    PUSH AX 
    MOV AH,9
    LEA DX,NEWLINE
    INT 21H
    POP AX
    MOV [SI],AX
    ADD SI,2
    
    LOOP INPUT 
    
                                            
    MOV CX,N
    LEA SI,ARR 
    REVERSE:
    MOV AX,[SI]
    PUSH AX
    ADD SI,2
    
    LOOP REVERSE
    
    
    MOV AH,9
    LEA DX,MSG2
    INT 21H
           
   MOV CX,N
    
    PRINT:
    POP AX   
    CALL OUTDEC 

    LOOP PRINT

    MOV AH,4CH
    INT 21H
    
MAIN ENDP
INCLUDE INDEC.ASM
INCLUDE OUTDEC.ASM
END MAIN



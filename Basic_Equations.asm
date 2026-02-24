Topic-(01)
.MODEL SMALL
.STACK 100H
.DATA
A DB 5
B DB ?
C EQU 1  

MSG DB "Enter value of B: $"
;Equation=>A-2B+C 

.CODE  

MAIN PROC
   MOV AX,@DATA
   MOV DS,AX
   
   ; Print message
    MOV AH, 09H
    LEA DX, MSG
    INT 21H
   
   ; INPUT OF B
   MOV AH,1
   INT 21H
   SUB AL,30H
   MOV BL,AL 
   
   ; CALC
   MOV AL,A
   ADD BL,BL
   SUB AL,BL
   ADD AL,3
   MOV A,AL

   ; NEW LINE
   MOV DL,0DH
   MOV AH,2
   INT 21H

   MOV DL,0AH
   MOV AH,2
   INT 21H

   ; OUTPUT (FIX HERE)
   MOV AL,A        ; ?? VERY IMPORTANT
   ADD AL,30H
   MOV DL,AL
   MOV AH,2
   INT 21H

MAIN ENDP

   MOV AH,4CH
   INT 21H

END MAIN

Topic-(02)
.MODEL SMALL
.STACK 100h

.DATA
A EQU 4                ; constant A = 4
B DB ?                 ; user input
C DB 2                 ; initial C = 2

MSG1 DB 0DH,0AH,"Enter the value of B: $"
MSG2 DB 0DH,0AH,"Value of C = $"

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ; ----- Input B -----
    MOV AH,9
    LEA DX,MSG1
    INT 21H

    CALL INDEC
    MOV B,AL           ; store input in B

    ; ----- C = A - B + 3C -----
    MOV AL,A           ; AL = A
    SUB AL,B           ; AL = A - B

    MOV BL,C           ; BL = C
    ADD BL,C           ; BL = 2C
    ADD BL,C           ; BL = 3C

    ADD AL,BL          ; AL = A - B + 3C
    MOV C,AL           ; store result in C

    ; ----- Output -----
    MOV AH,9
    LEA DX,MSG2
    INT 21H

    MOV AL,C
    CBW
    CALL OUTDEC

    MOV AH,4CH
    INT 21H
MAIN ENDP
INCLUDE INDEC.ASM
INCLUDE OUTDEC.ASM
END MAIN


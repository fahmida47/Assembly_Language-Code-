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


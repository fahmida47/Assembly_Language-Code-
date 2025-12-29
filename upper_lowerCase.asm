.MODEL SMALL
.STACK 100H
.DATA
 MSG DB "Enter lower case value:$"
 MSG1 DB 0DH,0AH,"Upper case:"
 CHAR DB ?,"$"
.CODE

MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     
     ;DISPLAY MESSAGE
     LEA DX,MSG
     MOV AH,9
     INT 21H
     
     ;INPUT CHARACTER & CONVERT UPPER CASE
     MOV AH,1
     INT 21H
     SUB AL,20H
     MOV CHAR,AL
     
     ;NEW LINE
     MOV AH,2
     MOV DL,0DH
     INT 21H
     MOV DL,0AH
     INT 21H
     
     ;DISPLAY MESSAGE
     LEA DX,MSG1
     MOV AH,9
     INT 21H
     
MAIN ENDP

MOV AH,4CH
INT 21H

END MAIN
     
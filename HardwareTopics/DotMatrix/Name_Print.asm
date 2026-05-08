.MODEL SAMLL
.STACK 100H

.DATA

; N, A, D, I, A, A
Dots DB 7Fh, 02h, 04h, 08h, 7Fh ; N
     DB 7Eh, 11h, 11h, 11h, 7Eh ; A
     DB 7Fh, 41h, 41h, 22h, 1Ch ; D
     DB 41h, 41h, 7Fh, 41h, 41h ; I
     DB 7Eh, 11h, 11h, 11h, 7Eh ; A
     DB 7Eh, 11h, 11h, 11h, 7Eh ; A

.CODE 
MAIN PROC
    
MOV AX, @DATA
MOV DS, AX

MOV DX, 2000h   
MOV SI, 0       
MOV CX, 30      

NEXT: 
    MOV AL, Dots[SI] 
    OUT DX, AL       
    INC SI           
    INC DX           
    LOOP NEXT       

RET 
MAIN ENDP
END MAIN
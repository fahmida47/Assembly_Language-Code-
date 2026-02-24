.MODEL SMALL
.STACK 100h

.DATA
L DB ?
W DB ?
P DW ?

MSG1 DB 0DH,0AH,"Enter length: $"
MSG2 DB 0DH,0AH,"Enter width: $"
MSG3 DB 0DH,0AH,"Perimeter: $"

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ; ---- Input Length ----
    MOV AH,9
    LEA DX,MSG1
    INT 21H

    CALL INDEC
    MOV L,AL

    ; ---- Input Width ----
    MOV AH,9
    LEA DX,MSG2
    INT 21H

    CALL INDEC
    MOV W,AL

    ; ---- P = 2(l + w) ----
    MOV AL,L
    ADD AL,W           ; AL = l + w
    ADD AL,AL          ; multiply by 2
    CBW
    MOV P,AX

    ; ---- Output ----
    MOV AH,9
    LEA DX,MSG3
    INT 21H

    MOV AX,P
    CALL OUTDEC

    MOV AH,4CH
    INT 21H
MAIN ENDP
INCLUDE INDEC.ASM
INCLUDE OUTDEC.ASM
END MAIN
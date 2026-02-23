.MODEL SMALL
.STACK 100h

.DATA
NEW_LINE DB 0AH,0DH,'$' 

W DB 1,2,3,4,5
N EQU 5

SUM DW 0
AVG DW 0

MSG1 DB 0AH,0DH,"Sum: $"
MSG2 DB 0AH,0DH,"Average: $"

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;--------------------------
    ; SUM CALCULATION
    ;--------------------------
    LEA SI,W
    MOV CX,N

SUM_LOOP:
    MOV AL,[SI]
    CBW              ; byte ? word
    ADD SUM,AX
    INC SI
    LOOP SUM_LOOP

    ;--------------------------
    ; AVERAGE CALCULATION
    ;--------------------------
    MOV AX,SUM
    MOV BL,N
    DIV BL           ; AX / BL
    MOV AH,0
    MOV AVG,AX

    ;--------------------------
    ; PRINT SUM
    ;--------------------------
    MOV AH,9
    LEA DX,MSG1
    INT 21H

    MOV AX,SUM
    CALL OUTDEC

    ;--------------------------
    ; PRINT AVERAGE
    ;--------------------------
    MOV AH,9
    LEA DX,MSG2
    INT 21H

    MOV AX,AVG
    CALL OUTDEC

    MOV AH,4CH
    INT 21H

MAIN ENDP
INCLUDE OUTDEC.ASM
END MAIN
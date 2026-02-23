.MODEL SMALL
.STACK 100h

.DATA
A DB 1,2,3,4,5,47
N EQU 6

EVEN DB 0
ODD  DB 0

MSG1 DB 0AH,0DH,"Even count: $"
MSG2 DB "  Odd count: $"

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    LEA SI,A
    MOV CX,N

COUNT_LOOP:
    MOV AL,[SI]
    TEST AL,1        ; LSB = 0 ? Even, LSB = 1 ? Odd
    JZ EVENLBL
    INC ODD
    JMP SKIP
EVENLBL:
    INC EVEN
SKIP:
    INC SI
    LOOP COUNT_LOOP

    ;--------------------------
    ; Print Even count
    ;--------------------------
    MOV AH,9
    LEA DX,MSG1
    INT 21H

    MOV AL,EVEN
    CBW
    CALL OUTDEC

    ;--------------------------
    ; Print Odd count
    ;--------------------------
    MOV AH,9
    LEA DX,MSG2
    INT 21H

    MOV AL,ODD
    CBW
    CALL OUTDEC

    ;--------------------------
    ; Exit program
    ;--------------------------
    MOV AH,4CH
    INT 21H

MAIN ENDP
INCLUDE OUTDEC.ASM
END MAIN
.MODEL SMALL
.STACK 100h

.DATA
A DB 3,-2,5,-7,0,4
N EQU 6

POS DB 0
NEG_ Db 0

MSG1 DB 0AH,0DH,"Positive count: $"
MSG2 DB "  Negative count: $"

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    LEA SI,A
    MOV CX,N

COUNT_LOOP:
    MOV AL,[SI]
    CMP AL,0
    JG POSLBL       ; AL > 0 ? Positive
    JL NEGLBL       ; AL < 0 ? Negative
    ; AL = 0 ? skip
    JMP SKIP

POSLBL:
    INC POS
    JMP SKIP

NEGLBL:
    INC NEG_

SKIP:
    INC SI
    LOOP COUNT_LOOP

    ;--------------------------
    ; Print Positive count
    ;--------------------------
    MOV AH,9
    LEA DX,MSG1
    INT 21H

    MOV AL,POS
    CBW
    CALL OUTDEC

    ;--------------------------
    ; Print Negative count
    ;--------------------------
    MOV AH,9
    LEA DX,MSG2
    INT 21H

    MOV AL,NEG_
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
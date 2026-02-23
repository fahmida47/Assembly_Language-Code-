.MODEL SMALL
.STACK 100h

.DATA
A DB 3,7,2,9,5
N EQU 5

MAX DB ?

MSG DB 0AH,0DH,"Maximum element: $"

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;--------------------------
    ; Initialize
    ;--------------------------
    LEA SI,A
    MOV AL,[SI]      ; ????? element ?????
    MOV MAX,AL

    INC SI
    MOV CX,N
    DEC CX           ; ???? ????? element already ?????

    ;--------------------------
    ; Loop to find Maximum
    ;--------------------------
MAX_LOOP:
    MOV AL,[SI]
    CMP AL,MAX
    JLE SKIP
    MOV MAX,AL
SKIP:
    INC SI
    LOOP MAX_LOOP

    ;--------------------------
    ; Print Maximum
    ;--------------------------
    MOV AH,9
    LEA DX,MSG
    INT 21H

    MOV AL,MAX
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
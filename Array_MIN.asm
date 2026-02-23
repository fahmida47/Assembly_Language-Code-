.MODEL SMALL
.STACK 100h

.DATA
A DB 3,7,2,9,5
N EQU 5

MIN DB ?

MSG DB 0AH,0DH,"Minimum element: $"

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    ;--------------------------
    ; Initialize
    ;--------------------------
    LEA SI,A
    MOV AL,[SI]      ; ????? element ?????
    MOV MIN,AL

    INC SI
    MOV CX,N
    DEC CX           ; ???? ????? element already ?????

    ;--------------------------
    ; Loop to find Minimum
    ;--------------------------
MIN_LOOP:
    MOV AL,[SI]
    CMP AL,MIN
    JGE SKIP          ; ??? AL >= MIN ? skip
    MOV MIN,AL        ; AL ??? ??? MIN update
SKIP:
    INC SI
    LOOP MIN_LOOP

    ;--------------------------
    ; Print Minimum
    ;--------------------------
    MOV AH,9
    LEA DX,MSG
    INT 21H

    MOV AL,MIN
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
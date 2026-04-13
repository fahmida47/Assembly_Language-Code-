.MODEL SMALL
.STACK 100H

.DATA
    ; 7-segment patterns for 0-9
    PATTERNS DB 3Fh,06h,5Bh,4Fh,66h,6Dh,7Dh,07h,7Fh,6Fh

 
    TENS     DB 4   ; tens digit of ID
    UNITS    DB 7   ; units digit of ID

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    LEA BX, PATTERNS

    ; -----------------------
    ; Display TENS (4)
    ; -----------------------
    MOV AL, TENS
    XLAT
    MOV DX, 2030h
    OUT DX, AL

    ; Delay
    MOV CX, 01
OUTER_DELAY1:
    MOV BX, 6
INNER_DELAY1:
    DEC BX
    JNZ INNER_DELAY1
    LOOP OUTER_DELAY1

    ; -----------------------
    ; Display UNITS (7)
    ; -----------------------
    MOV AL, UNITS
    XLAT
    MOV DX, 2031h
    OUT DX, AL

    ; Delay
    MOV CX, 01
OUTER_DELAY2:
    MOV BX, 6
INNER_DELAY2:
    DEC BX
    JNZ INNER_DELAY2
    LOOP OUTER_DELAY2

    ; End program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
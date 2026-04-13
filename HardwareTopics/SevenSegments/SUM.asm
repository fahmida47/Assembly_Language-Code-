.MODEL SMALL
.STACK 100H

.DATA
    PATTERNS DB 3Fh,06h,5Bh,4Fh,66h,6Dh,7Dh,07h,7Fh,6Fh ; 0-9 7-seg

    NUM1 DB 3
    NUM2 DB 5
    NUM3 DB 7
    SUM  DB ?

    TENS  DB ?
    UNITS DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Calculate SUM
    MOV AL, NUM1
    ADD AL, NUM2
    ADD AL, NUM3
    MOV SUM, AL

    ; Break SUM into digits
    MOV AL, SUM
    MOV BL, 10
    XOR AH, AH
    DIV BL
    MOV TENS, AL
    MOV UNITS, AH

    LEA BX, PATTERNS

    ; Display Tens
    MOV AL, TENS
    XLAT
    MOV DX, 2030h
    OUT DX, AL

    ; Delay
    MOV CX, 01
DELAY1:
    MOV BX, 6
DELAY1_INNER:
    DEC BX
    JNZ DELAY1_INNER
    LOOP DELAY1

    ; Display Units
    MOV AL, UNITS
    XLAT
    MOV DX, 2031h
    OUT DX, AL

    ; Delay
    MOV CX, 01
DELAY2:
    MOV BX, 6
DELAY2_INNER:
    DEC BX
    JNZ DELAY2_INNER
    LOOP DELAY2

    ; End Program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
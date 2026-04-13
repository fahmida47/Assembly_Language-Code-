.MODEL SMALL
.STACK 100H

.DATA
    PATTERNS DB 3Fh,06h,5Bh,4Fh,66h,6Dh,7Dh,07h,7Fh,6Fh ; 0-9 7-seg

    NUMBER DW 2        ; start prime check
    TENS   DB ?
    UNITS  DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

NEXT_NUMBER:
    ; -----------------------
    ; Check if NUMBER is prime
    ; -----------------------
    MOV AX, NUMBER
    CMP AX, 2
    JB  SKIP_NUMBER      ; numbers <2 not prime
    MOV CX, 2            ; divisor

CHECK_DIV:
    MOV DX, 0
    MOV BX, AX
    DIV CX                ; AX / CX, remainder in DX
    CMP DX, 0
    JE SKIP_NUMBER        ; divisible ? not prime
    INC CX
    MOV AX, BX
    CMP CX, BX
    JL CHECK_DIV          ; try next divisor

    ; -----------------------
    ; Prime found ? break digits
    ; -----------------------
    MOV AX, NUMBER
    MOV BL, 10
    XOR DX, DX
    DIV BL               ; AL=TENS, AH=UNITS
    MOV TENS, AL
    MOV UNITS, AH

    LEA BX, PATTERNS

    ; Display TENS
    MOV AL, TENS
    XLAT
    MOV DX, 2030h
    OUT DX, AL
    MOV CX, 02
DELAY1:
    MOV BX, 6
DELAY1_INNER:
    DEC BX
    JNZ DELAY1_INNER
    LOOP DELAY1

    ; Display UNITS
    MOV AL, UNITS
    XLAT
    MOV DX, 2031h
    OUT DX, AL
    MOV CX, 02
DELAY2:
    MOV BX, 6
DELAY2_INNER:
    DEC BX
    JNZ DELAY2_INNER
    LOOP DELAY2

SKIP_NUMBER:
    INC NUMBER
    CMP NUMBER, 51
    JB NEXT_NUMBER

    ; End program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
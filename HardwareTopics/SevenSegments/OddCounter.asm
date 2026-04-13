.MODEL SMALL
.STACK 100H

.DATA
    PATTERNS DB 3Fh,06h,5Bh,4Fh,66h,6Dh,7Dh,07h,7Fh,6Fh
    
    COUNTER DW 1   ; Start from ODD
    
    HUNDREDS DB ?
    TENS     DB ?
    UNITS    DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

COUNT_LOOP:

    MOV AX, COUNTER
    MOV CX, 10
    
    ; Units
    XOR DX, DX      
    DIV CX          
    MOV UNITS, DL   
    
    ; Tens & Hundreds
    XOR DX, DX      
    DIV CX          
    MOV TENS, DL    
    MOV HUNDREDS, AL

    LEA BX, PATTERNS    
    
    ; Hundreds
    MOV AL, HUNDREDS
    XLAT                
    MOV DX, 2030h
    OUT DX, AL
    
    ; Tens
    MOV AL, TENS
    XLAT
    MOV DX, 2031h
    OUT DX, AL
    
    ; Units
    MOV AL, UNITS
    XLAT
    MOV DX, 2032h
    OUT DX, AL

    ; Delay
    MOV CX, 01h
OUTER_DELAY:
    MOV BX, 6h       
INNER_DELAY:
    DEC BX
    JNZ INNER_DELAY
    LOOP OUTER_DELAY

    ; ODD increment
    ADD COUNTER,2         

    CMP COUNTER, 1000     
    JL COUNT_LOOP      

    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
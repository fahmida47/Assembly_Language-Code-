.MODEL SMALL
.STACK 100H

.DATA
    ; Active-High 7-segment bit patterns for numbers 0-9
    PATTERNS DB 3Fh, 06h, 5Bh, 4Fh, 66h, 6Dh, 7Dh, 07h, 7Fh, 6Fh
    
    COUNTER DW 999  ; Start at 999
    
    HUNDREDS DW ?
    TENS     DW ?
    UNITS    DW ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

COUNT_LOOP:

    MOV AX, COUNTER
    MOV CX, 10
    
    ; Get Units
    XOR DX, DX      
    DIV CX          
    MOV UNITS, DX   
    
    ; Get Tens & Hundreds
    XOR DX, DX      
    DIV CX          
    MOV TENS, DX    
    MOV HUNDREDS, AX


    LEA BX, PATTERNS    
    
    ; Hundreds (Address 2030h)
    MOV AX, HUNDREDS
    XLAT                
    MOV DX, 2030h
    OUT DX, AL
    
    ; Tens (Address 2031h)
    MOV AX, TENS
    XLAT
    MOV DX, 2031h
    OUT DX, AL
    
    ; Units (Address 2032h)
    MOV AX, UNITS
    XLAT
    MOV DX, 2032h
    OUT DX, AL


    MOV CX, 01h
OUTER_DELAY:
    MOV BX, 6h       
INNER_DELAY:
    DEC BX
    JNZ INNER_DELAY
    LOOP OUTER_DELAY


    SUB COUNTER,2         
    
    CMP COUNTER, 301     
    JGE COUNT_LOOP      


    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
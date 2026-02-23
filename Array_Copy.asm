.MODEL SMALL
.STACK 100h

.DATA
A DB 1,2,3,4,5       ; Original array
N EQU 5
B DB N DUP(?)         ; Destination array

MSG DB 0AH,0DH,"Copied array: $"

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    LEA SI,A           ; Source pointer
    LEA DI,B           ; Destination pointer
    MOV CX,N           ; Number of elements

COPY_LOOP:
    MOV AL,[SI]        ; Load element from A
    MOV [DI],AL        ; Store in B
    INC SI
    INC DI
    LOOP COPY_LOOP

    ;--------------------------
    ; Print Copied array
    ;--------------------------
    MOV AH,9
    LEA DX,MSG
    INT 21H

    LEA SI,B
    MOV CX,N

PRINT_LOOP:
    MOV AL,[SI]
    CBW
    CALL OUTDEC
    INC SI
    LOOP PRINT_LOOP

    MOV AH,4CH
    INT 21H

MAIN ENDP
INCLUDE OUTDEC.ASM
END MAIN
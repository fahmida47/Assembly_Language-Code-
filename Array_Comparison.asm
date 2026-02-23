.MODEL SMALL
.STACK 100h

.DATA
array1 DB 3,5,8,7,9
array2 DB 3,4,87,7,9
N EQU 5

MSG1 DB 0DH,0AH,"Both arrays are SAME$"
MSG2 DB 0DH,0AH,"Both arrays are NOT SAME$"

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    LEA SI,array1      ; Pointer to first array
    LEA DI,array2      ; Pointer to second array
    MOV CX,N           ; Number of elements
    MOV BX,1           ; Assume arrays are same (flag)

COMPARE_LOOP:
    MOV AL,[SI]
    MOV BL,[DI]
    CMP AL,BL
    JNE NOT_SAME       ; If any element different ? NOT SAME

    INC SI
    INC DI
    LOOP COMPARE_LOOP
    JMP ARRAYS_SAME

NOT_SAME:
    MOV BX,0           ; Set flag ? arrays not same

ARRAYS_SAME:
    CMP BX,1
    JE PRINT_SAME

PRINT_NOT_SAME:
    MOV AH,9
    LEA DX,MSG2
    INT 21H
    JMP END_PROGRAM

PRINT_SAME:
    MOV AH,9
    LEA DX,MSG1
    INT 21H

END_PROGRAM:
    MOV AH,4CH
    INT 21H

MAIN ENDP
END MAIN  
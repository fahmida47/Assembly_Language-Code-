.MODEL SMALL
.STACK 100H

.DATA
    ; NADIAA 
    NAMEPATTERNS DB 7Fh, 02h, 04h, 08h, 7Fh ; N 
                 DB 7Eh, 11h, 11h, 11h, 7Eh ; A 
                 DB 7Fh, 41h, 41h, 22h, 1Ch ; D 
                 DB 41h, 41h, 7Fh, 41h, 41h ; I 
                 DB 7Eh, 11h, 11h, 11h, 7Eh ; A 
                 DB 7Eh, 11h, 11h, 11h, 7Eh ; A 
    
    ROT_COUNT    DB 0    
    N_INPUT      DB 0    ;INPUT STORED

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    
    MOV AH, 01h      
    INT 21h
    SUB AL, 30h      
    MOV N_INPUT, AL

MAIN_LOOP:
    
    MOV AH, 01h      
    INT 16h          
    JZ  CONTINUE_DRAW 
    
    MOV AH, 00h      
    INT 16h
    SUB AL, 30h
    MOV N_INPUT, AL   

CONTINUE_DRAW:
    MOV DX, 2000h       
    LEA SI, NAMEPATTERNS
    MOV CX, 30          
    
    
    MOV AL, N_INPUT
    MOV BL, 5
    MUL BL
    MOV BX, AX          

    MOV DI, 0           

DRAW_FRAME:
    MOV AL, [SI]        
    
    CMP DI, BX          
    JGE NO_ROTATE       
    
    PUSH CX
    MOV CL, ROT_COUNT
    ROR AL, CL          
    POP CX

NO_ROTATE:
    OUT DX, AL          
    INC SI
    INC DX
    INC DI
    LOOP DRAW_FRAME

    CALL DELAY_FAST

    INC ROT_COUNT
    AND ROT_COUNT, 7    
    
    JMP MAIN_LOOP

MAIN ENDP

DELAY_FAST PROC
    MOV AX, 01h       
D1: MOV CX, 6h
D2: LOOP D2
    DEC AX
    JNZ D1
    RET
DELAY_FAST ENDP

END MAIN
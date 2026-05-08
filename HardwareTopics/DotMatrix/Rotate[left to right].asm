;20230204047
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
                 DB 00h, 00h, 00h, 00h, 00h ; Space 1
                 DB 00h, 00h, 00h, 00h, 00h ; Space 2
        
        
                 DB 7Fh, 02h, 04h, 08h, 7Fh ; N
                 DB 7Eh, 11h, 11h, 11h, 7Eh ; A
                 DB 7Fh, 41h, 41h, 22h, 1Ch ; D
                 DB 41h, 41h, 7Fh, 41h, 41h ; I
                 DB 7Eh, 11h, 11h, 11h, 7Eh ; A
                 DB 7Eh, 11h, 11h, 11h, 7Eh ; A
                 DB 00h, 00h, 00h, 00h, 00h 
                 DB 00h, 00h, 00h, 00h, 00h 

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    
    MOV CX, 40          
    MOV DX, 2000h       
CLEAR:
    MOV AL, 0           
    OUT DX, AL
    INC DX
    LOOP CLEAR

   
    MOV BX, 40           

SCROLL_START:
    MOV DX, 2000h       
    LEA SI, NAMEPATTERNS        
    ADD SI, BX           

    MOV CX, 40          
DRAW_FRAME:
    MOV AL, [SI]
    OUT DX, AL
    INC SI
    INC DX
    LOOP DRAW_FRAME

    
    CALL DELAY_FAST

    
    DEC BX              
    CMP BX, 0           
    JGE SCROLL_START    
    
    MOV BX, 40          
    JMP SCROLL_START    

MAIN ENDP


DELAY_FAST PROC
    MOV AX, 01h         
D1:
    MOV DI, 6h      
D2:
    DEC DI
    JNZ D2
    DEC AX
    JNZ D1
    RET
DELAY_FAST ENDP

END MAIN
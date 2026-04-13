;4 NO
;CONVERSION KELVIN TO FARHENHEIT
MOV AX, 300       
SUB AX, 273       
MOV BX, 9
MUL BX            
MOV CX, 5
DIV CX            
ADD AX, 32        
INT 3  
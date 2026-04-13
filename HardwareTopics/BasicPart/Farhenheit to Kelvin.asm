;3 NO
;CONVERSION FARHENHEIT TO KELVIN
MOV AX, 130       
SUB AX, 32        
MOV BX, 5
MUL BX            
MOV CX, 9
DIV CX            
ADD AX, 273       
INT 3    
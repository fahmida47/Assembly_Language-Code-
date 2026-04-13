;1 NO
;CONVERSION CELSIUS TO FAHRENHEIT

MOV AX, 37       
MOV BX, 9
MUL BX            
MOV BX, 5
DIV BX            
ADD AX, 32        
INT 3             
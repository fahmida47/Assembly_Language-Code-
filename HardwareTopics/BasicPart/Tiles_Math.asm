;10 NO
;Floor size 80*80, Tiles size 4*4. 
;How many tiles will be required to pave up the floor?
MOV AX, 80
MOV BX, 80
MUL BL
MOV CX, AX
MOV AX, 4

MOV BX, 4
MUL BL
MOV BX, AX
MOV AX, CX
DIV BL
INT 3
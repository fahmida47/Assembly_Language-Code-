;Rename the register addresses        
PPIC_C EQU 1FH
PPIC EQU 1DH
PPIB EQU 1BH
PPIA EQU 19H   

;command register handle
MOV  AL, 10000000B
OUT  PPIC_C, AL      ;goes to control register
MOV  AL, 11110000B
OUT  PPIB, AL        ;goes to PORT B
MOV  AL, 00000000B
OUT  PPIC, AL        ;goes to PORT C     


L1:    
    MOV  AL, 00111111B 
    mov dx,2030h 
    OUT dx, AL 
    Mov cl,100
      L2:
    LOOP  L2    ;goes to PORT A (which is dedicated to seven segment)
    
    MOV  AL, 00000110B 
    mov dx,2030h
    OUT dx, AL  
     Mov cl,100
      L3:
    LOOP  L3 
    
    MOV  AL, 01011011B 
    mov dx,2030h
    OUT dx, AL  
     Mov cl,100
      L4:
    LOOP  L4
    
    
    MOV  AL, 01001111B
    mov dx,2030h
    OUT dx, AL 
    Mov cl,100
      L5:
    LOOP  L5
    
    
    MOV  AL, 01100110b
    mov dx,2030h
    OUT dx, AL  
     Mov cl,100
      L6:
    LOOP  L6
    
   
    
      
    MOV  AL, 01101101b
   mov dx,2030h
    OUT dx, AL 
     Mov cl,100
      L7:
    LOOP  L7
         
   
    
    MOV  AL, 01111101b
    
    mov dx,2030h
    OUT dx, AL
     Mov cl,100
      L8:
    LOOP  L8 
    
    
  
    MOV  AL, 00000111b
    mov dx,2030h
    OUT dx, AL 
     Mov cl,100
      L9:
    LOOP  L9
        
    
    MOV  AL, 11000000B
    JMP  L1
; multi-segment executable file template.


LES_1 segment
start:

    MOV AX, DEDOMENA
    MOV DS, AX

    ; add your code here
          
    lea dx, MINIMA
    mov ah, 9
    int 21h        ; output string at ds:dx      
          
    MOV AL, N
    MUL AL         ; DYNAMH
    
    MOV DH, AL     ; APOTHIKEUSH TOY AL STON DH
    
    MOV AL, N
    MOV DL, 2
    MUL DL         ; POLAPLASIAMOS 2X
    
    SUB DH, AL     ; Sub    
    
    ADD DH, 1 
    
    MOV AL, DH
    
    MOV DL, AL
    ADD DL, 48  
    ADD AH, 2  
    INT 21h;
    
    mov AH, 4CH ; exit to operating system.
    int 21h 
       
LES_1 ends
          
DEDOMENA SEGMENT
    N DB 2
    MINIMA DB "To apotelesma einai: ", 10, 13, "$"
DEDOMENA ENDS            
          
end start ; set entry point and stop the assembler.

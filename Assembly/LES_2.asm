; multi-segment executable file template.

data segment
    msg1 db "Dwse enan arithmo toy dekadikou: ", 10, 13, "$" 
    msg2 db "O arithmos einai 0", 10, 13, "$"
    msg3 db "O Arithmos einai Peritos", 10, 13, "$"
    msg4 db "O arithmos einai artios", 10, 13, "$"
data ends

code segment

; set segment registers:
begin:
    mov ax, data
    mov ds, ax
    
    mov cl, 0
    
    start:        
       lea dx, msg1
       mov ah, 9
       int 21h        ; output string at ds:dx
             
       mov al, 0              
       mov ah, 08h    ; eisagwgh apo pliktrologio me 8h klhsh tou dos
       int 21h
                        
       add al, 48     
       cmp al, '0'     ; elenxos an einai mikroteros tou 0                          
       jbe start      
       
       cmp al, '9'     ; elenxos an einai megalyteros tou 9
       jae start
       
       mov dl, al     ; emfanish arithmoy 
       mov ah, 2                           
       int 21h
       
       cmp al, '0'
       je m2
       
       m2: 
            lea dx, msg2
            mov ah, 9
            int 21h
            jmp next
       
       mov ah, 0 
       mov bl, 2
       div bl
       
       cmp ah, 0
       je m3
       
       m3:
            lea dx, msg3
            mov ah, 9
            int 21h
            jmp next
            
       jne m4
        
       m4:
            lea dx, msg4
            mov ah, 9
            int 21h  
            jmp next
            
       next:
           inc cl
           cmp cl, 5
           jne start 
        
    mov ax, 4c00h ; exit to operating system.
    int 21h    
code ends

end begin
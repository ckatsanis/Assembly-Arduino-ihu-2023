; multi-segment executable file template.

data segment
    N1 db 48
    N2 db 57
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
        
        mov ah, 08h    ; eisagwgh apo pliktrologio me 8h klhsh tou dos
        int 21h
              
        mov ah, al      
        add ah, 48     
        cmp ah, N1     ; elenxos an einai mikroteros tou 0                          
        jbe start      
        
        cmp ah, N2     ; elenxos an einai megalyteros tou 9
        jae start
        
        mov dx, ax     ; emfanish arithmoy 
        mov bx, ax
        mov ah, 2
        int 21h
        
        cmp bh, 48
        je m2
        
        m2: 
            lea dx, msg2
            mov ah, 9
            int 21h
       
       mov dl, 2 
       mov ah, bh
       div dl
       
       cmp ah, 0
       je m3
       
       m3:
            lea dx, msg3
            mov ah, 9
            int 21h
            
       jne m4
        
       m4:
            lea dx, msg4
            mov ah, 9
            int 21h
       
       inc cl
       cmp cl, 5
       je start 
        
    mov ax, 4c00h ; exit to operating system.
    int 21h    
code ends

end begin
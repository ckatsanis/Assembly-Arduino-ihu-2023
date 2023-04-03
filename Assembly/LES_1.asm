TITLE ASK1
ASSUME CS:KODIKAS,DS:DATA
KODIKAS SEGMENT
			; Oi 2 parakatw entoles arxikopioun ton DS.
ARXI:	MOV AX,DATA
     	MOV DS,AX
          
        MOV AL,N	; Metaferoume tin timi toy N ston AL
        MUL AL      ; Kano ton pollaplasiasmo N*N kai to apotelesma pigainei ston AX
         
        MOV CX,AX   ; Metafero to periexomeno tou AX ston CX oste na min xathei meta to epomeno MUL
         
        MOV AL,N	; Metaferoume tin timi toy N ston AL
        MOV BL,2	; Bazoyme sto BL tin timi 2
        MUL BL      ; Kano ton pollaplasiasmo 2*N kai to apotelesma pigainei ston AX
         
        SUB CX,AX   ; Kano tin afairesi N*N-2*N   
        
        INC CX      ; Prosafksano +1
          
        MOV AX,CX   ; Metafero to apoelesma son AX
         
        MOV CL,10   ; Bazoyme sto CL tin timi 10 
        DIV CL		; Diairoyme to periexomeno tou AX me to CL gia na ginei o dipsifios 2 monopsifioi
         
        MOV BX,AX   ; Metafero to periexomeno tou AX ston BX gia prosorini apothikeysi
         
        LEA DX,MES  ; Bazoyme ti dieythinsi mnimis toy Mes ston DX
        MOV AH,9 	; Metaferoyme ston AH to 9 gia na mporoyme na emfanisoyme to Mes
        INT 21H 	; Kaloyme to leitoyrgiko systima na emfanisei stin othoni to Mes
         
        MOV DL,BL   ; Metaferoyme to periexomeno tou BL ston DL
        ADD DL,48	; Prosthetoyme ston DL tin timi 48 gia na metatrepsoyme ton aritmo stin ASCII timi toy
        MOV AH,2	; Metaferoyme ston AH to 2 gia na mporoyme na emfanisoyme to periexomeno toy DL
        INT 21H		; Kaloyme to leitoyrgiko systima na emfanisei stin othoni tin ASCII timi poy exei o DL
         
        MOV DL,BH   ; Metaferoyme to periexomeno tou BH ston DL
        ADD DL,48	; Prosthetoyme ston DL tin timi 48 gia na metatrepsoyme ton aritmo stin ASCII timi toy
        MOV AH,2	; Metaferoyme ston AH to 2 gia na mporoyme na emfanisoyme to periexomeno toy DL
        INT 21H		; Kaloyme to leitoyrgiko systima na emfanisei stin othoni tin ASCII timi poy exei o DL
     			    ; Oi 2 epomenes entoles termatizoyn to programma kai epistrefoyn sto leitoyrgiko sistima
        MOV AH,4CH
        INT 21H
KODIKAS ENDS

DATA SEGMENT 
    N DB 6   	; H metabliti me onoma N dilonete na einai typoy BYTE me arxiki timi to 6
			    ; Stin epomeni grammi dilonoyme to minima poy theloyme na emfanistei
    MES DB " TO APOTELESMA EINAI: ",10,13,"$"      
DATA ENDS 

END ARXI		; Me tin odigia END leme apo poy tha arxisei na ektelite to programma mas
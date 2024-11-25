;TITLE PGM4_2: PRINT STRING PROGRAM   


.MODEL SMALL 
.STACK 100H

.DATA
MSG1 DB 0DH,0AH, 'ENTER A LOWER CASE LETTER :$'; 
MSG2 DB 0DH,0AH, 'ITS IS IN UPPER CASE :$';
char DB ?,'$';


.CODE 
    MAIN PROC
        ;initialize DS
            MOV AX, @DATA
            MOV DS, AX          ; initialize DS
        ;display message
            LEA Dx, MSG1         ;get message
            MOV AH, 9           ;disply string function
            INT 21h             ;display message    
            
        ;input a character
        MOV AH,1;
        int 21H;
        ;convert to upper case
        SUB AL,20h;
        mov CHAR,AL;
        ;display on the next line  
         LEA DX, MSG2;         ;get message
            MOV AH, 9           ;disply string function
            INT 21h 
            
             LEA DX, CHAR         ;get message
            MOV AH, 9           ;disply string function
            INT 21h 
        
        ;return to DOS
            MOV AH, 4CH
            INT 21h             ;DOS exit
    MAIN ENDP
    END MAIN
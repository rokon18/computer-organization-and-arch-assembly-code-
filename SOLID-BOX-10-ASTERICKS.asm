.MODEL SMALL
.STACK 100H
.DATA
MSG DB 0DH,0AH,"**********$"

.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG
    MOV AH,9
    INT 21H 
    
    LEA DX,MSG
    MOV AH,9
    INT 21H
    
    LEA DX,MSG
    MOV AH,9
    INT 21H
    
    LEA DX,MSG
    MOV AH,9
    INT 21H
    
    LEA DX,MSG
    MOV AH,9
    INT 21H
    
    LEA DX,MSG
    MOV AH,9
    INT 21H
    
    LEA DX,MSG
    MOV AH,9
    INT 21H
    
    LEA DX,MSG
    MOV AH,9
    INT 21H
    
    LEA DX,MSG
    MOV AH,9
    INT 21H
    
    LEA DX,MSG
    MOV AH,9
    INT 21H
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN
    
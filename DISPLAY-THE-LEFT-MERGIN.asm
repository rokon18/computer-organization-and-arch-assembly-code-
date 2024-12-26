.MODEL SMALL
.STACK 100H
.DATA

MSG DB "ENTER THE THREE NAME:$"
NEWLINE DB 0DH,0AH,"$"

.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     
     LEA DX,MSG
     MOV AH,9
     INT 21H
     
    MOV AH,1
    INT 21H
    MOV BL,AL 
    
    MOV AH,1
    INT 21H
    MOV CL,AL
    
    MOV AH,1
    INT 21H
    MOV BH,AL  
    
   
     
    LEA DX,NEWLINE
    MOV AH,9
    INT 21H
    MOV AH,2    
    MOV DL,BL
    INT 21H 
    
 
    LEA DX,NEWLINE
    MOV AH,9
    INT 21H     
    MOV AH,2
    MOV DL,CL
    INT 21H 
    
  
  
    LEA DX,NEWLINE
    MOV AH,9
    INT 21H 
    MOV AH,2
    MOV DL,BH
    INT 21H
    
    
    
    
    
    
    
    
   MOV AH,4CH
   INT 21H
   
   MAIN ENDP
END MAIN   



.model small
.stack 100h
.data

promt db 'Enter a char:$'
msg_upper db 0dh,0ah, 'convert to upper case:$'    
msg_lower db 0dh,0ah, 'convert to lower case:$' 
msg_not_letter db 'input is not a letter.$'
input_char db ?
.code 
main proc

mov ax,@data
mov ds,ax 

mov ah,9
lea dx,promt
int 21h
;read input char
mov ah,1
int 21h

mov input_char,al;save input char
;check input is a letter

cmp input_char,'A'
jb not_letter
cmp input_char,'Z'
jbe upper_case
cmp input_char,'a'
jb not_letter
cmp input_char,'z'
ja not_letter  


lower_case:
;convert to upper case

and input_char,11011111b
;print result

mov ah,9
lea dx,msg_upper
int 21h
mov ah,2
mov dl,input_char
int 21h

jmp exit_program

upper_case:
;convert to lower case
or input_char,00100000b
;print result
mov ah,9
lea dx,msg_lower
int 21h
mov ah,2
mov dl,input_char
int 21h
jmp exit_program
not_letter:
;print error msg
mov ah,9
lea dx,msg_not_letter
int 21h
jmp exit_program

exit_program:
mov ah,4ch
int 21h
main endp
end main
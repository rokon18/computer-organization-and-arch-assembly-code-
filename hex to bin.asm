.model small
.stack 100h
.data
msg1 db  "Enter a hex number (1 to 4 digits): $"
msg2 db 0dh,0ah, "The binary equivalent is: $"
msg3 db 0dh,0ah, "Invalid hex number!$"
.code
main proc
    mov ax, @data
    mov ds, ax

input:
    ; Prompt user for input
    mov ah, 09h
    lea dx, msg1
    int 21h

    ; Initialize registers
    ;xor bx, bx  ; Clear BX (to store binary result)
    mov cx, 4  ; Maximum of 4 hex digits

read_digit:
    mov ah, 01h
    int 21h     ; Read a character
    cmp al, 0dh ; Check if Enter is pressed
    je convert  ; Jump to conversion if Enter is pressed

    ; Validate the input character
    cmp al, '0'
    jb invalid
    cmp al, '9'
    jbe valid_digit
    cmp al, 'A'
    jb invalid
    cmp al, 'F'
    jbe valid_digit
    cmp al, 'a'
    jb invalid
    cmp al, 'f'
    ja invalid

valid_letter:
    ; Convert lowercase letters to uppercase
    sub al, 20h ; Convert 'a'-'f' to 'A'-'F'

valid_digit:
    ; Convert hex digit to numeric value
    cmp al, '9'
    jbe store_numeric
    sub al, 'A' - 10; Convert 'A'-'F' to 10-15 
    jmp store_value

store_numeric:
    sub al, '0'

store_value:
    shl bx, 4   ; Shift existing value left by 4 bits
    or bl, al   ; Add new digit
    
    loop read_digit

convert:
    ; Output binary result
    mov ah, 09h
    lea dx, msg2
    int 21h

    mov cx, 16  ; Binary output is 16 bits
    xor dx, dx  ; Clear DX for storing each bit

print_binary:
    shl bx, 1   ; Shift left to bring MSB into CF
    jc print_one
    mov dl, '0'
    jmp display
print_one:
    mov dl, '1'

display:
    mov ah, 02h
    int 21h
    loop print_binary

    exit:
    mov ah, 4ch
    int 21h

invalid:
    mov ah, 09h
    lea dx, msg3
    int 21h
    jmp exit 


main endp
end main

.model small
.stack 100h
.data
msg db 10,13,'please input the number you want to chek parity for! ','$'
num db ?
m1 db 10,13,'this is even number','$'
m2 db 10,13,'this is odd number','$'
.code
main proc
mov ax,@data
mov ds,ax

mov dx,offset msg
mov ah,09h
int 21h

mov ah,01
int 21h
sub al,30h

mov bl,02h
div bl

cmp ah,0
jnz odd
mov dx,offset m1
mov ah,09h
int 21h
jmp exit
odd:
mov dx,offset m2
mov ah,09h
int 21h 
exit:
mov ah,4ch
int 21h
main endp
end main


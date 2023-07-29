; this program convert number from decimal
;  to binary   
;
; proc beggining code = none
; if not clear please read dos interupts
;-------------  ------------------ ----------- ------------------ ----------- -----------

.model small
.stack 100h
.data
 msg db 10,13,'please input the number you want to convert to binary',10,13,'------->','$'
 msg2 db 10,13,' the number is converted succesfull----->$'
 num db 5
         db ?
         db 5 dup(' ')
 result db 4 dup(' '),'$'
         
 print macro  msg
 lea dx,msg
 mov ah,09h
 int 21h 
 endm
 
 input macro num
 lea dx,num
 mov ah,0ah
 int 21h 
 endm 
 
 .code 
 main proc
 mov ax,@data
 mov ds,ax
 mov es,ax
 mov ss,ax
  mov si,0
  mov di,0
  mov bx,0
  call cls
 
 print msg
 input num
 
 call cls    ;clear screen 
 
 lea si,num
 inc si
 xor cx,cx
 mov cl,byte ptr[si]
 add si,cx
 xor bx,bx
 mov bp,01
 
convertd:
xor ax,ax
xor dx,dx
std
lodsb
sub al,30h
mul bp
add bx,ax
mov ax,bp
mov bp,10              ;  hex num  is in bx 
mul bp
mov bp,ax
loop convertd

 ;-----------------------------------------------
 ; now we divide by two until 
 ; quatient is 0 and store result in stack  pop back
 ; since stack is lifo or last in firstout 
 ;---------------------------------------------------------------
      mov ax,bx
      mov bp,2
      xor cx,cx
      startb:
      xor dx,dx
      div  bp
      inc cx
      push dx
      test ax,ax
      jnz startb 
      
       print msg2
      
         ; now display  the numbers  
         
         binaryd:
          pop dx
          add dl ,30h
          mov ah,02h
          int 21h
      loop binaryd 
      
 		
 ;--------]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]\\\\\\\\\\\\\\\\\
 mov ah,4ch
 int 21h 
     
     wai proc
     push bx
     push cx
 mov cx,10
 w01:
 mov bx,9999
 w02:
 dec bx
 jnz w02
 loop  w01
 pop cx
 pop bx
 ret 
 wai endp
 
 		cls proc
mov ax,03
int 10h
ret
  cls endp
 
  main endp
  end main 
  
  
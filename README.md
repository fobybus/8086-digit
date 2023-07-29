# 8086 digit processing 

this is simple repo containing two simple assembly files
1. parity checker
2. decimal to binary converter
## parity checker
the partity checker program take one digit from the user then it transform the user number from ascii
to numerical value by substracting 30h from it. after that it will divide the number by two and checks its
remainder that stored in ah register 🌶️

## decimal to binary 
this program follows the same procedure as a parity checker to take the input from the user.
to convert the number to binary it uses the method of flipped remainder(dividing the number by two and storing the remainder in reversed order)
- for storing remiander in reversed order it uses a stack
  ```  mov ax,bx
      mov bp,2
      xor cx,cx
      startb:
      xor dx,dx
      div  bp
      inc cx
      push dx
      test ax,ax
      jnz startb
  ```
# usage table
 ***********
 | Filename |Assembling | linking |
 |----------- |---------|---------|
 |**d2b.asm**| **masm d2b.asm d2b.obj**|**link d2b**|
 |**parity.asm** |**masm parity.asm parity.obj**|**link party.obj**|
 
   

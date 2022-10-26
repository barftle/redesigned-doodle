GLOBAL gauss ;

SECTION .text

gauss:
   MOV rbx, rdi ; rbx = rdi
   MOV rax, rdi ; rax = rdi
   MUL rbx ; rdx:rax = rax * rax
   ADD rax, rbx ; rax = rax + rbx
   MOV rbx, 2 ; rbx = 2
   DIV rbx ; rax = rdx:rax/rbx
RET

GLOBAL formula_int, formula_flt

SECTION .data;

null:   dq  0.0    ;
acht:   dq  8.0    ;
vier:   dq  4.0    ;
zwei:   dq  2.0    ;
drei:   dq  3.0    ;



SECTION .text;

formula_int:

    mov rax, 0; macht rax = 0
    ;a = rdi
    ;b = rsi
    ;c = rdx => ueberlauf von mul und div => r11
    mov r11, rdx;
    ;d = rcx
    ;e = r8
    ;f = r9
    ;g = [rsp+8]
    ;h = [rsp+16]
    
    ;überklammer eins
    ;klammer ab
    add rdi, rsi;
    ;klammer cd
    sub r11, rcx;

    ;multiplizieren ab und cd
    mov rax, rdi;
    mul r11;
    mov rdi, rax;

    ;überklammer zwei
    ;e*8
    mov rax, 8;
    mul r8;
    mov r8, rax;
    ;f*4
    mov rax, 4;
    mul r9;
    mov r9, rax;
    ;g/2
    mov rax, [rsp+8];
    mov r10, 2;
    div r10;
    mov [rsp+8], rax;
    ;h/4
    mov rax, [rsp+16];
    mov r10, 4;
    div r10;
    mov [rsp+16], rax;

    ;überklammer zwei aufaddieren
    add r8, r9;
    sub r8, [rsp+8];
    add r8, [rsp+16];

    ;überklammern multiplizieren
    mov rax, rdi;
    mul r8;
    mov rdi, rax;
    mov rax, 0;

    ;division durch 3
    mov rax, 0;
    mov rdx, 0;
    mov r10, 0;

    mov rax, rdi;
    

    mov r10, 3;
    div r10;

    
    ret;


formula_flt:
    ;a = xmm0
    ;b = xmm1
    ;c = xmm2
    ;d = xmm3
    ;e = xmm4
    ;f = xmm5
    ;g = xmm6
    ;h = xmm7
    ;mov xmm0, xmm1;
    ;https://redirect.cs.umbc.edu/courses/undergraduate/313/fall04/burt_katz/lectures/Lect12/floatingpoint.html
    addsd xmm0, xmm1;
    movsd xmm1, xmm0;               xmm1 = a+b
    movsd xmm0, [rel null];
    subsd xmm2, xmm3;               xmm2 = c-d

    
    mulsd xmm4, [rel acht];
    mulsd xmm5, [rel vier];
    divsd xmm6, [rel zwei];
    divsd xmm7, [rel vier];

    mulsd xmm1, xmm2;               xmm1 = (a+b)*(c-d)
    movsd xmm0, xmm1;

    addsd xmm4, xmm5;
    subsd xmm4, xmm6;
    addsd xmm4, xmm7;

    mulsd xmm1, xmm4;
    divsd xmm1, [rel drei];

    movsd xmm0, xmm1;

    ret;
GLOBAL formula_int, formula_flt
SECTION .text

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
    neg rax;

    mov r10, 3;
    div r10;

    neg rax;
    ret;


formula_flt:
    ;mov xmm0, xmm1;
    ;https://redirect.cs.umbc.edu/courses/undergraduate/313/fall04/burt_katz/lectures/Lect12/floatingpoint.html
    ret;
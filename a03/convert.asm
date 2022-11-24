;Bruno Stendal, Martin Baer, Lukas Gewinner, Christian Schaefer          
            global strToInt

strToInt:
    mov rax, 0;
    mov rcx, 0;
  .loop:
    mov rdx, 0;
    mov dl, [rdi+rcx];
    sub dl, 48;
    add al, dl;
    inc rcx;
    mov dl, [rdi+rcx]; 
    cmp dl, 0;
    je .end;
    jne .mult;
  .mult
    mul rsi;
    jmp .loop;
  .end
    ret

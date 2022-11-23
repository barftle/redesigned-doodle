;Bruno Stendal, Martin Baer, Lukas Gewinner, Christian Schaefer          
            global strToInt

strToInt:   
    mov rcx, 0;
  .loop:
    mov al, [rdi+rcx];
    sub rax, 48;
    inc rcx;
    cmp [rdi+rcx], 0;
    je .end;
    jne .mult;
  .mult
    mul rsi;
    jmp .loop;
  .end
    ret

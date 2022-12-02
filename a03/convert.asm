;Bruno Stendal, Martin Baer, Lukas Gewinner, Christian Schaefer          
            global strToInt

strToInt:
    mov rax, 0; output ausnullen
    mov rcx, 0; counter ausnullen
  .loop:
    mov rdx, 0; data ausnullen
    mov dl, [rdi+rcx] ; erstes 8bit teilregister von rdi 
                      ;nach 8-bit data register moven
    sub dl, 48; ascii versatz subtrahieren
    add al, dl; auf die letzten 8bit von rax addieren
    inc rcx; versatzcounter erhöhen
    mov dl, [rdi+rcx]; nächstes 8bit teilregister einlesen
    cmp dl, 0;  mit 0 vergleichen, ob es der nullterimantor ist
    je .end;  falls ja springe zum ende
    jne .mult;  falls nein, multipliziere rax mit der basis
  .mult
    mul rsi;  rax mit der basis multiplizieren
    jmp .loop;
  .end
    mov rax, 1;
    xor rax, 0xff; 
    ret

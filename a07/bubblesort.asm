;Bruno Stendal, Martin Baer, Lukas Gewinner, Christian Schaefer  
GLOBAL sort

SECTION .data;

SECTION .text;
;rdi = rax = max length array
;rcx = counter
;rdx = swap
;r8 = swapA
;r9 = swapB

sort:
    mov rax, rdi                    ; um den wert als debugging info zu benutzten   
    .start:
        mov rcx, 0;                 ; initial den counter auf den ersten wert, nullten wert, setzten 
        dec rax;                    ; den max wert um eins verringern da wir von null starten
    .check:
        cmp rax, 0;                 ; abbruch bedingung
        je .end;            

        cmp rcx, rax;               ; vergleich ob das ende der zu druchsuchenden liste erreicht ist
        jl .compare;                ; sprung falls nein
        
        mov rcx, 0;                 ; falls ja werden das ende um eins begrenzt, siehe bubblesort, und der counter wieder zurück gesetzt
        dec rax;
        jmp .compare;
    .compare:
        mov r8, [rsi+8*rcx];        
        mov r9, [rsi+8*(rcx+1)];
        cmp r8, r9;                 ; vergleich zwischen werta und wertb
        jg .greater;                ; falls nicht getauscht wird
        jl .swapped;                ; falls getauscht wird
    .greater:
        mov [rsi+8*rcx], r9;        ; werta ersetzt wertb
        mov [rsi+8*(rcx+1)], r8;    ; wertb ersetzt werta
        jmp .swapped;
    .swapped:
        inc rcx;                    ; counter um eins erhöhen um das nächste paar zu checken
        jmp .check;
    .end:
        ret;                        ; funktiosende
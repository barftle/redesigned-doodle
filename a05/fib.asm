Global asm_fib_it, asm_fib_rek

SECTION .text

asm_fib_it:
	                    ;rdi = n
	XOR rdx, rdx        ;rdx = x = 0
	MOV rcx, 1          ;rcx = y = 1
	XOR r8, r8          ;r8 = k = 0
	.schleife:
		CMP rdi, 0      ;rdi wird mit Null verglichen.
		JG .calc        ;wenn edi größer ist als Null, dann springt er zu .calc.
		MOV rax, r8     ;der Wert in r8(k) wird auf rax verschoben, wobei r8 den Wert behält.
		RET             ;gibt rax aus.
	
	
	
	.calc:
		MOV rdx, rcx    ;der Wert in rcx(y) wird nach rdx(x) verschoben, wobei rcx den Wert behält. 
		MOV rcx, r8     ;der Wert in r8(k) wird nach rcx(y) verschoben, wobei r8 den Wert behält.
		MOV r10, rdx    ;der Wert in rdx(x) wird nach r10 verschoben, wobei rdx den Wert behält.
		ADD r10, rcx    ;r10 = r10(x) + rcx(y)
		MOV r8, r10     ;das Ergebniss aus der Addition wird jetzt nach r8(k) verschoben, aus r10.
		DEC rdi         ;rdi(n) wird im eins kleiner, also rdi(n) = rdi(n) - 1
		JMP .schleife   ;sprint zurueck zur Funktion .schleife.



asm_fib_rek:
        mov rax, 0      ;ergebnis ausnullen zur sicherheit
        mov rcx, 0      ;es muessen diese Register vor der Rekursion auf Null gesetzt werden

.check:                 ;check ob rdi unter 3
        cmp rdi, 3      ;pseudocode zeile 2
        jb .end         ;pseudocode zeile 3
        jmp .fib_rek  ;pseudocode else statement

.end:
        mov rax, 1      ;falls rekursions anker erreicht wird, rueckgabe 1
        ret             ;rueckgabe -> rekursions schritt hoch

.fib_rek:
        push rcx        ;rcx zweiter counter pushen

        sub rdi, 1      ;counter herrab setzten
        push rax        ;ergebnis pushen
        push rdi        ;counter pushen -> fuer rueck operation
        
        call .check     ;sprung fuer n-1
        
        mov rcx, rax    ;ergebis sichern
        
        pop rdi         ;counter pushen -> zeile 42
        pop rax         ;ergebnis pushen
        sub rdi, 1      ;fall n-2 (2mal -1, siehe zeile 40)
        
        call .check     ;n-2 sprung
        
        add rax, rcx    ;ergebnisse addieren
        pop rcx         ;counter popen, wiederherstellen
        ret             ;rueckgabe -> rekursions schritt hoch
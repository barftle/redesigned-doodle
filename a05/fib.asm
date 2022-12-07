Global asm_fib_it, asm_fib_rek

SECTION .text

asm_fib_it:
	; rdi = n
	XOR rdx, rdx ; rdx = x = 0
	MOV rcx, 1 ; rcx = y = 1
	XOR r8, r8 ; r8 = k = 0
	.schleife:
		CMP rdi, 0 ; rdi wird mit Null verglichen.
		JG .calc ; wenn edi größer ist als Null, dann springt er zu .calc.
		MOV rax, r8 ; der Wert in r8(k) wird auf rax verschoben, wobei r8 den Wert behält.
		RET ; gibt rax aus.
	
	
	
	.calc:
		MOV rdx, rcx ; der Wert in rcx(y) wird nach rdx(x) verschoben, wobei rcx den Wert behält. 
		MOV rcx, r8 ; der Wert in r8(k) wird nach rcx(y) verschoben, wobei r8 den Wert behält.
		MOV r10, rdx ; der Wert in rdx(x) wird nach r10 verschoben, wobei rdx den Wert behält.
		ADD r10, rcx ; r10 = r10(x) + rcx(y)
		MOV r8, r10 ; das Ergebniss aus der Addition wird jetzt nach r8(k) verschoben, aus r10.
		DEC rdi ; rdi(n) wird im eins kleiner, also rdi(n) = rdi(n) - 1
		JMP .schleife ; sprint zurück zur Funktion .schleife.


asm_fib_rek:
	RET;
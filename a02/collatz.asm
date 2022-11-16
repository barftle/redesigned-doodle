;Bruno Stendal, Martin Baer, Lukas Gewinner, Christian Schaefer
GLOBAL collatz

SECTION .text


collatz:
	MOV rcx,0 ; das ist k das am Anfang 0 ist.
  .start:
	CMP rdi, 1 	; Paramenter 1 wird mit 1 Verglichen.
	JA .if  	; Wenn Parameter 1 größer 1, dann spring 
				; zu .if sonst nicht.
	MOV rax,rcx  ; rcx wird nach rax getan, damit k 
				 ; ausgegeben wird.
	RET			; rax (k) wird ausgegeben

  .if:
	MOV rax, rdi ; Der erste Parameter tut man auf rax.
	SHR rax,1 	; Die Zahl in rax wird durch 2 geteilt.
	JC .else 	; wenn carry Flag kommt (beim teilen von Zahl 
				; wird ein Bit übertragen, wegen dem Rest,
				; in das nächsthöchere Bit) springt zur 
				; Funktion _else sonst nicht.
	SHR rdi,1 	; rdi wird um zwei geteilt.
	INC rcx 	; rcx = rcx + 1 (rcx entspricht k)
	JMP .start 	; springt zur Funktion .start zurück.
	
	
  .else:
	MOV r11, 3 	; Zahl 3 wird nach r11 getan.
	MOV rax,rdi ; rdi wird nach rax getan.
	MUL r11 	; rax = rax * r11
	INC rax 	; rax = rax + 1
	MOV rdi,rax ; rax wird nach rdi getan damit die Schleife 
				; funktioniert.
	INC rcx 	; rcx = rcx + 1 (rcx entspricht dem k)
	JMP .start 	; springt zurück zur Funktion .start.
	

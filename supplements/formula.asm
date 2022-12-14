GLOBAL formula
SECTION .text

formula:
XOR rax,rax ; macht rax = 0
ADD edi,esi ; (a+b)
MOV eax, edi ; Das Ergebniss von (a+b) wird nach eax verschoben.
SUB edx, ecx ; (c-d)
MUL edx ; Ergebniss von ((a+b) * (c-d)), dass in rax drin ist.


SAL r8d, 3 ; e*8
SAL r9d, 2 ; f*4
ADD r9d,r8d ; Ergebniss von (e*8 + f*4).
MOV edx,[rsp+8] ; Der Parameter g ist jetzt im edx.
MOV ecx,[rsp+16] ; Der Parameter h ist jetzt im ecx.
;MOV esi,edx
;MOV edi,ecx
;SHR esi,1 ; Die Zahl in esi wird durch 2 geteilt.
;JC .calc ; Wenn rest beim teilen, dann springt er zu .clac.
;SHR edi,1 ; Die Zahl in edi wird durch 2 geteilt.
;JC .calc ; Wenn rest beim teilen, dann springt er zu .clac.
SAR edx, 1 ; g wird durch 2 geteilt.
SAR ecx, 2 ; h wird durch 4 geteilt.
ADD edx, ecx ; Ergebniss von (g/2 + h/4).
SUB r9d,edx ; Ergebniss von (g/2 + h/4)- (e*8 + f*4)
MUL r9d ; Das Ergeniss von der linken Klammer wird mit dem Ergebniss der rechten Klammer multipliziert.
XOR rdx, rdx
MOV ecx, 3
DIV ecx
;CMP edx, 0
;JNE .calc
RET

;.calc:


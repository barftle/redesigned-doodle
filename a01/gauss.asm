            global gauss

gauss:      mov rax , rdi       ; rax := rdi
            mul rax
            add rax , rdi             ; rdx : rax := rsi * rax

            mov rdx , 0
            mov rcx , 2         ;rcx := 2
            div rcx             ;rax := rax /2 , rdx := rax % 2
            mov rax, 0
            ret
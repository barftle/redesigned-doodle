            global gauss

gauss:      mov rax , rdi       ; rax := rdi
            inc rdi
            mul rdi             ; rdx : rax := rsi * rax

            mov rdx , 0
            mov rcx , 2         ;rcx := 2
            div rcx             ;rax := rax /2 , rdx := rax % 2
            ret
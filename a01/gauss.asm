            global gauss

gauss:      mov rax , rdi       ; rax := rdi
            inc rdi
            mul rsi             ; rdx : rax := rsi * rax

            
            ; not neccessarily needed here :
            ; mov rdx , 0

            mov rcx , 2         ; rcx := 2
            div rcx             ;rax := rax /2 , rdx := rax % 2
            ret
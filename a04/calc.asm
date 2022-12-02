;Bruno Stendal, Martin Baer, Lukas Gewinner, Christian Schaefer          
            global calc_add

calc_add:
        mov rsp, 0;

        movd edx, xmm0;
        shr edx, 31;
        mov ah, dl;

        movd edx, xmm0;
        shl edx, 1;
        shr edx, 24;
        mov al, dl;

        movd edx, xmm0;
        shl edx, 9;
        shr edx, 9;
        mov esi, edx;
        add esi, 8388608;

        mov rcx, 0;
        mov rdx, 0;
        
        movd edx, xmm1;
        shr edx, 31;
        mov ch, dl;

        movd edx, xmm1;
        shl edx, 1;
        shr edx, 24;
        mov cl, dl;

        movd edx, xmm1;
        shl edx, 9;
        shr edx, 9;
        mov edi, edx;
        add edi, 8388608;

        ;ah sign a
        ;al expo a
        ;esi mat a

        cmp ah, 1;
        jne .matisse;
        xor esi, 0xff;

        ;ch sign b
        ;cl expo b
        ;edi mat b

        cmp ch, 1;
        jne .matisse;
        xor edi, 0xff;

      .matisse:
        cmp al, cl;
        jl .shiftA
        jg .shiftB
        je .noShift;

      .shiftA:

        mov rdx, 0;
        mov dl, cl;

        mov cl, dl;
        sub cl, al;

        shr esi, cl;

        mov al, dl;
        mov cl, dl;
        jmp .noShift;
    
      .shiftB:

        mov rdx, 0;
        mov dl, cl;

        mov cl, al;
        sub cl, dl;

        shr edi, cl;

        mov cl, dl;
        jmp .noShift
    
      .noShift:

        mov rdx, 0;
        mov edx, esi;
        add edx, edi;


        mov rbx, 0;
        mov ebx, edx;
        shr ebx, 23;
        cmp ebx, 0;
        jne .expoPlus

        jmp .end

      .expoPlus:
        jmp .end;

      .end:
        shl edx, 1;
        shr edx, 1;

        cmp ah, 1;
        jne .endBuild
        xor edx, 0xff;
        cmp ah, 1;
        je .endBuild

        cmp ch, 1;
        jne .endBuild
        xor edx, 0xff;

      .endBuild:

        mov rbx, 0;
        mov bl, ah;
        shl rbx, 8;
        mov bl, al;
        shl rbx, 23;
        add ebx, edx;
        movd xmm0, ebx;
        ret
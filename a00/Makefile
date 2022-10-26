nasm: sample.asm
		nasm -f elf64 -o sample.o sample.asm
		c99 -O2 -c -o sample_wrapper.o sample_wrapper.c
		99 -o sample sample_wrapper.o sample.o
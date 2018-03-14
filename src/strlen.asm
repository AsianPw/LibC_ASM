		global	my_strlen:function
my_strlen:
	mov		rax, 0		;counter

strlen_while:
	cmp		BYTE [rdi + rax], 0
	jz		strlen_end
	inc		rax			;increment rcx
	jmp		strlen_while

strlen_end:
	ret

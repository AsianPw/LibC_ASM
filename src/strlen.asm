		global	strlen:function
strlen:
	mov		rcx, 1		;counter

strlen_while:
	cmp		BYTE [rdi + rcx], sil
	jz		strlen_end
	inc		rcx			;increment rcx
	jmp		strlen_while

strlen_end:
	ret

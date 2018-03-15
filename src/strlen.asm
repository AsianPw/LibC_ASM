GLOBAL	strlen:function

SECTION	.text

strlen:
	ENTER	0, 0
	MOV		RCX, 0			; counter rcx =0

	strlen_while:
		CMP		BYTE[RDI], 0
		JZ		end
		INC		RCX			; increment rcx
		INC		RDI			; next char
		JMP		strlen_while

	end:
		MOV		RAX, RCX	; pass counter to ret value
		LEAVE
		RET

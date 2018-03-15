GLOBAL	memmove
SECTION	.text

memmove:
	ENTER	0, 0
	MOV		RCX, 0

	loop:
		CMP		RDX, RCX
		JZ		end
		MOV		R8B, BYTE[RSI + RCX]
		MOV		BYTE[RDI + RCX], R8B
		INC		RCX
		JMP		loop

	end:
		MOV		RAX, RDI
		LEAVE
		RET

GLOBAL	memcpy
SECTION	.text

memcpy:
	ENTER	0, 0
	MOV		RCX, 0

	loop:
		CMP		RDX, RCX
		JZ		end
		MOV		R8B, BYTE[RSI]
		MOV		BYTE[RDI], R8B
		INC		RCX
		INC		RSI
		INC		RDI
		JMP		loop

	end:
		MOV		RAX, RDI
		LEAVE
		RET

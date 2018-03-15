GLOBAL	strcmp

SECTION	.text

strcmp:
	ENTER	0, 0
	MOV		RCX, 0

	loop:
		MOV		RAX, 0
		MOV		AH, BYTE[RDI + RCX]
		MOV		AL, BYTE[RSI + RCX]
		CMP		AH, 0
		JE		end
		CMP		AL, 0
		JE		end
		CMP		AH, AL
		JNE		define_val
		INC		RCX
		JMP		loop

	define_val:
		CMP		AH, AL
		JL		neg
		MOV		RAX, 1
		JMP		end

	neg:
		MOV		RAX, -1
		JMP		end

	end:
		LEAVE
		RET

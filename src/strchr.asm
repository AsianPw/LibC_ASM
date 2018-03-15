GLOBAL	strchr:function

SECTION	.text

strchr:
	ENTER	0, 0

	loop:
		CMP		BYTE[RDI], 0
		JZ		not_found
		CMP		BYTE[RDI], SIL	; Compare current byte of RDI with SIL
		JZ		set_value
		INC		RDI
		JMP		loop

	not_found:
		MOV		RAX, 0
		JMP		end

	set_value:
		MOV		RAX, RDI
		JMP		end

	end:
		LEAVE
		RET
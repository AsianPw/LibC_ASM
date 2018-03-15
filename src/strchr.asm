GLOBAL	strchr:function

SECTION	.text

strchr:
	ENTER	0, 0
	PUSH	RDI

	loop_f:
		CMP		BYTE[RDI], 0
		JZ		not_found
		CMP		BYTE[RDI], sil
		JZ		set_value
		INC		RDI
		JMP		loop_f

	not_found:
		MOV		RAX, 0
		JMP		end

	set_value:
		MOV		RAX, RDI
		JMP		end

	end:
		POP		RDI
		LEAVE
		RET
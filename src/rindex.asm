GLOBAL	rindex:function

SECTION	.text

rindex:
	ENTER	0, 0
	MOV		RAX, 0

	loop:
		CMP	BYTE[RDI], 0		;CHECK END CHAR *
		JZ	end
		CMP	BYTE[RDI], SIL
		JZ	save
		INC	RDI
		JMP	loop

	save:
		MOV	RAX, RDI
		INC	RDI
		JMP	loop

	end:
		LEAVE
		RET

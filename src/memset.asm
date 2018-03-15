GLOBAL	memset:function

SECTION	.text

memset:
	ENTER	0, 0
	MOV		RCX, 0
	MOV		RAX, RDI

	loop:
		CMP		RDX, RCX		;While RCX < RDX
		JZ		end
		MOV		BYTE[RAX], SIL	; Init current char with int
		INC		RCX
		INC		RAX
		JMP		loop

	end:
		MOV		RAX, RDI
		LEAVE
		RET
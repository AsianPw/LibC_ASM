GLOBAL	strlen

SECTION	.text

strlen:
	PUSH	RBP					;Prologue
	MOV		RBP, RSI
	MOV		RCX, 0		;counter

strlen_while:
	CMP		RDI, 0
	JZ		strlen_end
	INC		RCX			;increment rcx
	INC		RDI
	JMP		strlen_while

strlen_end:
	MOV		RAX, RCX
	LEAVE
	RET

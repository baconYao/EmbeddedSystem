;NCHU_EMbeddedSystem_20160412
;4101056036_PeiYaoChang_HW1

		AREA 	PYChang_HW1,CODE,READONLY
		ENTRY
START	ADR 	r14,TEXT		;Load TEXT content to r14
		MOV 	r1,#8			;Start address
		MOV		r13,#14			;Next start address's base number
		MOV 	r12,#1			;The count of stars
		MOV 	r2,#8			;The NLine's loop count
		LDRB	r0,[r14]		;r0 = men[r14]
		STRB	r0,[r1],#1		;mem[r1] = r0, r1=r1+1 , Print the first star
NLine	ADD 	r1,r1,r13		;Next star start address
		SUB 	r13,r13,#2
		ADD 	r12,r12,#2		;The count of stars
		MOV 	r3,r12			;The count of stars
PRINT	CMP 	r3,#1
		LDRB	r0,[r14]		
		STRB	r0,[r1],#1		;Print the star
		SUB 	r3,r3,#1
		BNE 	PRINT
		SUB 	r2,r2,#1
		CMP 	r2,#1
		BNE 	NLine
TEXT	= "*", &ff   	
		END
		

		AREA 	Hw2,CODE,READONLY
		ENTRY
START	ADR 	r0,TEXT1		;Store TEXT1 address
		ADR		r1,TEXT2		;Store TEXT2 address			
		ADR		r2,TEXT3		;Store TEXT3 address
		MOV 	r3,#0X00		;Start address
		MOV		r4,#1			;Counter for Multiplier
		MOV		r11,#1			;Counter for Multiplicand
		MOV		r13,#0			;Counter for digit-in-tens

		MOV 	r9,r0           ;r9 store Multiplicand address
		MOV		r10,r0          ;r10 store Multiplier address

A 		LDRB	r5,[r9]			;r5 store Multiplicand x
		STRB	r5,[r3],#1	

		LDRB	r6,[r1]			;r6 store '*'
		STRB	r6,[r3],#1

		LDRB	r7,[r10]		;r7 store Multiplicand y
		STRB	r7,[r3],#1	

		LDRB	r8,[r2]			;r8 store '='
		STRB	r8,[r3],#1	

		ADD  	r10,r10,#1		;Multiplier address+1

		SUB		r5,r5,#48		;Change Multiplicand from symbol to number
		SUB		r7,r7,#48		;Change Multiplier from symbol to number

		MUL		r12,r5,r7		;r12 store multiplied result

RES		CMP		r12,#10			;Compare multiplied result and 10
		BLT		PRINT			;If less than 10 then branch to PRINT
		SUB		r12,r12,#10
		ADD		r13,r13,#1		;r13 store times of sub 10
		BGE		RES

PRINT	ADD 	r12,r12,#48		
		ADD 	r13,r13,#48
		STRB	r13,[r3],#1		;Store r13 as digit-in-tens
		STRB	r12,[r3],#1		;Store r13 as digit-in-ones
		MOV		r13,#0			;Initialize r13 to #0

		CMP		r4,#9           ;To see whether Multiplier equals 9 
		ADD		r3,r3,#10		;Change line
		ADD  	r4,r4,#1
		BNE 	A               

		MOV		r4,#1           ;Initialize r4 to #1
		CMP		r11,#9			;To see whether Multiplicand equals 9 
		ADD		r11,r11,#1
		MOV		r10,r0          ;Initialize Multiplier address r10 to address r0
		ADD 	r9,r9,#1
		BNE		A

TEXT1	= "123456789", &ff   	
TEXT2	= "*", &ff 
TEXT3	= "=", &ff
		END
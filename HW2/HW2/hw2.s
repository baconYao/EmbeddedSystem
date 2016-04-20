;NCHU_EMbeddedSystem_20160412
;4101056036_PeiYaoChang_HW2

        AREA    PYChang_HW2,CODE,READONLY
        ENTRY
START   
        ADR     r14,DigitsQuotient         ;Load DigitsQuotient start address to r14
        LDRB    r1,[r14]        ;Multiplicand control
        ADD     r1,r1,#1        ;Start from 1
        LDRB    r2,[r14]        ;Multiplier control
        ADD     r2,r2,#1        ;Start from 1
        LDRB    r9,[r14]        ;DigitsQuotient control

        ADR     r14,TenQuotient             ;Load TenQuotient start address to r14
        LDRB    r8,[r14]        ;TenQuotient control

        ADR     r13,TEXT        ;Load TEXT start address to r13
        LDRB    r0,[r13]        ;r0 = men[r13] , "*"

        ADR     r12,TEXT2       ;Load TEXT2 start address to r12
        LDRB    r11,[r12]       ;r11 = men[r12] , "="

        MOV     r10,#0          ;Start address
        MOV     r4,#1           ;arithmetic Multiplicand
        MOV     r5,#1           ;arithmetic Multiplier
        MOV     r6,#0           ;TenQuotient Accumulater
        MOV     r7,#0           ;DigitQuotient Pointer

Mlier
        ;print
        STRB    r1,[r10],#1     ;mem[r10] = r1, r10=r10+1 , Print the Multiplicand
        STRB    r0,[r10],#1     ;Print *
        STRB    r2,[r10],#1     ;Print Multiplier
        STRB    r11,[r10],#1    ;Print =
        MUL     r3,r4,r5        ;r3 = r4 * r5 , Quotient
        
Division
        CMP     r3,#10
        BGE     Ten
        BLT     Digit

Ten
        ADD     r6,r6,#1        ;Record the TenQuotient's value
        SUB     r3,r3,#10
        BAL     Division


Digit
        MOV     r7,r3           ;Represent the DigitsQuotient value form r3 to r7
        BAL     Conti

Conti   
        ;print Quotient
        ADD     r8,r8,r6           ;Assign TenQuotient pointer value to r8
        STRB    r8,[r10],#1     ;Print TenQuotient
        SUB     r8,r8,r6
        ADD     r9,r9,r7           ;Point relation DigitsQuotient value
        STRB    r9,[r10],#1     ;Print DigitsQuotient
        SUB     r9,r9,r7
        ADD     r10,r10,#10     ;Assign head

        MOV     r6,#0
        ADD     r2,r2,#1        ;next multiplier
        ADD     r5,r5,#1        ;next arithmetic multiplier
        CMP     r5,#10          ;compare arithmetic multiplier
        BEQ     Conti2
        BNE     Mlier

Conti2
        ADD     r1,r1,#1        ;next multiplicand
        ADD     r4,r4,#1        ;next arithmetic multiplicand
        SUB     r2,r2,#9           ;Assign DigitsQuotient start from "1"
        MOV     r5,#1           ;arithmetic multiplier = 1
        CMP     r4,#10
        BEQ     STOP
        BAL     Mlier

STOP

TEXT    = "*", &ff
TEXT2   = "=", &ff
DigitsQuotient = "0123456789"
TenQuotient = "0123456789"

        END
        

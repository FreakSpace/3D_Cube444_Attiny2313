;
; cube060217asm.asm
;
; Created: 06.02.2017 10:47:23
; Author : petre
;
.def PortStat = R18
.def val      = R20
.def ShiftVal = R21
.def loopInc  = R22
.def temp      = R25
.def Rval     = R24
.def Rval2     = R30

; Replace with your application code
start:
	ldi R17, 0xFF
	out DDRB, R17

	sbi PORTB, 2   ;ST_CP =1; 

	ldi PortStat,0x01

	ldi Rval, 0
	ldi Rval2, 0

	ldi temp, 5
	;rjmp rain
	Spin:
		ldi Rval, 0
		ldi Rval2, 1
		rcall REGWRITE
		ldi R27, 0xF0
		rcall delay
		ldi Rval, 0
		ldi Rval2, 3
		rcall REGWRITE
		ldi R27, 0xF0
		rcall delay
		ldi Rval, 0
		ldi Rval2, 7
		rcall REGWRITE
		ldi R27, 0xF0
		rcall delay
		ldi Rval, 0
		ldi Rval2, 15
		rcall REGWRITE
		ldi R27, 0xF0
		rcall delay

		ldi Rval, 0
		ldi Rval2, 143
		rcall REGWRITE
		ldi R27, 0xF0
		rcall delay
		ldi Rval2, 143
		ldi Rval,  8
		rcall REGWRITE
		ldi R27, 0xF0
		rcall delay
		ldi Rval2, 143
		ldi Rval,  136
		rcall REGWRITE
		ldi R27, 0xF0
		rcall delay
		ldi Rval2, 143
		ldi Rval,  200
		rcall REGWRITE
		ldi R27, 0xF0
		rcall delay

		ldi Rval2, 143
		ldi Rval,  232
		rcall REGWRITE
		ldi R27, 0xF0
		rcall delay
		ldi Rval2, 143
		ldi Rval,  248
		rcall REGWRITE
		ldi R27, 0xF0
		rcall delay
		ldi Rval2, 143
		ldi Rval,  249
		rcall REGWRITE
		ldi R27, 0xF0
		rcall delay
		ldi Rval,  249
		ldi Rval2, 159
		rcall REGWRITE
		ldi R27, 0xF0
		rcall delay

		ldi Rval,  249
		ldi Rval2, 191
		rcall REGWRITE
		ldi R27, 0xF0
		rcall delay
		ldi Rval,  249
		ldi Rval2, 255
		rcall REGWRITE
		ldi R27, 0xF0
		rcall delay
		ldi Rval2, 255
		ldi Rval,  253
		rcall REGWRITE
		ldi R27, 0xF0
		rcall delay
		ldi Rval2, 255
		ldi Rval, 255
		rcall REGWRITE
		ldi R27, 0xF0
		rcall delay

		;________________________________________________
		ldi Rval, 253
		ldi Rval2, 255
		rcall REGWRITE
		ldi R27, 0xF0
		rcall delay
		ldi Rval, 249
		ldi Rval2, 255
		rcall REGWRITE
		ldi R27, 0xF0
		rcall delay
		ldi Rval, 249
		ldi Rval2, 191
		rcall REGWRITE
		ldi R27, 0xF0
		rcall delay
		ldi Rval, 249
		ldi Rval2, 159
		rcall REGWRITE
		ldi R27, 0xF0
		rcall delay

		ldi Rval, 249
		ldi Rval2, 143
		rcall REGWRITE
		ldi R27, 0xF0
		rcall delay
		ldi Rval,  248
		ldi Rval2, 143
		rcall REGWRITE
		ldi R27, 0xF0
		rcall delay
		ldi Rval,  232
		ldi Rval2, 143
		rcall REGWRITE
		ldi R27, 0xF0
		rcall delay
		ldi Rval,  200
		ldi Rval2, 143
		rcall REGWRITE
		ldi R27, 0xF0
		rcall delay
		
		ldi Rval,  136
		ldi Rval2, 143
		rcall REGWRITE
		ldi R27, 0xF0
		rcall delay
		ldi Rval,  8
		ldi Rval2, 143
		rcall REGWRITE
		ldi R27, 0xF0
		rcall delay
		ldi Rval,  0
		ldi Rval2, 143
		rcall REGWRITE
		ldi R27, 0xF0
		rcall delay
		ldi Rval,  0
		ldi Rval2, 15
		rcall REGWRITE
		ldi R27, 0xF0
		rcall delay

		ldi Rval,  0
		ldi Rval2, 7
		rcall REGWRITE
		ldi R27, 0xF0
		rcall delay
		ldi Rval,  0
		ldi Rval2, 3
		rcall REGWRITE
		ldi R27, 0xF0
		rcall delay
		ldi Rval,  0
		ldi Rval2, 1
		rcall REGWRITE
		ldi R27, 0xF0
		rcall delay
		ldi Rval, 0
		ldi Rval2, 0
		rcall REGWRITE
		ldi R27, 0xF0
		rcall delay

		dec temp
		cpi r25, 0
		brne goto1

		rjmp nogoto1
		goto1: rjmp spin
		nogoto1:

	ldi temp, 5
	Rain:
		ldi Rval, 33
		ldi Rval2, 4
		rcall REGWRITE
		rcall RainLays
		ldi R27, 0xF0
		rcall delay

		ldi Rval, 20
		ldi Rval2, 32
		rcall REGWRITE
		rcall RainLays
		ldi R27, 0xF0
		rcall delay

		ldi Rval, 72
		ldi Rval2, 130
		rcall REGWRITE
		rcall RainLays
		ldi R27, 0xF0
		rcall delay

		ldi Rval, 34
		ldi Rval2, 17
		rcall REGWRITE
		rcall RainLays
		ldi R27, 0xF0
		rcall delay

		ldi Rval, 144
		ldi Rval2, 72
		rcall REGWRITE
		rcall RainLays
		ldi R27, 0xF0
		rcall delay

		ldi Rval, 4
		ldi Rval2, 5
		rcall REGWRITE
		rcall RainLays
		ldi R27, 0xF0
		rcall delay

		ldi Rval, 72
		ldi Rval2, 33
		rcall REGWRITE
		rcall RainLays
		ldi R27, 0xF0
		rcall delay

		ldi Rval, 36
		ldi Rval2, 138
		rcall REGWRITE
		rcall RainLays
		ldi R27, 0xF0
		rcall delay

		ldi Rval, 130
		ldi Rval2, 33
		rcall REGWRITE
		rcall RainLays
		ldi R27, 0xF0
		rcall delay

		ldi Rval, 40
		ldi Rval2, 66
		rcall REGWRITE
		rcall RainLays
		ldi R27, 0xF0
		rcall delay

		ldi Rval, 68
		ldi Rval2, 136
		rcall REGWRITE
		rcall RainLays
		ldi R27, 0xF0
		rcall delay

		ldi Rval, 137
		ldi Rval2, 16
		rcall REGWRITE
		rcall RainLays
		ldi R27, 0xF0
		rcall delay

		ldi Rval, 34
		ldi Rval2, 2
		rcall REGWRITE
		rcall RainLays
		ldi R27, 0xF0
		rcall delay

		ldi Rval, 68
		ldi Rval2, 33
		rcall REGWRITE
		rcall RainLays
		ldi R27, 0xF0
		rcall delay

		ldi Rval, 17
		ldi Rval2, 8
		rcall REGWRITE
		rcall RainLays
		ldi R27, 0xF0
		rcall delay

		ldi Rval, 130
		ldi Rval2, 20
		rcall REGWRITE
		rcall RainLays
		ldi R27, 0xF0
		rcall delay
		
		dec temp
		cpi temp, 0 ; 3
		brne goto2

		rjmp nogoto2
		goto2: rjmp rain
		nogoto2:

    rjmp start

RainLays:
	andi PortStat, 0b00000111
	ori  PortStat, 0b01000000
	out PORTB, PortStat
	ldi R27, 0xF0
	rcall delay
	ldi R27, 0x70
	rcall delay

	andi PortStat, 0b01100111
	ori  PortStat, 0b01100000
	out PORTB, PortStat
	ldi R27, 0xF0
	rcall delay
	ldi R27, 0x70
	rcall delay

	andi PortStat, 0b00100111
	ori  PortStat, 0b00110000
	out PORTB, PortStat
	ldi R27, 0xF0
	rcall delay
	ldi R27, 0x70
	rcall delay

	andi PortStat, 0b00010111
	ori  PortStat, 0b00011000
	out PORTB, PortStat
	ldi R27, 0xF0
	rcall delay
	ldi R27, 0x70
	rcall delay

	andi PortStat, 0b00001111
	ori  PortStat, 0b00001000
	out PORTB, PortStat
	ldi R27, 0xF0
	rcall delay
	ldi R27, 0x70
	rcall delay

	andi PortStat, 0b00000111
	out PORTB, PortStat
	ldi R27, 0xF0
	rcall delay
	ldi R27, 0x70
	rcall delay

	ret

RegWrite: ; value = (Rval - HIGH Byte) (Rval2 - LOW Byte)
	; SH_CP - PORTB.0 ; DS - PORTB.1 ; ST_CP - PORTB.2
	rcall _RegWrite
	mov Rval, Rval2
	rcall _RegWrite
	sbi PORTB, 2 ; ST_CP = 1
RET

_RegWrite: ; value = Rval 
	; SH_CP - PORTB.0 ; DS - PORTB.1 ; ST_CP - PORTB.2
	; int i; for(loopInc = 7; loopInc >= 0; loopInc--)	
	ldi loopInc, 0x07 ; loopInc = 8
	;cbi PORTB, 2 ; ST_CP = 0 
	RegWriteLoop:

		; PORTB|=(((val>>i)&0x01)<<pinDS)
		mov R19, Rval
		mov ShiftVal, loopinc
		rcall RSH ; val>>i
		ldi R17, 0x01
		and R19, R17 ; (val>>i)&0x01
		ldi ShiftVal, 0x01 
		rcall LSH ; (((val>>i)&0x01)<<pinDS)

		or PortStat, R19 ; PORTB|=(((val>>i)&0x01)<<pinDS)
		out PORTB, PortStat

		sbi PORTB, 0 ; SH_CP = 1
		
		ldi R17, 0b11111000
		and PortStat, R17
		
		out PORTB, PortStat
	        
		dec loopInc ; loopInc--
		cpi loopInc, 0 ; loopInc >= 0 ?
		brne RegWriteLoop ; if loopInc >= 0, do it again
		
		;do it for loopInc == 0------------------------------------------
		mov R19, Rval
		ldi R17, 0x01
		and R19, R17 ; (val>>i)&0x01
		ldi ShiftVal, 0x01 
		rcall LSH ; (((val>>i)&0x01)<<pinDS)

		or PortStat, R19 ; PORTB|=(((val>>i)&0x01)<<pinDS)
		out PORTB, PortStat

		sbi PORTB, 0 ; SH_CP = 1

		ldi R17, 0b11111000
		and PortStat, R17
		
		out PORTB, PortStat
		;-----------------------------------------------------------------
	;sbi PORTB, 2 ; ST_CP = 1
	RET

LSH : ; R19 << ShiftVal
	ShiftLoop:
		lsl R19 ; left shift r19
		dec ShiftVal 
		cpi ShiftVal, 0
		brne ShiftLoop ; if ShiftVal >= 0, do it again
	RET

RSH : ; R19 << ShiftVal
	ShiftLoop2:
		lsr R19 ; left shift r19
		dec ShiftVal 
		cpi ShiftVal, 0
		
		brne ShiftLoop2 ; if ShiftVal >= 0, do it again
	RET

delay: ; R27 - ms
	dec R27 ; 1
	ldi R16, 0x58; 2
	loopDelay:
	dec R16 ; 2
	nop ; 3
	cpi R16, 0 ; 4
	brne loopDelay ; 4 (5)
	cpi R27, 0 ; 3
	brne delay ; 4 (5)
	RET
     AREA     appcode, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION	
	
	  ; s12 contains tanx value 
					; s14 contains r*cosx value
					; s13 contains r*sinx value
					; s10 gives the x coordinate
					; s11 gives the y coordinate
					; Input is given in degrees. It is converted to radians then tanx is computed.
		LDR R8,=361;
		VLDR.F32 s9,=180
		LDR R12,=0;
		VLDR.F32 s17,=20 ;radius
		VLDR.F32 s18,=300 ;centre of the circle (300,300)
whileouter		VMOV s0,R12;
				VCVT.F32.U32 s0,s0
				LDR R0, =0x40490fdb ;--> PI
				VMOV s14,R0;
				VMUL.F32 s0,s0,s14
				VDIV.F32 s0,s0,s9 ; s0 contains x (Input) in radians
				;VLDR.F32 s0,=1; s0 --> Input number(x)
				VMOV.F32 s13,s0 ; sum1
				VLDR.F32 s14,=1 ; sum2
				
				MOV R11, #1;
				VLDR.F32 s2,=1 ; temp2
				VMOV.F32 s1,s0 ;  temp
				MOV R0, #1 ; n
				MOV R2, #2;
				VMUL.F32 s0,s0,s0 ; s0 --> x^2
whileloop		VMUL.F32 s1,s1,s0 ; s1 ---> temp :x^(2n+1)
				VMUL.F32 s2,s2,s0 ; s2 ---> temp2 :x^(2n)
				MUL  R3,R2,R0 ; R3 = 2n
				ADD R4,R3,#1; R4= 2n+1;
				BL factorial
				VMOV.F32 s4,s6 ; s4 --> (2n+1)!
				MOV R4,R3
				BL factorial
				; s6 contains (2n)!
				VDIV.F32 s7,s1,s4 ; q ---> temp/(2n+1)!
				VDIV.F32 s8,s2,s6 ; s ---> temp2/(2n)!
				BL evenodd
				VMOV.F32 s19,s13
				VMOV.F32 s20,s14
				VMUL.F32 s13,s13,s17
				VMUL.F32 s14,s14,s17
				VADD.F32 s10,s13,s18
				VADD.F32 s11,s14,s18
				
				ADD R0,R0,#1
				CMP R0,#20  ; R0 --> Number of iterations(R0-1)
				BLT whileloop
				ADD R12,R12,#360 ; R12 ---> Increment value of x in degrees.
				
				CMP R12,R8
				BLT whileouter
				B stop
				
				
evenodd			MOV R9, #2  ; To divide the given number by 2
				UDIV R10, R0, R9 ; Number/2 -- To find quotient
				MLS R10, R10, R9,R0 ; To find remainder when the number is divided by 2
				CMP R10, #0 ; Compare the remainder with Zero
				ITTEE EQ ; Check the condition if R3 = 0 
				VADDEQ.F32 s13,s13,s7 ; sinx --> s13
				VADDEQ.F32 s14,s14,s8 ; cosx --> s14
				VSUBNE.F32 s13,s13,s7
				VSUBNE.F32 s14,s14,s8
				BX LR
				
				
factorial		VLDR.F32 s6,=1;
xloop			CMP R4,#0
				VMOV  s3,R4;
				VCVT.F32.U32 s3,s3
				VMULHI.F32 s6,s3,s6
				SUBHI R4,R4,#1
				BHI xloop
				BX LR
		
		
				
				
stop    B stop ; stop program
     ENDFUNC
     END 
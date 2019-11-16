     AREA     factorial, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION	
	
	  ; exp(x) is stored in s7
				MOV R1, #1 
whileouter		VMOV s0,R1 ; incrementing value of x
				VCVT.F32.U32 s0,s0
				VLDR.F32 s1, =1 ;num
				MOV  R4, #1 ; n 
				VLDR.F32 s7, =1;sum
whileinner		VMUL.F32 s1,s1,s0 ; number of terms(iterations)
			    ; factorial
				MOV R3,R4
				VLDR.F32 s6,=1;
loop			CMP R3,#0
				VMOV  s3,R3;
				VCVT.F32.U32 s3,s3
				VMULHI.F32 s6,s3,s6
				SUBHI R3,R3,#1
				BHI loop
				;factorial
				VDIV.F32 s5,s1,s6;	x^n/(n!)
				VADD.F32 s7,s7,s5;  Adding with previous summation value
				ADD R4,R4,#1;
				CMP R4,#27; Number of iterations
				BLT whileinner
				ADD R1,R1,#1
				CMP R1,#51;  
				BLT whileouter
				
				
stop    B stop ; stop program
     ENDFUNC
     END 
     AREA     factorial, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION	
; IGNORE THIS PART 	
	    MOV R1, #3 ; input
		MOV R2, #2  ; divide number by 2
		UDIV R3, R1, R2 ; find quotient
		MLS R3, R3, R2,R1 ;  find remainder 
		CMP R3, #0 ; Compare remainder with Zero
		ITE EQ ; Check the condition if R3 = 0 
		MOVEQ R1, #0xE ; remainder is zero ---> Number is even
	
		MOVNE R1, #0 ; remainder is not  zero --> Number is odd.
stop    B stop ; stop program
     ENDFUNC
     END 
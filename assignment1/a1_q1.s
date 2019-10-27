     AREA     factorial, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION	
; IGNORE THIS PART 	
	    MOV R1, #0  ; first num : 0
		LDR R2, =0x00000001   ; first num : 1
loop	ADD R4,R1,R2 ;  Fibinocci Series is updated in R3 in every iteration.
		MOV R1, R2  
		MOV R2, R4
		CMP R4, #50 ; Check for final number < 50
		BLS loop
stop    B stop ; stop program
     ENDFUNC
     END 
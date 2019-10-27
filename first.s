     AREA     factorial, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION	
; IGNORE THIS PART 	
	    MOV R1, #0  ; First num : 0
		LDR R2, =0x00000001   ; First num : 1
loop	ADD R4,R1,R2 ; Add ; Fibinocci Series is updated in R4 in every iteration.
		MOV R1, R2  
		MOV R2, R4
		CMP R4, #40 ; Check for the final number < 40 (Optional Loop condition)
		BLS loop
stop    B stop ; stop program
     ENDFUNC
     END 
     AREA     factorial, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION	
; IGNORE THIS PART 	
	    MOV R1, #12 ; first no
		MOV R2, #18; second no
loop	CMP R1,R2 ; Compares a,b
		BEQ stop ; If a = b , stop 
        ITE HI ; Checks if a > b
		SUBHI R1,R1,R2 ; If a > b Compute a = a - b 
		SUBLS R2,R2,R1 ; If a < b Compute b = b - a 
		B loop
stop    B stop ; stop program
     ENDFUNC
     END 
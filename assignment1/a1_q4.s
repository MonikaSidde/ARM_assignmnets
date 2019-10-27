     AREA     factorial, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION	
; IGNORE THIS PART 	
	    MOV R2, #3
		MOV R1, #10
		CMP R2,R1
		ITT HI
		MOVHI R2,#3
		IT HI
		MOVGE R5, #1
		
stop    B stop ; stop program
     ENDFUNC
     END 
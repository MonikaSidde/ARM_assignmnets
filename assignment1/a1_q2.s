     AREA     factorial, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION	
; IGNORE THIS PART 	
	    MOV r0 , #20   ;first number
	          MOV r1 , #36    ;second number
              MOV r2 , #10 	  ;third number  			  
              CMP r0 , r1
              IT HI
              MOVHI r1 , r0 
			  CMP r1 , r2
			  IT HI 
			  MOVHI r2 , r1
			  MOV r3 , r2 ;The greatest number is updated to R3
stop    B stop ; stop program
     ENDFUNC
     END 
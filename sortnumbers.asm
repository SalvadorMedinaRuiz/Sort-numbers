;Salvador Medina-Ruiz
;FINAL HW sort numbers
;
;COSC 221
			.ORIG		x3000
	
			LEA		R0, BEGPROMPT				;prints our beginning prompt
			PUTS

			JSR		GETDATA					;goes to get a number from the user
			ST		R1, FIRST				;stores the two digit number in FIRST
			AND		R5, R5, 0
			JSR		GETDATA
			ST		R1, SECOND
			AND		R5, R5, 0
			JSR		GETDATA
			ST		R1, THIRD
			AND		R5, R5, 0
			JSR		GETDATA
			ST		R1, FOURTH
			AND		R5, R5, 0
			JSR		GETDATA
			ST		R1, FIFTH
			AND		R5, R5, 0
			JSR		GETDATA
			ST		R1, SIX
			AND		R5, R5, 0
			JSR		GETDATA
			ST		R1, SEVENTH
			AND		R5, R5, 0
			JSR		GETDATA
			ST		R1, EIGTH
			AND		R5, R5, 0
			JSR		GETDATA
			ST		R1, NINETH
			AND		R5, R5, 0
			JSR		GETDATA
			ST		R1, TENTH

			LEA 		R0, PROMPT2				;loads the second prompt
			PUTS
			
			AND		R1, R1, 0				;starts to print the numbers back again
			LD		R1, FIRST
			JSR		PRINTNUMS
			AND		R1, R1, 0
			LD		R1, SECOND
			JSR		PRINTNUMS
			AND		R1, R1, 0
			LD		R1, THIRD
			JSR		PRINTNUMS
			AND		R1, R1, 0
			LD		R1, FOURTH
			JSR		PRINTNUMS
			AND		R1, R1, 0
			LD		R1, FIFTH
			JSR		PRINTNUMS
			AND		R1, R1, 0
			LD		R1, SIX
			JSR		PRINTNUMS
			AND		R1, R1, 0
			LD		R1, SEVENTH
			JSR		PRINTNUMS
			AND		R1, R1, 0
			LD		R1, EIGTH
			JSR		PRINTNUMS
			AND		R1, R1, 0
			LD		R1, NINETH
			JSR		PRINTNUMS
			AND		R1, R1, 0
			LD		R1, TENTH
			JSR		PRINTNUMS		
			
			LEA		R0, PROMPT3				;loads our third prompt
			PUTS

			JSR		SORTNUMS				;actually sorts the numbers
										
			AND		R1, R1, 0				;starts to print the numbers back again
			LD		R1, FIRST
			JSR		PRINTNUMS
			AND		R1, R1, 0
			LD		R1, SECOND
			JSR		PRINTNUMS
			AND		R1, R1, 0
			LD		R1, THIRD
			JSR		PRINTNUMS
			AND		R1, R1, 0
			LD		R1, FOURTH
			JSR		PRINTNUMS
			AND		R1, R1, 0
			LD		R1, FIFTH
			JSR		PRINTNUMS
			AND		R1, R1, 0
			LD		R1, SIX
			JSR		PRINTNUMS
			AND		R1, R1, 0
			LD		R1, SEVENTH
			JSR		PRINTNUMS
			AND		R1, R1, 0
			LD		R1, EIGTH
			JSR		PRINTNUMS
			AND		R1, R1, 0
			LD		R1, NINETH
			JSR		PRINTNUMS
			AND		R1, R1, 0
			LD		R1, TENTH
			JSR		PRINTNUMS

			HALT

FIRST			.BLKW		1
SECOND			.BLKW		1
THIRD			.BLKW		1
FOURTH			.BLKW		1
FIFTH			.BLKW		1
SIX			.BLKW		1
SEVENTH			.BLKW		1
EIGTH			.BLKW		1
NINETH			.BLKW		1
TENTH			.BLKW		1
CHARACTER		.STRINGZ	" "

;;;;;;;;;;;;;;;;;;SELECTION SORT;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SORTNUMS		ST		R7, SAVER7
			AND     	R2, R2, 0   				;Initialize ALL Registers (except R7)
			AND		R3, R3, 0
			AND		R0, R0, 0
			AND		R4, R4, 0
			AND		R5, R5, 0
			AND		R6, R6, 0				;R6 is never used but just in case i messed it up lol
            		LD      	R3, NUMBERLOC    			;Puts the first number location in R3
COUNT       		LDR     	R0, R3, 0   				;Then puts it into R0
            		BRZ     	ENDTHECOUNT   				;If not 0, loop until number item is 0
            		ADD     	R3, R3, 1   				;add one to current number location (number loc)
           		ADD     	R2, R2, 1   				;add one to counter
            		BRNZP   	COUNT       				
ENDTHECOUNT   		ADD     	R4, R2, 0   				;Store numbers in R4
            		BRZ     	SORTED      				;No more numbers!

OUTERLOOP   		ADD     	R4, R4, -1  				
            		BRNZ    	SORTED      				
            		ADD     	R5, R4, 0   				;Initialize inner loop counter to outer
            		LD      	R3, NUMBERLOC     			;Set number loc to beginning of file
INNERLOOP   		LDR     	R0, R3, 0   				;Get current number at number loc
            		LDR     	R1, R3, 1   				;Get next number
            		NOT     	R2, R1      				;Get the negative of the number
            		ADD     	R2, R2, 1   				
            		ADD     	R2, R0, R2  				;swap equals the number minus the next number
            		BRNZ    	SWAPPED     				;Don't swap if in order (negative or zero)
          		STR     	R1, R3, 0   				;Perform the swap for the numbers
          		STR     	R0, R3, 1  				
SWAPPED    		ADD     	R3, R3, 1   				;Add one to number loc
           		ADD     	R5, R5, -1  				;Subtract one to inner loop counter
            		BRP     	INNERLOOP   				
            		BRNZP   	OUTERLOOP   				

SORTED			LD		R7, SAVER7
			RET
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
NUMBERLOC        	.FILL  		x3061       				;Beginning of our 10 BLKW numbers. DO NOT CHANGE CODE OR VALUE
;;;;;;;;;;;;;;;;;;PRINTING THE NUMBERS AFTERWARDS SUBROUTINE;;;;;;;;;;;;;;;;;;;;;;;		
PRINTNUMS		ST		R7, SAVER7
			AND		R6, R6, 0
			AND		R0, R0, 0
			AND		R3, R3, 0
			LD		R6, FORTY8
			
LOOP			ADD		R3, R3, 1			;adds 1 to our counter
			ADD		R1, R1, -10
			BRzp		LOOP
			ADD		R1, R1, 10
			ADD		R3, R3, -1
			
			ADD		R0, R3, R6			;first digit
			ST		R0, CHARACTER
			LEA		R0, CHARACTER
			PUTS
			ADD		R0, R1, R6			;second digit
			ST		R0, CHARACTER
			LEA		R0, CHARACTER
			PUTS
			LEA		R0, SPACE
			PUTS
			LD		R7, SAVER7
			RET
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	

;;sub rotuine for asking for a two digit number;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GETDATA			ST		R7, SAVER7
			ST		R6, SAVER6
			ST		R5, SAVER5
			ST		R2, SAVER2

			AND		R1, R1, 0
			AND		R2, R2, 0
			LEA		R0, PROMPT
			LD		R6, THIRTY
			PUTS
			GETC							;we are getting our first character
			OUT

			ADD		R1, R0, 0				;R0 has the first character, so we put it into R1
			ADD		R1, R1, R6				;subtracts 48 to R1 to turn it into a number
			LD		R5, TEN					;loads ten into R5
			JSR		MULTIPLICATION
		
			GETC							;now we are getting the second character
			OUT
			ADD		R0, R0, R6				;subtracts 48 to turn it into a number
			ADD		R1, R0, R1				;R1 = 40 + 5 = 45

			LD		R0, CR
			OUT
			LD		R0, LF
			OUT

			LD		R2, SAVER2
			LD		R5, SAVER5
			LD		R6, SAVER6
			LD		R7, SAVER7
			RET	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Multiplication sub routine;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
MULTIPLICATION		ST		R7, MULTSAVER7
			ST		R5, MULTSAVER5
			ST		R3, MULTSAVER3
			AND		R3, R3, 0
AGAIN			ADD		R3, R3, R1
			ADD		R5, R5, -1	
			BRp		AGAIN
			AND		R1, R1, 0				;the number we started with R1
			ADD		R1, R3, 0
			LD		R3, MULTSAVER3
			LD		R5, MULTSAVER5
			LD		R7, MULTSAVER7
			RET
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SAVER7			.BLKW		1					;TO store where we were from R7 in SAVER7
SAVER6			.BLKW		1					;Same for the rest
SAVER5			.BLKW		1					;
SAVER2			.BLKW		1					;
MULTSAVER7		.BLKW		1
MULTSAVER5		.BLKW		1
MULTSAVER3		.BLKW		1
BEGPROMPT		.STRINGZ	"Get ready to enter 10, 2 digit numbers: "
PROMPT			.STRINGZ	""
PROMPT2			.STRINGZ	"The numbers before the sort are: "
PROMPT3			.STRINGZ	"\nThe sorted numbers are: "
CR			.FILL		13
LF			.FILL		10
TEN			.FILL		10					;TO make our one character (number) a 2 digit one 4 = 4+10 = 40
THIRTY			.FILL		xFFD0					;covert character to digit. 48 is 30 in hex, so FFD0 is -30 in hex
FORTY8			.FILL		48
SPACE			.STRINGZ	" "			
		.END
; Blinks LED connected to P1.4 with a period of approximately 1s

ORG 0000H
        SJMP BLINKY

DELAY:	MOV R0, #08H
DELAY2: MOV R1, #0FFH
DELAY3:	MOV R2, #0FFH
AGAIN:	DJNZ R2, AGAIN
        DJNZ R1, DELAY3
     	  DJNZ R0, DELAY2
        RET

BLINKY:	ACALL DELAY
        CPL P1.4
		    SJMP BLINKY		

END

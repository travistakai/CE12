
#include <WProgram.h>

/* define all global symbols here */
.global MyFunc
.global milliseconds

.text
.set noreorder


/*********************************************************************
 * Setup MyFunc
 ********************************************************************/
.ent MyFunc
MyFunc:

.end MyFunc


/*********************************************************************
 * This is your ISR implementation. It is called from the vector table jump.
 ********************************************************************/
Lab8_ISR:


	
/*********************************************************************
 * This is the actual interrupt handler that gets installed
 * in the interrupt vector table. It jumps to the Lab5
 * interrupt handler function.
 ********************************************************************/
.section .vector_4, code
	j Lab8_ISR
	nop


.data
milliseconds: .word 0

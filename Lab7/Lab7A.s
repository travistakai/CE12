#include <WProgram.h>

#Travis Takai
#1375886
#CE12L-03
#Lab 7

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

    li $t0, 0x0
    lw $t2, PORTD
    lw $t3, PORTD
    la $t4, PORTE
    lw $t5, PORTF
    li $t7, 0x000F
    li $t8, 0x00E0
    li $t9, 0x0010

    #Switches' values coming from PORTD
    srl $t6, $t2, 8
    and $t6, $t6, $t7
    or $t0, $t0, $t6
    
    #Buttons 0-2's values coming from PORTD
    and $t6, $t3, $t8
    or $t0, $t0, $t6
    
    #Button 4's value coming from PORTF
    sll $t6, $t5, 3
    and $t6, $t6, $t9
    or $t0, $t0, $t6

    
    sw $t0, 0($t4)
    
    nop
    b MyFunc

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
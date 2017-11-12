/////////////////////////////////////////////////////////////////// 
//Student ID No.: 815006821
//Date: 10/24/2017
///////////////////////////////////////////////////////////////////
#include "includes.h" 
#include "xlcd.h"
#include <timers.h> 
#include <delays.h>
#include <stdlib.h>
#include <string.h>
#include <p18f452.h>


/* Write the appropriate code to set configuration bits: * - set HS oscillator * - disable watchdog timer * - disable low voltage programming */
#pragma config OSC = HS
#pragma config WDT = OFF //Disable watchdog timer
#pragma config LVP = OFF //Disable low voltage programming

#define _XTAL_FREQ 4000000UL

/* Write LCD delay functions */
void DelayFor18TCY(void) {
    /* Create a delay of 18 cycles */
     Delay10TCYx(0x6); //delays 20 cycles
}

void DelayPORXLCD(void) {
    /* Create a delay of 15 ms */
     Delay100TCYx(0xF0);   // 100TCY * 160
}

void DelayXLCD(void) {
    /* Create a delay of 5 ms */
     Delay100TCYx(0xF6);      // 100TCY * 54
}


/* Write the appropriate code to do the following: * define the stack sizes for task1 and task2 in app_cfg.h file * use the defines to assign stack sizes here. */
OS_STK TaskAStk[200L];
OS_STK TaskBStk[200L];


/* Write the appropriate code to do the following: 
 * Configure PORTB pin 1 as an output 
 * TaskA will loop until the global variable stopped is set. 
 * Within the loop -- print string "Task 1 rocks! \n" to LCD top row
 *  * -- toggle PORTB pin 1 * -- delay for 1 second using OSTimeDlyHMSM( ) 
 * TaskA will delete itself if the loop is exited. */ 
static void TaskA(void *pdata) {
   
    TRISBbits.TRISB1 = 0;
        
    for(;;){
      
      while( BusyXLCD() );
      SetDDRamAddr( 0x00 );
      putrsXLCD(" Task 1 rocks!");
      PORTBbits.RB1 = !PORTBbits.RB1;
      OSTimeDlyHMSM (0,0,1,0);       /* Delay task for 1 second */
                                        
    }
    OSTaskDel(OS_PRIO_SELF);        //TaskA will delete itself if the loop is exited.
}

                                                                                                                                                                                                                                                                                                                                                 
/* Write the appropriate code to do the following: 
 * Configuee PORTB pin 2 as an output 
 * TaskB will loop until the global variable stopped is set. 
 * Within the loop -- print string "Task 2 rules?\n" to LCD bottom row 
 * -- toggle PORTB pin 2 * -- delay of 200 ticks using OSTimeDly( ) 
 * TaskB will delete itself if the loop is exited. */ 
static void TaskB(void *pdata) {
    
    TRISBbits.TRISB2 = 0;
    
    for(;;){
      while( BusyXLCD() );
      SetDDRamAddr( 0x40 );
      putrsXLCD(" Task 2 rules!");
      PORTBbits.RB2 = !PORTBbits.RB2;
      OSTimeDly(200);     /* Delay task for 1 second */
                          //TaskB will delete itself if the loop is exited.
    }
    OSTaskDel(OS_PRIO_SELF);
}

void main(void) { 
    // Write the appropriate code to disable all interrupts 
    INTCONbits.GIE = 0;
    // Write the appropriate code to initialise uC/OS II kernel
    OSInit();
    /* Write the appropriate code to enable timer0 , 
     * using 16 bit mode on internal clk source and pre-scalar of 1. */
	 OpenTimer0( TIMER_INT_ON & T0_16BIT & T0_SOURCE_INT & T0_EDGE_RISE & T0_PS_1_1 ); /* Write the appropriate code to enable timer0 , 

    /* Write the appropriate code to set timer0 registers 
     * such that timer0 expires at 10ms using 4 Mhz oscillator. 
     * Do the same in vectors.c in CPUlowInterruptHook( ). */
	 WriteTimer0(0xEC78);   
    /* Write the appropriate code to define the priorities for taskA 
     * and taskB in app_cfg.h. Use these defines to assign priorities 
     * when creating taskA and taskB with OSTaskCreate( ) */
    
    
    OSTaskCreate(TaskA,
            (void *)0,&TaskAStk[0],
            0);
    
     OSTaskCreate(TaskB,
            (void *)0,&TaskBStk[0],
            1);
    
    // Initialise the LCD display 
    OpenXLCD( FOUR_BIT & LINES_5X7 );
    while( BusyXLCD() );
    WriteCmdXLCD( FOUR_BIT & LINES_5X7 );
    while( BusyXLCD() );
    WriteCmdXLCD( BLINK_ON );
    while( BusyXLCD() );
    WriteCmdXLCD( SHIFT_DISP_LEFT );
    
    // Write the appropriate code to start uC/OS II kernel
    OSStart();
}
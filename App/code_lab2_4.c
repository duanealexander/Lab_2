///////////////////////////////////////////////////////////////////
//Student ID No.:815006821
//Date: 28/10/2017
///////////////////////////////////////////////////////////////////
#include    "includes.h"
#include    <timers.h>
#include    <xlcd_grpd.h>
#include    <delays.h>
#include    <string.h>
#include    <stdlib.h>

INT8U err;
OS_EVENT *DispSem;
OS_EVENT *Tmr1Sem;
OS_EVENT *FDirSem;
OS_EVENT *BDirSem;



/* Write the appropriate code to set configuration bits:
* - set HS oscillator
* - disable watchdog timer
* - disable low voltage programming
*/
/* Set configuration bits for use with PICKIT3 */
#pragma config OSC = HS
#pragma config WDT = OFF
#pragma config LVP = OFF

void appISR(void){
    
    if(PIR1bits.TMR1IF)
	{
		PIR1bits.TMR1IF = 0;
        WriteTimer1( 0x1 );
		OSSemPost(Tmr1Sem);
        OSSemPost(DispSem);
	}
}

/* Write LCD delay functions */
// functions required for XLCD
// min of 18 Tcy
void DelayFor18TCY(void)
{
    Delay10TCYx(0x6); //delays 20 cycles
}

// min of 15ms
void DelayPORXLCD(void)
{
    Delay100TCYx(0xF0); // 100TCY * 160
}

// min of 5ms
void DelayXLCD(void)
{
    Delay100TCYx(0xF6); // 100TCY * 54
}

/* Write the appropriate code to do the following:
* define the stack sizes for task1 and task2 in app_cfg.h file
* use the defines to assign stack sizes here.
*/
OS_STK TaskAStk[APP_TaskAStk_STK_SIZE];
OS_STK TaskBStk[APP_TaskBStk_STK_SIZE];

/* Write the appropriate code to do the following:
* Configure PORTB pin 1 as an output
* TaskA will loop until the global variable stopped is set.
* Within the loop -- print string "Task 1 rocks! \n" to LCD top row
* -- toggle PORTB pin 1
* -- delay for 1 second using OSTimeDlyHMSM( )
* TaskA will delete itself if the loop is exited.
*/
void TaskA(void *pdata)
{
    TRISBbits.TRISB1 = 0;  //Configure PORTB pin 1 as an output
    // task loop - TaskA will loop until the global variable stopped is set.
    for (;;)
    {
        OSSemPend(DispSem, 0, &err);
        while(BusyXLCD());              // Wait if LCD busy
        SetDDRamAddr(0x0);                // Set Display data ram address to 0
        putrsXLCD(" Task 1 rocks!");
        PORTBbits.RB1 = !PORTBbits.RB1;
        OSSemPend(FDirSem, 0, &err);//waits on the FDirSem semaphore to be release
        OSSemPost(BDirSem);//release BDirSem directly afterward
        //OSTimeDlyHMSM ( 0, 0, 1, 0); //-- delay for 1 second using OSTimeDlyHMSM( )
        WriteCmdXLCD(0b00000001);
        OSSemPost(DispSem);
    }
    
    OSTaskDel(OS_PRIO_SELF); // TaskA will delete itself if the loop is exited.
    

}

/* Write the appropriate code to do the following:
* Configure PORTB pin 2 as an output
* TaskB will loop until the global variable stopped is set.
* Within the loop -- print string "Task 2 rules?\n" to LCD bottom row
* -- toggle PORTB pin 2
* -- delay of 200 ticks using OSTimeDly( )
* TaskB will delete itself if the loop is exited.
*/
void TaskB(void *pdata)
{

    TRISBbits.TRISB2 = 0;//Configure PORTB pin 2 as an output
    // task loop - TaskB will loop until the global variable stopped is set.
    for (;;)
    {
        OSSemPend(DispSem, 0, &err);
        while(BusyXLCD());              // Wait if LCD busy
        SetDDRamAddr(0x11);                // Set Display data ram address to 0
        putrsXLCD(" Task 2 rules!");
        PORTBbits.RB2 = !PORTBbits.RB2;//-- toggle PORTB pin 2
        OSSemPend(BDirSem, 0, &err);
        OSSemPend(Tmr1Sem, 0, &err);//TIMER1 sem
        OSSemPost(FDirSem);//FDirSem is released as soon as the Timer1 Semaphore has been acquired
        //OSTimeDly(200); //-- delay of 200 ticks using OSTimeDly( )
        //WriteCmdXLCD(0b00000001);
        OSSemPost(DispSem);


    }
    OSTaskDel(OS_PRIO_SELF); // TaskB will delete itself if the loop is exited.
    
}



void main (void)
{
    
    //PORTBbits.RB2 = 0;
    //PORTBbits.RB1 = 0;
    
    // Write the appropriate code to disable all interrupts
    INTCONbits.GIEH = 0;
    // Write the appropriate code to initialise uC/OS II kernel
    OSInit();
    /* Write the appropriate code to enable timer0,
    * using 16 bit mode on internal clk source and pre-scalar of 1.
    */
    OpenTimer0(TIMER_INT_ON & T0_16BIT & T0_SOURCE_INT & T0_PS_1_1);
    /* Write the appropriate code to set timer0 registers
    * such that timer0 expires at 10ms using 4 Mhz oscillator.
    * Do the same in vectors.c in CPUlowInterruptHook( ).
    */
    WriteTimer0(4377);
    
    OpenTimer1(TIMER_INT_ON & T1_16BIT_RW & T1_SOURCE_INT & T1_PS_1_8 & T1_OSC1EN_OFF & T1_SYNC_EXT_OFF);
    WriteTimer1(0x3CB0);
    /* Write the appropriate code to define the priorities for taskA
    * and taskB in app_cfg.h. Use these defines to assign priorities
    * when creating taskA and taskB with OSTaskCreate( )
    */
    //OSTaskCreate(LCDTask, (void *)0, &LCDTaskStk[0], 1);
    OSTaskCreate(TaskA, (void *)0, &TaskAStk[0], APP_TaskAStk_PRIO); //Creating TaskA Task
    OSTaskCreate(TaskB, (void *)0, &TaskBStk[0], APP_TaskBStk_PRIO); //Creating TaskB Task
    
    DispSem = OSSemCreate(1);
    Tmr1Sem = OSSemCreate(0);//Counting Sem
    FDirSem = OSSemCreate(1);
    BDirSem = OSSemCreate(1);
    
    // Initialize the LCD display
    OpenXLCD(FOUR_BIT & LINES_5X7);
    while (BusyXLCD());
    WriteCmdXLCD(FOUR_BIT & LINES_5X7);
    while (BusyXLCD());
    WriteCmdXLCD(BLINK_ON);
    while (BusyXLCD());
    WriteCmdXLCD(SHIFT_DISP_LEFT);
    // Write the appropriate code to start uC/OS II kernel
    OSStart();
}
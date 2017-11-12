///////////////////////////////////////////////////////////////////
// Student ID No .: 815006821
// Date : 7/11/17
///////////////////////////////////////////////////////////////////
# include <p18f452.h>
# include "includes.h"
# include <timers.h>
# include "xlcd.h"
# include <stdlib.h>
# include <string.h>
# include "delays.h"



/* Write the appropriate code to do the following :
* define the stack sizes for task1 and task2 in app_cfg .h file
* use the defines to assign stack sizes here .
*/

OS_STK TaskAStk [APP_TaskAStk_STK_SIZE];
OS_STK TaskBStk [APP_TaskBStk_STK_SIZE];

/* Write the appropriate code to set configuration bits :
* - set HS oscillator
* - disable watchdog timer
* - disable low voltage programming
*/

#pragma config OSC = HS
#pragma config WDT = OFF
#pragma config LVP = OFF

#define _XTAL_FREQ 4000000UL

INT32U tStampData; //used to get the system time
INT8U QueueNumber; //used to get the number of unread queue messages 
static char QueueMessage,timeStamp[10];
OS_Q_DATA   *QueueData;


OS_EVENT *Tmr1Sem,  *DispSem, *FDirSem, *BDirSem, *msgQueue;

void *MessageStorage[MAX_NBR_MSGS];


void appISR(void){
    if(PIR1bits.TMR1IF==1){
        PIR1bits.TMR1IF = 0;
        WriteTimer1(0x3BE0);
        tStampData = OSTimeGet();
        itoa(tStampData, timeStamp);
        OSQPost(msgQueue, timeStamp);
        OSSemPost(Tmr1Sem);
        OSSemPost(DispSem);
           
    }
      
}

/* Write LCD delay functions */
void DelayFor18TCY(void){
    Nop(); Nop(); Nop(); Nop(); Nop(); Nop();
    Nop(); Nop(); Nop(); Nop(); Nop(); Nop();
    Nop(); Nop(); Nop(); Nop(); Nop();
    Nop();
}

void DelayPORXLCD(void){  //Delay 15ms
    Delay1KTCYx(0x96);
}

void DelayXLCD(void){   //Delay 5ms
    Delay1KTCYx(0x05);
}


/* Write the appropriate code to do the following :
* Configure PORTB pin 1 as an output
* TaskA will loop until the global variable stopped is set .
* Within the loop -- print string " Task 1 rocks ! \ n" to LCD top row
* -- toggle PORTB pin 1
* -- delay for 1 second using OSTimeDlyHMSM ( )
* TaskA will delete itself if the loop is exited .
*/
void TaskA ( void * pdata )
{
   
    TRISBbits.RB1 = 0;
        
    for(;;){
      OSSemPend(DispSem,0,0);
      //while( BusyXLCD() );
      //SetDDRamAddr( 0x00 );
      //putrsXLCD(timestamp);
      PORTBbits.RB1 = !PORTBbits.RB1;
      //OSTimeDlyHMSM (0,0,1,0);       /* Delay task for 1 second */
      OSSemPend(FDirSem,0,0);
      
      WriteCmdXLCD(0b00000001); 
      OSSemPost(DispSem);
      OSSemPost(BDirSem);                                
      
    }
    
    OSTaskDel(OS_PRIO_SELF);        //TaskA will delete itself if the loop is exited.
    
}

/* Write the appropriate code to do the following :
* Configure PORTB pin 2 as an output
* TaskB will loop until the global variable stopped is set .
* Within the loop -- print string " Task 2 rules ?\ n" to LCD bottom row
* -- toggle PORTB pin 2
* -- delay of 200 ticks using OSTimeDly ( )
* TaskB will delete itself if the loop is exited .
*/
void TaskB ( void * pdata )
{
    int     i_data;
    //PORTB = 0x00;
    TRISBbits.TRISB2 = 0;
     
    i_data = *((int *)pdata);
    for(;;){
      OSSemPend(BDirSem,0,0);
      OSSemPend(DispSem,0,0);   
      while( BusyXLCD() );
      SetDDRamAddr( 0x00 );
      putsXLCD(timeStamp);
      
      OSQQuery(msgQueue,QueueData);
      QueueNumber = QueueData->OSNMsgs;
      itoa(QueueNumber, QueueMessage);
      SetDDRamAddr(0x40);
      putsXLCD(QueueMessage);
      OSQFlush(msgQueue);
      
      PORTBbits.RB2 = !PORTBbits.RB2;
      //OSTimeDly(200);     /* Delay task for 1 second */
      
      
      OSSemPend(Tmr1Sem,0,0);
      OSSemPost(FDirSem);
      WriteCmdXLCD(0b00000001); //clear screen
      OSSemPost(DispSem);
    }
    
    OSTaskDel(OS_PRIO_SELF); //TaskB will delete itself if the loop is exited.

     
}

void main ( void )
{
    INTCONbits.GIE = 0; // Write the appropriate code to disable all interrupts
    PIR1bits.TMR1IF = 0;
    OSInit();       // Write the appropriate code to initialise uC / OS II kernel
    
    OpenTimer0( TIMER_INT_ON & T0_16BIT & T0_SOURCE_INT & T0_EDGE_RISE & T0_PS_1_1 ); /* Write the appropriate code to enable timer0 , 
                                                                                       using 16 bit mode on internal clk source and pre - scalar of 1. */ 
    WriteTimer0(4377);
    OpenTimer1(TIMER_INT_ON & T1_16BIT_RW & T1_SOURCE_INT & T1_PS_1_4 & T1_OSC1EN_ON & T1_SYNC_EXT_OFF); 
    WriteTimer1(0x3BE0);
                                                                 
    // Write the appropriate code to set timer0 registers such that timer0 expires at 10 ms using 4 Mhz oscillator .   Do the same in vectors .c in CPUlowInterruptHook ( ).
    /* Write the appropriate code to define the priorities for taskA
    and taskB in app_cfg .h. Use these defines to assign priorities
    when creating taskA and taskB with OSTaskCreate ( )
    */
    
    // Initialise the LCD display
    OpenXLCD( FOUR_BIT & LINES_5X7 );
    while( BusyXLCD() );
    WriteCmdXLCD( FOUR_BIT & LINES_5X7 );
    while( BusyXLCD() );
    WriteCmdXLCD( BLINK_ON );
    while( BusyXLCD() );
    WriteCmdXLCD( SHIFT_DISP_LEFT ); 
	
	msgQueue = OSQCreate(MessageStorage[1],MAX_NBR_MSGS);

    //Write the appropriate code to start uC / OS II kernel
    OSTaskCreate(TaskA, (void *)0,&TaskAStk[0],APP_TaskAStk_PRIO);
    OSTaskCreate(TaskB, (void *)0,&TaskBStk[0],APP_TaskBStk_PRIO);
      
    Tmr1Sem =  OSSemCreate(0);      //Counting  Semaphore     
    DispSem =  OSSemCreate(1);        //Signaling Semaphore
    FDirSem = OSSemCreate(1);
    BDirSem = OSSemCreate(1);
      
    OSStart();
}
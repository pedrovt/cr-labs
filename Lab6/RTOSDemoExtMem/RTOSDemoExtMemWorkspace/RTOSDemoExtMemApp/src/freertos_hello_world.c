/*
    Copyright (C) 2017 Amazon.com, Inc. or its affiliates.  All Rights Reserved.
    Copyright (C) 2012 - 2018 Xilinx, Inc. All Rights Reserved.

    Permission is hereby granted, free of charge, to any person obtaining a copy of
    this software and associated documentation files (the "Software"), to deal in
    the Software without restriction, including without limitation the rights to
    use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
    the Software, and to permit persons to whom the Software is furnished to do so,
    subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software. If you wish to use our Amazon
    FreeRTOS name, please do so in a fair use way that does not cause confusion.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
    FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
    COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
    IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
    CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

    http://www.FreeRTOS.org
    http://aws.amazon.com/freertos


    1 tab == 4 spaces!
*/

#include <stdio.h>
/* FreeRTOS includes. */
#include "FreeRTOS.h"
#include "task.h"
#include "timers.h"
/* Xilinx includes. */
#include "xil_printf.h"
#include "xparameters.h"
#include "xgpio_l.h"

/************************** Constant Definitions *****************************/

#define SW_TIMER_ID				1

#define SW_TIMER_MILISECS_VAL	2UL
// Requires configTICK_RATE_HZ to be set at least to 1000 (1 ms FreeRTOS tick),
// in the file "mb_design_wrapper\microblaze_0\freertos10_xilinx_domain\bsp\
//				microblaze_0\libsrc\freertos10_xilinx_v1_4\src\FreeRTOSConfig.h"

/******************************** Data types *********************************/

// Boolean data type (not defined in standard C)
typedef int bool;

// State machine data type
typedef enum {Stopped, Started, SetLSSec, SetMSSec, SetLSMin, SetMSMin} TFSMState;

// Buttons GPIO masks
#define BUTTON_UP_MASK		0x01
#define BUTTON_DOWN_MASK	0x04
#define BUTTON_RIGHT_MASK	0x08
#define BUTTON_CENTER_MASK	0x10

// Data structure to store buttons status
typedef struct SButtonStatus
{
	bool upPressed;
	bool downPressed;
	bool setPressed;
	bool startPressed;

	bool setPrevious;
	bool startPrevious;
} TButtonStatus;

// Data structure to store countdown timer value
typedef struct STimerValue
{
	unsigned int minMSValue;
	unsigned int minLSValue;
	unsigned int secMSValue;
	unsigned int secLSValue;
} TTimerValue;

/********************** Global variables (module scope) **********************/

static TTimerValue		timerValue	= {5, 9, 5, 9};
static bool				zeroFlag	= FALSE;

/***************************** Helper functions ******************************/

// 7 segment decoder
unsigned char Bin2Hex(int value)
{
	static const char bin2HexLUT[] = {0x40, 0x79, 0x24, 0x30, 0x19, 0x12, 0x02, 0x78,
									  0x00, 0x10, 0x08, 0x03, 0x46, 0x21, 0x06, 0x0E};
	return bin2HexLUT[value];
}

// Rising edge detection and clear
bool DetectAndClearRisingEdge(bool* pOldValue, bool newValue)
{
	bool retValue;

	retValue = (!(*pOldValue)) && newValue;
	*pOldValue = newValue;
	return retValue;
}

// Modular increment
bool ModularInc(unsigned int* pValue, unsigned int modulo)
{
	if (*pValue < modulo - 1)
	{
		(*pValue)++;
		return FALSE;
	}
	else
	{
		*pValue = 0;
		return TRUE;
	}
}

// Modular decrement
bool ModularDec(unsigned int* pValue, unsigned int modulo)
{
	if (*pValue > 0)
	{
		(*pValue)--;
		return FALSE;
	}
	else
	{
		*pValue = modulo - 1;
		return TRUE;
	}
}

// Tests if all timer digits are zero
bool IsTimerValueZero(const TTimerValue* pTimerValue)
{
	return ((pTimerValue->secLSValue == 0) && (pTimerValue->secMSValue == 0) &&
			(pTimerValue->minLSValue == 0) && (pTimerValue->minMSValue == 0));
}

// Conversion of the countdown timer values stored in a structure to an array of digits
void TimerValue2DigitValues(const TTimerValue* pTimerValue, unsigned int digitValues[8])
{
	digitValues[0] = 0;
	digitValues[1] = 0;
	digitValues[2] = pTimerValue->secLSValue;
	digitValues[3] = pTimerValue->secMSValue;
	digitValues[4] = pTimerValue->minLSValue;
	digitValues[5] = pTimerValue->minMSValue;
	digitValues[6] = 0;
	digitValues[7] = 0;
}

/******************* Countdown timer operations functions ********************/

void RefreshDisplays(unsigned char digitEnables, const unsigned int digitValues[8],
					 unsigned char decPtEnables)
{
	static unsigned int digitRefreshIdx = 0; // static variable - is preserved across calls


	XGpio_WriteReg(XPAR_AXI_GPIO_DISPLAY_BASEADDR, XGPIO_DATA_OFFSET,  ~(1 << digitRefreshIdx));

	unsigned int digitValue = ( !((decPtEnables >> digitRefreshIdx) & 0x01)) << 7;
	if ((digitEnables >> digitRefreshIdx) & 0x01) {
		digitValue += Bin2Hex(digitValues[digitRefreshIdx]);
	}
	else {
		digitValue += 0x7F;
	}
	XGpio_WriteReg(XPAR_AXI_GPIO_DISPLAY_BASEADDR, XGPIO_DATA2_OFFSET, digitValue);


	digitRefreshIdx++;
	digitRefreshIdx &= 0x07;
}

void ReadButtons(TButtonStatus* pButtonStatus)
{
	unsigned int buttonsPattern;

	buttonsPattern = XGpio_ReadReg(XPAR_AXI_GPIO_BUTTONS_BASEADDR, XGPIO_DATA_OFFSET);

	pButtonStatus->upPressed    = buttonsPattern & BUTTON_UP_MASK;
	pButtonStatus->downPressed  = buttonsPattern & BUTTON_DOWN_MASK;
	pButtonStatus->setPressed   = buttonsPattern & BUTTON_CENTER_MASK;
	pButtonStatus->startPressed = buttonsPattern & BUTTON_RIGHT_MASK;
}

void UpdateStateMachine(TFSMState* pFSMState, TButtonStatus* pButtonStatus,
						bool zeroFlag, unsigned char* pSetFlags)
{
	// Possible states: Stopped Started, SetLSSec, SetMSSec, SetLSMin, SetMSMin
		// Use DetectAndClearRisingEdge function
		// Zeroflag when timer = 0

		/* Debug only */
		/*
		switch(*pFSMState) {
		   case Stopped: xil_printf("State: Stopped\n"); break;
		   case Started: xil_printf("State: Started\n"); break;
		   case SetLSSec: xil_printf("State: SetLSSec\n"); break;
		   case SetMSSec: xil_printf("State: SetMSSec\n"); break;
		   case SetLSMin: xil_printf("State: SetLSMin\n"); break;
		   case SetMSMin: xil_printf("State: SetMSMin\n"); break;
		   default: xil_printf("Error");
		}
		*/

		switch (*pFSMState) {
			case Stopped:
				*pSetFlags = 0x0;			// digit ---- 0000

				// Update state

				if (DetectAndClearRisingEdge(&(pButtonStatus->startPrevious), pButtonStatus->startPressed) && zeroFlag == 0)
					*pFSMState = Started;
				else if (DetectAndClearRisingEdge(&(pButtonStatus->setPrevious), pButtonStatus->setPressed)) {
					*pFSMState = SetLSSec;
				}
				else {
					*pFSMState = Stopped;
				}
				break;

			case Started:
				*pSetFlags = 0x0;			// digit ---- 0000

				// Update state
				if (DetectAndClearRisingEdge(&(pButtonStatus->startPrevious), pButtonStatus->startPressed) || zeroFlag == 1) {
					*pFSMState = Stopped;
				}
				else {
					*pFSMState = Started;
				}
				break;

			// #########################################
			// SetLSSec clock : increment or decrement based on upDownEn
			case SetLSSec:
				*pSetFlags = 0x1;       	// digit ---X 0001

				// Update state
				if (DetectAndClearRisingEdge(&(pButtonStatus->setPrevious), pButtonStatus->setPressed)) {
					*pFSMState = SetMSSec;
				}
				else {
					*pFSMState = SetLSSec;
				}
				break;


			// #########################################
			// SetMSSec clock : increment or decrement based on upDownEn
			case SetMSSec:
				*pSetFlags = 0x2;       	// digit --X- 0010

				// Update state
				if (DetectAndClearRisingEdge(&(pButtonStatus->setPrevious), pButtonStatus->setPressed)) {
					*pFSMState = SetLSMin;
				}
				else {
					*pFSMState = SetMSSec;
				}
				break;

			// #########################################
			// SetLSMin clock : increment or decrement based on upDownEn
			case SetLSMin:
				*pSetFlags = 0x4;       	// digit -X-- 0100

				// Update state
				if (DetectAndClearRisingEdge(&(pButtonStatus->setPrevious), pButtonStatus->setPressed)) {
					*pFSMState = SetMSMin;
				}
				else {
					*pFSMState = SetLSMin;
				}
				break;

			// #########################################
			// SetMSMin clock : increment or decrement based on upDownEn
			case SetMSMin:
				*pSetFlags = 0x8;		 	// digit X--- 1000

				// Update state
				if (DetectAndClearRisingEdge(&(pButtonStatus->setPrevious), pButtonStatus->setPressed)) {
					*pFSMState = Stopped;
				}
				else {
					*pFSMState = SetMSMin;
				}
				break;

			// #########################################
			// Fallback situation
			default:
				*pSetFlags = 0x0; 			// digit ---- 0000
				*pFSMState = Stopped;
				break;
		}
}

void SetCountDownTimer(TFSMState fsmState, const TButtonStatus* pButtonStatus,
					   TTimerValue* pTimerValue)
{
	// Se estiver no estado certo ir ao Up ou Down e reagir de acordo
	// Not rising edge, level triggered
	switch(fsmState) {
	   case SetLSSec:
		   //xil_printf("State: SetLSSec\n");
		   if (pButtonStatus -> upPressed) {			// up has priority
			   ModularInc(&pTimerValue -> secLSValue, 10);
		   }
		   else if (pButtonStatus -> downPressed) {
			   ModularDec(&pTimerValue -> secLSValue, 10);
		   }
		   // else nothing happens
		   break;
	   case SetMSSec:
		   //xil_printf("State: SetMSSec\n");
		   if (pButtonStatus -> upPressed) {			// up has priority
			   ModularInc(&pTimerValue -> secMSValue, 6);
		   }
		   else if (pButtonStatus -> downPressed) {
			   ModularDec(&pTimerValue -> secMSValue, 6);
		   }
		   // else nothing happens
		   break;
	   case SetLSMin:
		   //xil_printf("State: SetLSMin\n");
		   if (pButtonStatus -> upPressed) {			// up has priority
			   ModularInc(&pTimerValue -> minLSValue, 10);
		   }
		   else if (pButtonStatus -> downPressed) {
			   ModularDec(&pTimerValue -> minLSValue, 10);
		   }
		   // else nothing happens
		   break;
	   case SetMSMin:
		   //xil_printf("State: SetMSMin\n");
		   if (pButtonStatus -> upPressed) {			// up has priority
			   ModularInc(&pTimerValue -> minMSValue, 6);
		   }
		   else if (pButtonStatus -> downPressed) {
			   ModularDec(&pTimerValue -> minMSValue, 6);
		   }
		   // else nothing happens
	   default:			// includes Stopped and Started States
		   break;
	}
}

void DecCountDownTimer(TFSMState fsmState, TTimerValue* pTimerValue)
{
	// Must consider ripple effect on digits (use return value of each ModuleDecrement)
	if (fsmState == Started) {													// Only during running
		bool continueToCount = ModularDec(&pTimerValue -> secLSValue, 10);		// Second Least Significative
		if (continueToCount) {
			continueToCount = ModularDec(&pTimerValue -> secMSValue, 6);		// Second Most  Significative
			if (continueToCount) {
				continueToCount = ModularDec(&pTimerValue -> minLSValue, 10);	// Minute Least Significative
				if (continueToCount) {
					ModularDec(&pTimerValue -> minMSValue, 6); 					// Minute Most  Significative
					// Last zero is detected by the Main
				}
				else return;
			}
			else return;
		}
		else return;
	}
}

static void SwTimerCallback(TimerHandle_t phTimer)
{
	// Timer event software counter
	static unsigned swTmrEventCount = 0;
	swTmrEventCount++;

    // Countdown timer status variables (static variables)
    static TFSMState     fsmState       = Stopped;
    static unsigned char setFlags       = 0x0;
    static TButtonStatus buttonStatus   = {FALSE, FALSE, FALSE, FALSE, FALSE, FALSE};
    static unsigned char digitEnables   = 0x3C;
    static unsigned int  digitValues[8] = {0, 0, 9, 5, 9, 5, 0, 0};
    static unsigned char decPtEnables   = 0x00;

    static bool          blink1HzStat   = FALSE;
    static bool          blink2HzStat   = FALSE;

	// Put here operations that must be performed at 1/(TIMER_MILISECS_VAL * 10^-3) rate
	// Refresh displays
	RefreshDisplays(digitEnables, digitValues, decPtEnables);

	if (swTmrEventCount % (125 / SW_TIMER_MILISECS_VAL)  == 0) // 8Hz = 1/125 msecs
	{
		// Put here operations that must be performed at 8Hz rate
		// Read push buttons
		ReadButtons(&buttonStatus);
		// Update state machine
		UpdateStateMachine(&fsmState, &buttonStatus, zeroFlag, &setFlags);
		if ((setFlags == 0x0) || (blink2HzStat))
		{
			digitEnables = 0x3C; // All digits active
		}
		else
		{
			digitEnables = (~(setFlags << 2)) & 0x3C; // Setting digit inactive
		}
	}

	if (swTmrEventCount % (250 / SW_TIMER_MILISECS_VAL) == 0) // 4Hz = 1/250 msecs
	{
		// Put here operations that must be performed at 4Hz rate
		// Switch digit set 2Hz blink status
		blink2HzStat = !blink2HzStat;
	}

	if (swTmrEventCount % (500 / SW_TIMER_MILISECS_VAL) == 0) // 2Hz = 1/500 msecs
	{
		// Put here operations that must be performed at 2Hz rate
		// Switch point 1Hz blink status
		blink1HzStat = !blink1HzStat;
		decPtEnables = (blink1HzStat ? 0x10 : 0x00);

		// Digit set increment/decrement
		SetCountDownTimer(fsmState, &buttonStatus, &timerValue);
	}

	if (swTmrEventCount == (1000 / SW_TIMER_MILISECS_VAL)) // 1Hz = 1/1000 msecs
	{
		// Put here operations that must be performed at 1Hz rate
		// Count down timer normal operation
		DecCountDownTimer(fsmState, &timerValue);

		// Reset hwTmrEventCount every second
		swTmrEventCount = 1;
	}

	zeroFlag = IsTimerValueZero(&timerValue);
	TimerValue2DigitValues(&timerValue, digitValues);
}

static void IdleTask(void *pTaskParams)
{
	const TickType_t ticks250mSecs = pdMS_TO_TICKS(250);

	while(1)
	{
		// Put here operations that are performed every 250 miliseconds (approximately)
		xil_printf("\r%d%d:%d%d", timerValue.minMSValue, timerValue.minLSValue,
								  timerValue.secMSValue, timerValue.secLSValue);
		XGpio_WriteReg(XPAR_AXI_GPIO_LEDS_BASEADDR, XGPIO_DATA_OFFSET,
					   zeroFlag ? 0x0001 : 0x0000);
		vTaskDelay(ticks250mSecs);
	}
}

/******************************* Main function *******************************/

int main( void )
{
	TaskHandle_t  hIdleTask;
	TimerHandle_t hTimer;

	xil_printf("\n\n\rCount down timer - FreeRTOS based version.\n\rConfiguring...");

	timerValue.minMSValue = 5;
	timerValue.minLSValue = 9;
	timerValue.secMSValue = 5;
	timerValue.secLSValue = 9;

	zeroFlag = FALSE;

	//	GPIO tri-state configuration
	//	Inputs
	XGpio_WriteReg(XPAR_AXI_GPIO_SWITCHES_BASEADDR, XGPIO_TRI_OFFSET, 0xFFFFFFFF);
	XGpio_WriteReg(XPAR_AXI_GPIO_BUTTONS_BASEADDR,  XGPIO_TRI_OFFSET, 0xFFFFFFFF);

	//	Outputs
	XGpio_WriteReg(XPAR_AXI_GPIO_LEDS_BASEADDR,     XGPIO_TRI_OFFSET, 0xFFFF0000);
	XGpio_WriteReg(XPAR_AXI_GPIO_DISPLAY_BASEADDR,  XGPIO_TRI_OFFSET, 0xFFFFFF00);
	XGpio_WriteReg(XPAR_AXI_GPIO_DISPLAY_BASEADDR, XGPIO_TRI2_OFFSET, 0xFFFFFF00);

	xil_printf("\n\rIOs configured.");

	xTaskCreate(IdleTask, (const char*)"Idle", configMINIMAL_STACK_SIZE,
				NULL, tskIDLE_PRIORITY, &hIdleTask);
	configASSERT(hIdleTask);

	xil_printf("\n\rIdle task created.");

	const TickType_t timerTicks = pdMS_TO_TICKS(SW_TIMER_MILISECS_VAL);
	hTimer = xTimerCreate((const char*)"Timer", timerTicks, pdTRUE,
						  (void*)SW_TIMER_ID, SwTimerCallback);
	configASSERT(hTimer);
	xTimerStart(hTimer, 0);

	xil_printf("\n\rTimer created.");

	xil_printf("\n\rSystem running.\n\r");

	// Start the task scheduler (tasks and timer callback running)
	vTaskStartScheduler();

	while (1)
	{
	}
}

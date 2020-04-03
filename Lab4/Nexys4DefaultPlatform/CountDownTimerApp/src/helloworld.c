/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "sleep.h"
#include "xgpio_l.h"
#include "xtmrctr_l.h"

/******************************************
	Data types
*******************************************/

// Boolean data type (not defined in standard C)
typedef int bool;

// State machine status
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
	int minMSValue;
	int minLSValue;
	int secMSValue;
	int secLSValue;
} TTimerValue;

/******************************************
	Helper functions
*******************************************/

// 7 segment decoder
unsigned char Bin2Hex(int value)
{
	static char bin2HexLUT[] = {0x40, 0x79, 0x24, 0x30, 0x19, 0x12, 0x02, 0x78,
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
bool ModularInc(int* pValue, unsigned int modulo)
{
	(*pValue)++;

	if (*pValue >= modulo)
	{
		*pValue = 0;
		return TRUE;
	}
	else
	{
		return FALSE;
	}
}

// Modular decrement
bool ModularDec(int* pValue, unsigned int modulo)
{
	(*pValue)--;

	if (*pValue < 0)
	{
		*pValue = modulo - 1;
		return TRUE;
	}
	else
	{
		return FALSE;
	}
}

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

/******************************************
	Countdown timer operations functions
*******************************************/

void RefreshDisplays(unsigned char digitEnables, const unsigned int digitValues[8], unsigned char decPtEnables)
{
	static unsigned int digitRefreshIdx = 0; // static variable - is preserved across calls

	XGpio_WriteReg(XPAR_AXI_GPIO_DISPLAY_BASEADDR, XGPIO_DATA_OFFSET,  ~(1 << digitRefreshIdx));

	unsigned int digitValue = ((~decPtEnables >> digitRefreshIdx) && 0x01) << 7;		//FIXME
	if ((digitEnables >> digitRefreshIdx) & 0x01) {
		//digitValue = ((digitPtEnables >> digitRefreshIdx) && 0x01) & (Bin2Hex(digitValues[digitRefreshIdx]));
		digitValue += Bin2Hex(digitValues[digitRefreshIdx]);
	}
	else {
		digitValue += 0xFF;
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

void UpdateStateMachine(TFSMState* pFSMState, TButtonStatus* pButtonStatus, bool zeroFlag, unsigned char* pSetFlags)
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

void SetCountDownTimer(TFSMState fsmState, const TButtonStatus* pButtonStatus, TTimerValue* pTimerValue)
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

int main()
{
    init_platform();
    print("\n\rCount down timer started\n\r");

    //	GPIO tri-state configuration
    //	Inputs
    XGpio_WriteReg(XPAR_AXI_GPIO_SWITCHES_BASEADDR, XGPIO_TRI_OFFSET,  0xFFFFFFFF);
    XGpio_WriteReg(XPAR_AXI_GPIO_BUTTONS_BASEADDR,  XGPIO_TRI_OFFSET,  0xFFFFFFFF);

    //	Outputs
    XGpio_WriteReg(XPAR_AXI_GPIO_LEDS_BASEADDR,     XGPIO_TRI_OFFSET,  0xFFFF0000);
    XGpio_WriteReg(XPAR_AXI_GPIO_DISPLAY_BASEADDR,  XGPIO_TRI_OFFSET,  0xFFFFFF00);
    XGpio_WriteReg(XPAR_AXI_GPIO_DISPLAY_BASEADDR,  XGPIO_TRI2_OFFSET, 0xFFFFFF00);

 	// Disable hardware timer
 	XTmrCtr_SetControlStatusReg(XPAR_AXI_TIMER_0_BASEADDR, 0, 0x00000000);
	// Set hardware timer load value
    XTmrCtr_SetLoadReg(XPAR_AXI_TIMER_0_BASEADDR, 0, 125000); // Counter will wrap around every 1.25 ms
    XTmrCtr_SetControlStatusReg(XPAR_AXI_TIMER_0_BASEADDR, 0, XTC_CSR_LOAD_MASK);
	// Enable hardware timer, down counting with auto reload
    XTmrCtr_SetControlStatusReg(XPAR_AXI_TIMER_0_BASEADDR, 0, XTC_CSR_ENABLE_TMR_MASK | XTC_CSR_AUTO_RELOAD_MASK | XTC_CSR_DOWN_COUNT_MASK);

    // Timer event software counter
    unsigned hwTmrEventCount = 0;

    TFSMState     fsmState       = Stopped;
    unsigned char setFlags       = 0x0;
    TButtonStatus buttonStatus   = {FALSE, FALSE, FALSE, FALSE, FALSE, FALSE};
    TTimerValue   timerValue     = {5, 9, 5, 9};
    bool          zeroFlag       = FALSE;

    unsigned char digitEnables   = 0x3C;
    unsigned int  digitValues[8] = {0, 0, 9, 5, 9, 5, 0, 0};
    unsigned char decPtEnables   = 0x00;

    bool          blink1HzStat   = FALSE;
	bool          blink2HzStat   = FALSE;

  	while (1)
  	{
  		unsigned int tmrCtrlStatReg = XTmrCtr_GetControlStatusReg(XPAR_AXI_TIMER_0_BASEADDR, 0);

  		if (tmrCtrlStatReg & XTC_CSR_INT_OCCURED_MASK)
		{
  			// Clear hardware timer event (interrupt request flag)
			XTmrCtr_SetControlStatusReg(XPAR_AXI_TIMER_0_BASEADDR, 0, tmrCtrlStatReg | XTC_CSR_INT_OCCURED_MASK);
			hwTmrEventCount++;

			// Put here operations that must be performed at 800Hz rate
			// Refresh displays
			RefreshDisplays(digitEnables, digitValues, decPtEnables);


			if (hwTmrEventCount % 100 == 0) // 8Hz
			{
				// Put here operations that must be performed at 8Hz rate
				// Read push buttons
				ReadButtons(&buttonStatus);
				// Update state machine
				UpdateStateMachine(&fsmState, &buttonStatus, zeroFlag, &setFlags);
				if ((setFlags == 0x0) || (blink2HzStat))
				{
					digitEnables = 0x3C;
				}
				else
				{
					digitEnables = (~(setFlags << 2)) & 0x3C;
				}


				if (hwTmrEventCount % 200 == 0) // 4Hz
				{
					// Put here operations that must be performed at 4Hz rate
					// Switch digit set 2Hz blink status
					blink2HzStat = !blink2HzStat;


					if (hwTmrEventCount % 400 == 0) // 2Hz
					{
						// Put here operations that must be performed at 2Hz rate
						// Switch point 1Hz blink status
						blink1HzStat = !blink1HzStat;
						decPtEnables = (blink1HzStat ? 0x10 : 0x00);

						// Digit set increment/decrement
						SetCountDownTimer(fsmState, &buttonStatus, &timerValue);
						TimerValue2DigitValues(&timerValue, digitValues);

						if (hwTmrEventCount == 800) // 1Hz
						{
							// Put here operations that must be performed at 1Hz rate
							// Count down timer normal operation
							DecCountDownTimer(fsmState, &timerValue);
							zeroFlag = IsTimerValueZero(&timerValue);

							/* enable LED0 when counting is done */
							if (zeroFlag) {
								XGpio_WriteReg(XPAR_AXI_GPIO_LEDS_BASEADDR, XGPIO_DATA_OFFSET, 0x1);
							}
							else {
								XGpio_WriteReg(XPAR_AXI_GPIO_LEDS_BASEADDR, XGPIO_DATA_OFFSET, 0x0);
							}

							TimerValue2DigitValues(&timerValue, digitValues);

							// Reset hwTmrEventCount every second
							hwTmrEventCount = 1;
						}
					}
				}
			}
		}

  		// Put here operations that are performed whenever possible


   }

	cleanup_platform();
	return 0;
}

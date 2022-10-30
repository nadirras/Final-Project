#include "MyProject_objects.h"
#include "MyProject_resources.h"

//--------------------- User code ---------------------//

//----------------- End of User code ------------------//

// Event Handlers

/*
Example for ECG Click

    Date          : Oct 2018.
    Author        : Nemanja Medakovic

Test configuration STM32 :

    MCU              : STM32F107VCT6
    Dev. Board       : EasyMx PRO v7 for STM32
    ARM Compiler ver : v6.0.0.0

---

Description :

The application is composed of three sections :

- System Initialization - Initializes peripherals and pins.
- Application Initialization - Initializes ADC and timer interrupt function.
- Application Task - (code snippet) - Reads ADC value and sends results on serial plotter
  every time when interrupt occurres.

Additional Functions :

- void initTimer2() - Initializes interrupt time to 5ms.
- void plotRes( uint16_t plotData, uint32_t plotTime ) - Sends data on the serial plotter.

*/

#include "Click_ECG_types.h"
#include "Click_ECG_config.h"
#include "Click_USB_UART_types.h"
#include "Click_USB_UART_config.h"
//#include "ekstraksifitur.h"
#include "Variabel.h"
#include "qrsdetection.h"
#include "Variabel_ANN.h"
#include "ANN.h"



uint32_t interrCnt;
uint8_t interrFlag;
uint16_t readADC;
uint32_t timeRead;
const uint16_t time_ms = 5;
/*char text[ 50 ];
unsigned int i, x, y;
float sign[1000];
float ecg[1000];  */

void InitTimer2(){
  RCC_APB1ENR.TIM2EN = 1;
  TIM2_CR1.CEN = 0;
  TIM2_PSC = 0;
  TIM2_ARR = 39999;
  NVIC_IntEnable(IVT_INT_TIM2);
  TIM2_DIER.UIE = 1;
  TIM2_CR1.CEN = 1;
}


void plotRes( float plotData, uint32_t plotTime ) //uint16_t plotData
{
    FloatToStr( plotData, text );
    mikrobus_logWrite( text, _LOG_TEXT );
    mikrobus_logWrite( ",", _LOG_TEXT );
    LongWordToStr( plotTime, text );
    mikrobus_logWrite( text, _LOG_LINE );
}


void systemInit()
{
    mikrobus_gpioInit( _MIKROBUS2, _MIKROBUS_AN_PIN, _GPIO_INPUT );

    mikrobus_logInit( _LOG_USBUART, 115200 );

    Delay_ms( 200 );

    mikrobus_uartInit( _MIKROBUS1, &_USB_UART_UART_CFG[0] );
    mikrobus_logInit( _MIKROBUS1, 115200 );

    Delay_ms( 100 );

}

void bingkai(int X1,int Y1, int X2, int Y2)
{
    TFT_Set_Pen(CL_WHITE, 1);
    TFT_Set_Brush(1, CL_WHITE, 0, TOP_TO_BOTTOM, CL_GREEN, CL_GREEN);
    TFT_Rectangle(X1,Y1,X2,Y2);
}



void applicationInit()
{
    usb_uart_uartDriverInit( (T_USB_UART_P)&_MIKROBUS4_GPIO, (T_USB_UART_P)&_MIKROBUS4_UART );
    mikrobus_logWrite( "Initialized", _LOG_LINE );
    Delay_ms( 100 );

    ecg_gpioDriverInit( (T_ECG_P)&_MIKROBUS1_GPIO );
    Delay_ms( 200 );

    ADC1_Init();
    ADC_Set_Input_Channel( _ADC_CHANNEL_8 );
    Delay_ms( 200 );

    initTimer2();
    interrFlag = 0;
    interrCnt = 0;
    EnableInterrupts();
}

void applicationTask()
{
    

   n = 1;

   while( n != 0 )
   {
   bingkai(100,50,477,271);
   readADC = ADC1_Get_Sample(8);
   sign[0] = (float) (readADC * 3.3)/4095;
   for (i=1;i<=800;i++)
   {
       readADC = ADC1_Get_Sample(8);
       sign[i] = (float) readADC * (3.3/4095);
//       ecg_processing();
//         timeRead = i * time_ms;
//    plotRes( sign[i], timeRead );
       //SIGNAL PLOTTING
       TFT_Set_Pen(CL_RED, 1);
//       TFT_Line(110+(i-1),70-0.1*sqr[i-1],(110+i),70-0.1*sqr[i]);
//       TFT_Line(20+((i-1)/2),220-(sign[i-1]*40),20+(i/2),220-(sign[i]*40));
       TFT_Line(((i-1)/2+97), 310-(sign[i-1]*50), (i/2)+97, 310-(sign[i]*50));
       FloatToStr(sign[i], text);
       mikrobus_logWrite(text, _LOG_LINE);
       Delay_ms(10);
   }
   n = 0;
   }

    if (interrFlag == 1)
    {
        interrFlag = 0;
        DisableInterrupts();

        readADC = ADC1_Get_Sample( 8 );
        timeRead = interrCnt * time_ms;
        plotRes( readADC, timeRead );
        EnableInterrupts();
    }
}



/*void main()
{
    systemInit();
    applicationInit();

    while (1)
    {
        applicationTask();
    }
}     */

void Timer2_interrupt() iv IVT_INT_TIM2
{
    TIM2_SR.UIF = 0;
    interrFlag = 1;

    if (interrCnt == 0x33333333)
    {
        interrCnt = 0;
    }
    else
    {
        interrCnt++;
    }
}

void Button1OnClick() {
     DrawScreen(&Screen2);
}

void Button2OnClick() {
     applicationTask();
    /* for (i=0;i<=jumlahdata;i++){
         yy[i] = sign[i];
     }
     filter();                */
}
void Button3OnClick() {
     bingkai(100,55,477,271);
     jumlahdata = 799;
     for(i=0;i<=jumlahdata;i++){
         yy[i] = 0;
     }  //non2 r kebalik, non3 cudb 7, non4 asystole
     for (i=0;i<=jumlahdata;i++){
         yy[i] = nonshockable4[i];
     }
     filter();

}
void Button4OnClick() {
//     bingkai();
//     filter();
     DrawScreen(&Screen3);
}
void Button5OnClick() {
     DrawScreen(&Screen4);
     ekstraksi();
     inputtohidden1();
     hidden1tohidden2();
     hidden2tohidden3();
     hidden3toout();
}
void Button6OnClick() {
     DrawScreen(&Screen3);
}
void Button7OnClick() {
     bingkai(100,55,477,271);
     jumlahdata = 799;
     for(i=0;i<=jumlahdata;i++){
         yy[i] = 0;
     }
     for (i=0;i<=jumlahdata;i++){
         yy[i] = shockable3[i];
     }
     filter();

}
void ButtonRound2OnClick() {
     DrawScreen(&Screen1);
}
void ButtonRound1OnClick() {
     DrawScreen(&Screen1);
}
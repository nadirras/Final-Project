#include "MyProject_objects.h"
#include "MyProject_resources.h"
#include "built_in.h"


// TFT module connections
sbit TFT_BLED at GPIOF_ODR.B10;
sbit TFT_CS at GPIOF_ODR.B13;
unsigned int TFT_DataPort at GPIOE_ODR;
sbit TFT_RD at GPIOF_ODR.B12;
sbit TFT_RS at GPIOF_ODR.B15;
sbit TFT_RST at GPIOF_ODR.B14;
sbit TFT_WR at GPIOF_ODR.B11;
// End TFT module connections

// Touch Panel module connections
// End Touch Panel module connections

// Global variables
unsigned int Xcoord, Ycoord;
char PenDown;
void *PressedObject;
int PressedObjectType;
unsigned int caption_length, caption_height;
unsigned int display_width, display_height;

int _object_count;
unsigned short object_pressed;
TButton *local_button;
TButton *exec_button;
int button_order;
TButton_Round *local_round_button;
TButton_Round *exec_round_button;
int round_button_order;
TLabel *local_label;
TLabel *exec_label;
int label_order;
TImage *local_image;
TImage *exec_image;
int image_order;
TBox *local_box;
TBox *exec_box;
int box_order;


void Write_to_Data_Lines(unsigned char _hi, unsigned char _lo) {
  GPIOE_ODR = (unsigned int) (_lo | (_hi << 8));
}

void Set_Index(unsigned short index) {
  TFT_RS = 0;
  Write_to_Data_Lines(0, index);
  TFT_WR = 0;
  asm nop;
  TFT_WR = 1;
}

void Write_Command(unsigned short cmd) {
  TFT_RS = 1;
  Write_to_Data_Lines(0, cmd);
  TFT_WR = 0;
  asm nop;
  TFT_WR = 1;
}

void Write_Data(unsigned int _data) {
  TFT_RS = 1;
  Write_to_Data_Lines(Hi(_data), Lo(_data));
  TFT_WR = 0;
  asm nop;
  TFT_WR = 1;
}

static void InitializeTouchPanel() {
  TFT_Set_Active(Set_Index, Write_Command, Write_Data);
  TFT_Init_SSD1963_Board_43(480, 272);

  TFT_Set_DBC_SSD1963(255);

  PenDown = 0;
  PressedObject = 0;
  PressedObjectType = -1;
}


/////////////////////////
  TScreen*  CurrentScreen;

  TScreen                Screen1;
  TBox                   Box1;
  TLabel                 Label1;
char Label1_Caption[28] = "Nadirra Shifa Zuhra Shafira";

  TLabel                 Label2;
char Label2_Caption[15] = "07311840000063";

  TImage               Image1;
  TImage               Image2;
  TButton               Button4;
char Button4_Caption[11] = "Pengukuran";

  TButton               Button1;
char Button1_Caption[9] = "Simulasi";

  TLabel                 Label8;
char Label8_Caption[26] = "\"PERANCANGAN ALAT DETEKSI";

  TLabel                 Label9;
char Label9_Caption[34] = "RITME SHOCKABLE DAN NON SHOCKABLE";

  TLabel                 Label10;
char Label10_Caption[31] = "DARI HENTI JANTUNG MENGGUNAKAN";

  TLabel                 Label11;
char Label11_Caption[18] = "MACHINE LEARNING\"";

  TButton                * const code Screen1_Buttons[2]=
         {
         &Button4,             
         &Button1              
         };
  TLabel                 * const code Screen1_Labels[6]=
         {
         &Label1,              
         &Label2,              
         &Label8,              
         &Label9,              
         &Label10,             
         &Label11              
         };
  TImage                 * const code Screen1_Images[2]=
         {
         &Image1,              
         &Image2               
         };
  TBox                   * const code Screen1_Boxes[1]=
         {
         &Box1                 
         };

  TScreen                Screen2;
  TButton               Button2;
char Button2_Caption[15] = "Sinyal Masukan";

  TButton_Round          ButtonRound1;
char ButtonRound1_Caption[2] = "<";

  TButton                * const code Screen2_Buttons[1]=
         {
         &Button2              
         };
  TButton_Round          * const code Screen2_Buttons_Round[1]=
         {
         &ButtonRound1         
         };

  TScreen                Screen3;
  TButton               Button3;
char Button3_Caption[21] = "Sinyal Non-shockable";

  TButton               Button5;
char Button5_Caption[8] = "Process";

  TButton               Button7;
char Button7_Caption[17] = "Sinyal Shockable";

  TButton_Round          ButtonRound2;
char ButtonRound2_Caption[2] = "<";

  TButton                * const code Screen3_Buttons[3]=
         {
         &Button3,             
         &Button5,             
         &Button7              
         };
  TButton_Round          * const code Screen3_Buttons_Round[1]=
         {
         &ButtonRound2         
         };

  TScreen                Screen4;
  TLabel                 Label7;
char Label7_Caption[6] = "Hasil";

  TButton               Button6;
char Button6_Caption[2] = "<";

  TBox                   Box2;
  TBox                   Box3;
  TBox                   Box4;
  TLabel                 Label4;
char Label4_Caption[7] = "Count1";

  TLabel                 Label3;
char Label3_Caption[7] = "Count2";

  TLabel                 Label5;
char Label5_Caption[3] = "Lk";

  TBox                   Box5;
  TLabel                 Label6;
char Label6_Caption[13] = "Layer Output";

  TBox                   Box6;
  TButton                * const code Screen4_Buttons[1]=
         {
         &Button6              
         };
  TLabel                 * const code Screen4_Labels[5]=
         {
         &Label7,              
         &Label4,              
         &Label3,              
         &Label5,              
         &Label6               
         };
  TBox                   * const code Screen4_Boxes[5]=
         {
         &Box2,                
         &Box3,                
         &Box4,                
         &Box5,                
         &Box6                 
         };



static void InitializeObjects() {
  Screen1.Color                     = 0x4164;
  Screen1.Width                     = 480;
  Screen1.Height                    = 272;
  Screen1.ButtonsCount              = 2;
  Screen1.Buttons                   = Screen1_Buttons;
  Screen1.Buttons_RoundCount        = 0;
  Screen1.LabelsCount               = 6;
  Screen1.Labels                    = Screen1_Labels;
  Screen1.ImagesCount               = 2;
  Screen1.Images                    = Screen1_Images;
  Screen1.BoxesCount                = 1;
  Screen1.Boxes                     = Screen1_Boxes;
  Screen1.ObjectsCount              = 11;
  Screen1.OnSwipeUpPtr    = 0;
  Screen1.OnSwipeDownPtr  = 0;
  Screen1.OnSwipeLeftPtr  = 0;
  Screen1.OnSwipeRightPtr = 0;
  Screen1.OnZoomInPtr     = 0;
  Screen1.OnZoomOutPtr    = 0;

  Screen2.Color                     = 0x4164;
  Screen2.Width                     = 480;
  Screen2.Height                    = 272;
  Screen2.ButtonsCount              = 1;
  Screen2.Buttons                   = Screen2_Buttons;
  Screen2.Buttons_RoundCount        = 1;
  Screen2.Buttons_Round             = Screen2_Buttons_Round;
  Screen2.LabelsCount               = 0;
  Screen2.ImagesCount               = 0;
  Screen2.BoxesCount                = 0;
  Screen2.ObjectsCount              = 2;
  Screen2.OnSwipeUpPtr    = 0;
  Screen2.OnSwipeDownPtr  = 0;
  Screen2.OnSwipeLeftPtr  = 0;
  Screen2.OnSwipeRightPtr = 0;
  Screen2.OnZoomInPtr     = 0;
  Screen2.OnZoomOutPtr    = 0;

  Screen3.Color                     = 0x4164;
  Screen3.Width                     = 480;
  Screen3.Height                    = 272;
  Screen3.ButtonsCount              = 3;
  Screen3.Buttons                   = Screen3_Buttons;
  Screen3.Buttons_RoundCount        = 1;
  Screen3.Buttons_Round             = Screen3_Buttons_Round;
  Screen3.LabelsCount               = 0;
  Screen3.ImagesCount               = 0;
  Screen3.BoxesCount                = 0;
  Screen3.ObjectsCount              = 4;
  Screen3.OnSwipeUpPtr    = 0;
  Screen3.OnSwipeDownPtr  = 0;
  Screen3.OnSwipeLeftPtr  = 0;
  Screen3.OnSwipeRightPtr = 0;
  Screen3.OnZoomInPtr     = 0;
  Screen3.OnZoomOutPtr    = 0;

  Screen4.Color                     = 0x4164;
  Screen4.Width                     = 480;
  Screen4.Height                    = 272;
  Screen4.ButtonsCount              = 1;
  Screen4.Buttons                   = Screen4_Buttons;
  Screen4.Buttons_RoundCount        = 0;
  Screen4.LabelsCount               = 5;
  Screen4.Labels                    = Screen4_Labels;
  Screen4.ImagesCount               = 0;
  Screen4.BoxesCount                = 5;
  Screen4.Boxes                     = Screen4_Boxes;
  Screen4.ObjectsCount              = 11;
  Screen4.OnSwipeUpPtr    = 0;
  Screen4.OnSwipeDownPtr  = 0;
  Screen4.OnSwipeLeftPtr  = 0;
  Screen4.OnSwipeRightPtr = 0;
  Screen4.OnZoomInPtr     = 0;
  Screen4.OnZoomOutPtr    = 0;


  Box1.OwnerScreen     = &Screen1;
  Box1.Order           = 0;
  Box1.Left            = 34;
  Box1.Top             = 51;
  Box1.Width           = 403;
  Box1.Height          = 133;
  Box1.Pen_Width       = 1;
  Box1.Pen_Color       = 0x0000;
  Box1.Visible         = 1;
  Box1.Active          = 1;
  Box1.Transparent     = 1;
  Box1.Gradient        = 0;
  Box1.Gradient_Orientation = 0;
  Box1.Gradient_Start_Color = 0xFFFF;
  Box1.Gradient_End_Color = 0xC618;
  Box1.Color           = 0x0000;
  Box1.PressColEnabled = 1;
  Box1.Press_Color     = 0xE71C;

  Label1.OwnerScreen     = &Screen1;
  Label1.Order           = 1;
  Label1.Left            = 243;
  Label1.Top             = 76;
  Label1.Width           = 139;
  Label1.Height          = 15;
  Label1.Visible         = 1;
  Label1.Active          = 1;
  Label1.Caption         = Label1_Caption;
  Label1.FontName        = Tahoma11x13_Regular;
  Label1.Font_Color      = 0xFFFF;
  Label1.VerticalText    = 0;

  Label2.OwnerScreen     = &Screen1;
  Label2.Order           = 2;
  Label2.Left            = 243;
  Label2.Top             = 95;
  Label2.Width           = 90;
  Label2.Height          = 15;
  Label2.Visible         = 1;
  Label2.Active          = 1;
  Label2.Caption         = Label2_Caption;
  Label2.FontName        = Tahoma11x13_Regular;
  Label2.Font_Color      = 0xFFFF;
  Label2.VerticalText    = 0;

  Image1.OwnerScreen     = &Screen1;
  Image1.Order           = 3;
  Image1.Left            = 150;
  Image1.Top             = 77;
  Image1.Width           = 74;
  Image1.Height          = 78;
  Image1.Picture_Type    = 0;
  Image1.Picture_Ratio   = 1;
  Image1.Picture_Name    = bme_logo_bmp;
  Image1.Visible         = 1;
  Image1.Active          = 1;

  Image2.OwnerScreen     = &Screen1;
  Image2.Order           = 4;
  Image2.Left            = 55;
  Image2.Top             = 76;
  Image2.Width           = 78;
  Image2.Height          = 78;
  Image2.Picture_Type    = 0;
  Image2.Picture_Ratio   = 1;
  Image2.Picture_Name    = Badge_ITS2_bmp;
  Image2.Visible         = 1;
  Image2.Active          = 1;

  Button4.OwnerScreen     = &Screen1;
  Button4.Order           = 5;
  Button4.Left            = 177;
  Button4.Top             = 222;
  Button4.Width           = 122;
  Button4.Height          = 28;
  Button4.Pen_Width       = 1;
  Button4.Pen_Color       = 0x0000;
  Button4.Visible         = 1;
  Button4.Active          = 1;
  Button4.Transparent     = 1;
  Button4.Caption         = Button4_Caption;
  Button4.TextAlign       = _taCenter;
  Button4.TextAlignVertical= _tavMiddle;
  Button4.FontName        = Tahoma11x13_Regular;
  Button4.PressColEnabled = 1;
  Button4.Font_Color      = 0x0000;
  Button4.VerticalText    = 0;
  Button4.Gradient        = 1;
  Button4.Gradient_Orientation = 0;
  Button4.Gradient_Start_Color = 0xFFFF;
  Button4.Gradient_End_Color = 0xC618;
  Button4.Color           = 0xC618;
  Button4.Press_Color     = 0xE71C;
  Button4.OnClickPtr      = Button4OnClick;

  Button1.OwnerScreen     = &Screen1;
  Button1.Order           = 6;
  Button1.Left            = 335;
  Button1.Top             = 222;
  Button1.Width           = 111;
  Button1.Height          = 25;
  Button1.Pen_Width       = 1;
  Button1.Pen_Color       = 0x0000;
  Button1.Visible         = 1;
  Button1.Active          = 1;
  Button1.Transparent     = 1;
  Button1.Caption         = Button1_Caption;
  Button1.TextAlign       = _taCenter;
  Button1.TextAlignVertical= _tavMiddle;
  Button1.FontName        = Tahoma11x13_Regular;
  Button1.PressColEnabled = 1;
  Button1.Font_Color      = 0x0000;
  Button1.VerticalText    = 0;
  Button1.Gradient        = 1;
  Button1.Gradient_Orientation = 0;
  Button1.Gradient_Start_Color = 0xFFFF;
  Button1.Gradient_End_Color = 0xC618;
  Button1.Color           = 0xC618;
  Button1.Press_Color     = 0xE71C;
  Button1.OnClickPtr      = Button1OnClick;

  Label8.OwnerScreen     = &Screen1;
  Label8.Order           = 7;
  Label8.Left            = 273;
  Label8.Top             = 124;
  Label8.Width           = 133;
  Label8.Height          = 12;
  Label8.Visible         = 1;
  Label8.Active          = 1;
  Label8.Caption         = Label8_Caption;
  Label8.FontName        = Tahoma10x11_Regular;
  Label8.Font_Color      = 0xFFFF;
  Label8.VerticalText    = 0;

  Label9.OwnerScreen     = &Screen1;
  Label9.Order           = 8;
  Label9.Left            = 234;
  Label9.Top             = 137;
  Label9.Width           = 178;
  Label9.Height          = 12;
  Label9.Visible         = 1;
  Label9.Active          = 1;
  Label9.Caption         = Label9_Caption;
  Label9.FontName        = Tahoma10x11_Regular;
  Label9.Font_Color      = 0xFFFF;
  Label9.VerticalText    = 0;

  Label10.OwnerScreen     = &Screen1;
  Label10.Order           = 9;
  Label10.Left            = 245;
  Label10.Top             = 152;
  Label10.Width           = 165;
  Label10.Height          = 12;
  Label10.Visible         = 1;
  Label10.Active          = 1;
  Label10.Caption         = Label10_Caption;
  Label10.FontName        = Tahoma10x11_Regular;
  Label10.Font_Color      = 0xFFFF;
  Label10.VerticalText    = 0;

  Label11.OwnerScreen     = &Screen1;
  Label11.Order           = 10;
  Label11.Left            = 320;
  Label11.Top             = 167;
  Label11.Width           = 92;
  Label11.Height          = 12;
  Label11.Visible         = 1;
  Label11.Active          = 1;
  Label11.Caption         = Label11_Caption;
  Label11.FontName        = Tahoma10x11_Regular;
  Label11.Font_Color      = 0xFFFF;
  Label11.VerticalText    = 0;

  Button2.OwnerScreen     = &Screen2;
  Button2.Order           = 0;
  Button2.Left            = 326;
  Button2.Top             = 15;
  Button2.Width           = 139;
  Button2.Height          = 30;
  Button2.Pen_Width       = 1;
  Button2.Pen_Color       = 0x0000;
  Button2.Visible         = 1;
  Button2.Active          = 1;
  Button2.Transparent     = 1;
  Button2.Caption         = Button2_Caption;
  Button2.TextAlign       = _taCenter;
  Button2.TextAlignVertical= _tavMiddle;
  Button2.FontName        = Tahoma11x13_Regular;
  Button2.PressColEnabled = 1;
  Button2.Font_Color      = 0x0000;
  Button2.VerticalText    = 0;
  Button2.Gradient        = 1;
  Button2.Gradient_Orientation = 0;
  Button2.Gradient_Start_Color = 0xFFFF;
  Button2.Gradient_End_Color = 0xC618;
  Button2.Color           = 0xC618;
  Button2.Press_Color     = 0xE71C;
  Button2.OnClickPtr      = Button2OnClick;

  ButtonRound1.OwnerScreen     = &Screen2;
  ButtonRound1.Order           = 1;
  ButtonRound1.Left            = 12;
  ButtonRound1.Top             = 18;
  ButtonRound1.Width           = 48;
  ButtonRound1.Height          = 31;
  ButtonRound1.Pen_Width       = 1;
  ButtonRound1.Pen_Color       = 0x0000;
  ButtonRound1.Visible         = 1;
  ButtonRound1.Active          = 1;
  ButtonRound1.Transparent     = 1;
  ButtonRound1.Caption         = ButtonRound1_Caption;
  ButtonRound1.TextAlign       = _taCenter;
  ButtonRound1.TextAlignVertical= _tavMiddle;
  ButtonRound1.FontName        = Tahoma11x13_Regular;
  ButtonRound1.PressColEnabled = 1;
  ButtonRound1.Font_Color      = 0x0000;
  ButtonRound1.VerticalText    = 0;
  ButtonRound1.Gradient        = 1;
  ButtonRound1.Gradient_Orientation = 0;
  ButtonRound1.Gradient_Start_Color = 0xFFFF;
  ButtonRound1.Gradient_End_Color = 0xC618;
  ButtonRound1.Color           = 0xC618;
  ButtonRound1.Press_Color     = 0xE71C;
  ButtonRound1.Corner_Radius   = 3;
  ButtonRound1.OnClickPtr      = ButtonRound1OnClick;

  Button3.OwnerScreen     = &Screen3;
  Button3.Order           = 0;
  Button3.Left            = 240;
  Button3.Top             = 7;
  Button3.Width           = 138;
  Button3.Height          = 28;
  Button3.Pen_Width       = 1;
  Button3.Pen_Color       = 0x0000;
  Button3.Visible         = 1;
  Button3.Active          = 1;
  Button3.Transparent     = 1;
  Button3.Caption         = Button3_Caption;
  Button3.TextAlign       = _taCenter;
  Button3.TextAlignVertical= _tavMiddle;
  Button3.FontName        = Tahoma11x13_Regular;
  Button3.PressColEnabled = 1;
  Button3.Font_Color      = 0x0000;
  Button3.VerticalText    = 0;
  Button3.Gradient        = 1;
  Button3.Gradient_Orientation = 0;
  Button3.Gradient_Start_Color = 0xFFFF;
  Button3.Gradient_End_Color = 0xC618;
  Button3.Color           = 0xC618;
  Button3.Press_Color     = 0xE71C;
  Button3.OnClickPtr      = Button3OnClick;

  Button5.OwnerScreen     = &Screen3;
  Button5.Order           = 1;
  Button5.Left            = 390;
  Button5.Top             = 8;
  Button5.Width           = 76;
  Button5.Height          = 27;
  Button5.Pen_Width       = 1;
  Button5.Pen_Color       = 0x0000;
  Button5.Visible         = 1;
  Button5.Active          = 1;
  Button5.Transparent     = 1;
  Button5.Caption         = Button5_Caption;
  Button5.TextAlign       = _taCenter;
  Button5.TextAlignVertical= _tavMiddle;
  Button5.FontName        = Tahoma11x13_Regular;
  Button5.PressColEnabled = 1;
  Button5.Font_Color      = 0x0000;
  Button5.VerticalText    = 0;
  Button5.Gradient        = 1;
  Button5.Gradient_Orientation = 0;
  Button5.Gradient_Start_Color = 0xFFFF;
  Button5.Gradient_End_Color = 0xC618;
  Button5.Color           = 0xC618;
  Button5.Press_Color     = 0xE71C;
  Button5.OnClickPtr      = Button5OnClick;

  Button7.OwnerScreen     = &Screen3;
  Button7.Order           = 2;
  Button7.Left            = 103;
  Button7.Top             = 7;
  Button7.Width           = 127;
  Button7.Height          = 29;
  Button7.Pen_Width       = 1;
  Button7.Pen_Color       = 0x0000;
  Button7.Visible         = 1;
  Button7.Active          = 1;
  Button7.Transparent     = 1;
  Button7.Caption         = Button7_Caption;
  Button7.TextAlign       = _taCenter;
  Button7.TextAlignVertical= _tavMiddle;
  Button7.FontName        = Tahoma11x13_Regular;
  Button7.PressColEnabled = 1;
  Button7.Font_Color      = 0x0000;
  Button7.VerticalText    = 0;
  Button7.Gradient        = 1;
  Button7.Gradient_Orientation = 0;
  Button7.Gradient_Start_Color = 0xFFFF;
  Button7.Gradient_End_Color = 0xC618;
  Button7.Color           = 0xC618;
  Button7.Press_Color     = 0xE71C;
  Button7.OnClickPtr      = Button7OnClick;

  ButtonRound2.OwnerScreen     = &Screen3;
  ButtonRound2.Order           = 3;
  ButtonRound2.Left            = 5;
  ButtonRound2.Top             = 10;
  ButtonRound2.Width           = 39;
  ButtonRound2.Height          = 28;
  ButtonRound2.Pen_Width       = 1;
  ButtonRound2.Pen_Color       = 0x0000;
  ButtonRound2.Visible         = 1;
  ButtonRound2.Active          = 1;
  ButtonRound2.Transparent     = 1;
  ButtonRound2.Caption         = ButtonRound2_Caption;
  ButtonRound2.TextAlign       = _taCenter;
  ButtonRound2.TextAlignVertical= _tavMiddle;
  ButtonRound2.FontName        = Tahoma11x13_Regular;
  ButtonRound2.PressColEnabled = 1;
  ButtonRound2.Font_Color      = 0x0000;
  ButtonRound2.VerticalText    = 0;
  ButtonRound2.Gradient        = 1;
  ButtonRound2.Gradient_Orientation = 0;
  ButtonRound2.Gradient_Start_Color = 0xFFFF;
  ButtonRound2.Gradient_End_Color = 0xC618;
  ButtonRound2.Color           = 0xC618;
  ButtonRound2.Press_Color     = 0xE71C;
  ButtonRound2.Corner_Radius   = 3;
  ButtonRound2.OnClickPtr      = ButtonRound2OnClick;

  Label7.OwnerScreen     = &Screen4;
  Label7.Order           = 0;
  Label7.Left            = 341;
  Label7.Top             = 173;
  Label7.Width           = 43;
  Label7.Height          = 20;
  Label7.Visible         = 1;
  Label7.Active          = 1;
  Label7.Caption         = Label7_Caption;
  Label7.FontName        = Tahoma18x18_Bold;
  Label7.Font_Color      = 0xDED8;
  Label7.VerticalText    = 0;

  Button6.OwnerScreen     = &Screen4;
  Button6.Order           = 1;
  Button6.Left            = 11;
  Button6.Top             = 229;
  Button6.Width           = 39;
  Button6.Height          = 33;
  Button6.Pen_Width       = 1;
  Button6.Pen_Color       = 0x0000;
  Button6.Visible         = 1;
  Button6.Active          = 1;
  Button6.Transparent     = 1;
  Button6.Caption         = Button6_Caption;
  Button6.TextAlign       = _taCenter;
  Button6.TextAlignVertical= _tavMiddle;
  Button6.FontName        = Tahoma11x13_Regular;
  Button6.PressColEnabled = 1;
  Button6.Font_Color      = 0x0000;
  Button6.VerticalText    = 0;
  Button6.Gradient        = 1;
  Button6.Gradient_Orientation = 0;
  Button6.Gradient_Start_Color = 0xFFFF;
  Button6.Gradient_End_Color = 0xC618;
  Button6.Color           = 0xC618;
  Button6.Press_Color     = 0xE71C;
  Button6.OnClickPtr      = Button6OnClick;

  Box2.OwnerScreen     = &Screen4;
  Box2.Order           = 2;
  Box2.Left            = 39;
  Box2.Top             = 45;
  Box2.Width           = 163;
  Box2.Height          = 26;
  Box2.Pen_Width       = 1;
  Box2.Pen_Color       = 0x0000;
  Box2.Visible         = 1;
  Box2.Active          = 1;
  Box2.Transparent     = 1;
  Box2.Gradient        = 1;
  Box2.Gradient_Orientation = 0;
  Box2.Gradient_Start_Color = 0x20C2;
  Box2.Gradient_End_Color = 0x630C;
  Box2.Color           = 0xC618;
  Box2.PressColEnabled = 1;
  Box2.Press_Color     = 0xE71C;

  Box3.OwnerScreen     = &Screen4;
  Box3.Order           = 3;
  Box3.Left            = 39;
  Box3.Top             = 89;
  Box3.Width           = 163;
  Box3.Height          = 26;
  Box3.Pen_Width       = 1;
  Box3.Pen_Color       = 0x0000;
  Box3.Visible         = 1;
  Box3.Active          = 1;
  Box3.Transparent     = 1;
  Box3.Gradient        = 1;
  Box3.Gradient_Orientation = 0;
  Box3.Gradient_Start_Color = 0x20C2;
  Box3.Gradient_End_Color = 0x630C;
  Box3.Color           = 0xC618;
  Box3.PressColEnabled = 1;
  Box3.Press_Color     = 0xE71C;

  Box4.OwnerScreen     = &Screen4;
  Box4.Order           = 4;
  Box4.Left            = 269;
  Box4.Top             = 89;
  Box4.Width           = 163;
  Box4.Height          = 26;
  Box4.Pen_Width       = 1;
  Box4.Pen_Color       = 0x0000;
  Box4.Visible         = 1;
  Box4.Active          = 1;
  Box4.Transparent     = 1;
  Box4.Gradient        = 1;
  Box4.Gradient_Orientation = 0;
  Box4.Gradient_Start_Color = 0x20C2;
  Box4.Gradient_End_Color = 0x630C;
  Box4.Color           = 0xC618;
  Box4.PressColEnabled = 1;
  Box4.Press_Color     = 0xE71C;

  Label4.OwnerScreen     = &Screen4;
  Label4.Order           = 5;
  Label4.Left            = 89;
  Label4.Top             = 20;
  Label4.Width           = 61;
  Label4.Height          = 20;
  Label4.Visible         = 1;
  Label4.Active          = 1;
  Label4.Caption         = Label4_Caption;
  Label4.FontName        = Tahoma18x18_Bold;
  Label4.Font_Color      = 0xDED8;
  Label4.VerticalText    = 0;

  Label3.OwnerScreen     = &Screen4;
  Label3.Order           = 6;
  Label3.Left            = 90;
  Label3.Top             = 69;
  Label3.Width           = 61;
  Label3.Height          = 20;
  Label3.Visible         = 1;
  Label3.Active          = 1;
  Label3.Caption         = Label3_Caption;
  Label3.FontName        = Tahoma18x18_Bold;
  Label3.Font_Color      = 0xDED8;
  Label3.VerticalText    = 0;

  Label5.OwnerScreen     = &Screen4;
  Label5.Order           = 7;
  Label5.Left            = 339;
  Label5.Top             = 63;
  Label5.Width           = 23;
  Label5.Height          = 20;
  Label5.Visible         = 1;
  Label5.Active          = 1;
  Label5.Caption         = Label5_Caption;
  Label5.FontName        = Tahoma18x18_Bold;
  Label5.Font_Color      = 0xDED8;
  Label5.VerticalText    = 0;

  Box5.OwnerScreen     = &Screen4;
  Box5.Order           = 8;
  Box5.Left            = 174;
  Box5.Top             = 198;
  Box5.Width           = 111;
  Box5.Height          = 25;
  Box5.Pen_Width       = 1;
  Box5.Pen_Color       = 0x0000;
  Box5.Visible         = 1;
  Box5.Active          = 1;
  Box5.Transparent     = 1;
  Box5.Gradient        = 1;
  Box5.Gradient_Orientation = 0;
  Box5.Gradient_Start_Color = 0x20C2;
  Box5.Gradient_End_Color = 0x630C;
  Box5.Color           = 0xC618;
  Box5.PressColEnabled = 1;
  Box5.Press_Color     = 0xE71C;

  Label6.OwnerScreen     = &Screen4;
  Label6.Order           = 9;
  Label6.Left            = 176;
  Label6.Top             = 172;
  Label6.Width           = 107;
  Label6.Height          = 20;
  Label6.Visible         = 1;
  Label6.Active          = 1;
  Label6.Caption         = Label6_Caption;
  Label6.FontName        = Tahoma18x18_Bold;
  Label6.Font_Color      = 0xDED8;
  Label6.VerticalText    = 0;

  Box6.OwnerScreen     = &Screen4;
  Box6.Order           = 10;
  Box6.Left            = 315;
  Box6.Top             = 198;
  Box6.Width           = 94;
  Box6.Height          = 23;
  Box6.Pen_Width       = 1;
  Box6.Pen_Color       = 0x0000;
  Box6.Visible         = 1;
  Box6.Active          = 1;
  Box6.Transparent     = 1;
  Box6.Gradient        = 1;
  Box6.Gradient_Orientation = 0;
  Box6.Gradient_Start_Color = 0x20C2;
  Box6.Gradient_End_Color = 0x630C;
  Box6.Color           = 0xC618;
  Box6.PressColEnabled = 1;
  Box6.Press_Color     = 0xE71C;
}

static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) { // static
  if ( (Left<= X) && (Left+ Width - 1 >= X) &&
       (Top <= Y)  && (Top + Height - 1 >= Y) )
    return 1;
  else
    return 0;
}


#define GetButton(index)              CurrentScreen->Buttons[index]
#define GetRoundButton(index)         CurrentScreen->Buttons_Round[index]
#define GetLabel(index)               CurrentScreen->Labels[index]
#define GetImage(index)               CurrentScreen->Images[index]
#define GetBox(index)                 CurrentScreen->Boxes[index]

void DrawButton(TButton *Abutton) {
unsigned int ALeft, ATop;
  if (Abutton->Visible != 0) {
    if (object_pressed == 1) {
      object_pressed = 0;
      TFT_Set_Brush(Abutton->Transparent, Abutton->Press_Color, Abutton->Gradient, Abutton->Gradient_Orientation, Abutton->Gradient_End_Color, Abutton->Gradient_Start_Color);
    }
    else {
      TFT_Set_Brush(Abutton->Transparent, Abutton->Color, Abutton->Gradient, Abutton->Gradient_Orientation, Abutton->Gradient_Start_Color, Abutton->Gradient_End_Color);
    }
    TFT_Set_Pen(Abutton->Pen_Color, Abutton->Pen_Width);
    TFT_Rectangle(Abutton->Left, Abutton->Top, Abutton->Left + Abutton->Width - 1, Abutton->Top + Abutton->Height - 1);
    if (Abutton->VerticalText != 0)
      TFT_Set_Font(Abutton->FontName, Abutton->Font_Color, FO_VERTICAL_COLUMN);
    else
      TFT_Set_Font(Abutton->FontName, Abutton->Font_Color, FO_HORIZONTAL);
    TFT_Write_Text_Return_Pos(Abutton->Caption, Abutton->Left, Abutton->Top);
    if (Abutton->TextAlign == _taLeft)
      ALeft = Abutton->Left + 4;
    else if (Abutton->TextAlign == _taCenter)
      ALeft = Abutton->Left + (Abutton->Width - caption_length) / 2;
    else if (Abutton->TextAlign == _taRight)
      ALeft = Abutton->Left + Abutton->Width - caption_length - 4;

    if (Abutton->TextAlignVertical == _tavTop)
      ATop = Abutton->Top + 4;
    else if (Abutton->TextAlignVertical == _tavMiddle)
      ATop = Abutton->Top + ((Abutton->Height - caption_height) / 2);
    else if (Abutton->TextAlignVertical == _tavBottom)
      ATop = Abutton->Top + (Abutton->Height - caption_height - 4);

    TFT_Write_Text(Abutton->Caption, ALeft, ATop);
  }
}

void DrawRoundButton(TButton_Round *Around_button) {
unsigned int ALeft, ATop;
  if (Around_button->Visible != 0) {
    if (object_pressed == 1) {
      object_pressed = 0;
      TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
                    Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
    }
    else {
      TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
                    Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
    }
    TFT_Set_Pen(Around_button->Pen_Color, Around_button->Pen_Width);
    TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
      Around_button->Left + Around_button->Width - 2,
      Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
    if (Around_button->VerticalText != 0)
      TFT_Set_Font(Around_button->FontName, Around_button->Font_Color, FO_VERTICAL_COLUMN);
    else
      TFT_Set_Font(Around_button->FontName, Around_button->Font_Color, FO_HORIZONTAL);
    TFT_Write_Text_Return_Pos(Around_button->Caption, Around_button->Left, Around_button->Top);
    if (Around_button->TextAlign == _taLeft)
      ALeft = Around_button->Left + 4;
    else if (Around_button->TextAlign == _taCenter)
      ALeft = Around_button->Left + (Around_button->Width - caption_length) / 2;
    else if (Around_button->TextAlign == _taRight)
      ALeft = Around_button->Left + Around_button->Width - caption_length - 4;

    if (Around_button->TextAlignVertical == _tavTop)
      ATop = Around_button->Top + 3;
    else if (Around_button->TextAlignVertical == _tavMiddle)
      ATop = Around_button->Top + (Around_button->Height - caption_height) / 2;
    else if (Around_button->TextAlignVertical == _tavBottom)
      ATop  = Around_button->Top + Around_button->Height - caption_height - 4;

    TFT_Write_Text(Around_button->Caption, ALeft, ATop);
  }
}

void DrawLabel(TLabel *ALabel) {
  if (ALabel->Visible != 0) {
    if (ALabel->VerticalText != 0)
      TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_VERTICAL_COLUMN);
    else
      TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_HORIZONTAL);
    TFT_Write_Text(ALabel->Caption, ALabel->Left, ALabel->Top);
  }
}

void DrawImage(TImage *AImage) {
  if (AImage->Visible != 0) {
    TFT_Image(AImage->Left, AImage->Top, AImage->Picture_Name, AImage->Picture_Ratio);
  }
}

void DrawBox(TBox *ABox) {
  if (ABox->Visible != 0) {
    if (object_pressed == 1) {
      object_pressed = 0;
      TFT_Set_Brush(ABox->Transparent, ABox->Press_Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_End_Color, ABox->Gradient_Start_Color);
    }
    else {
      TFT_Set_Brush(ABox->Transparent, ABox->Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_Start_Color, ABox->Gradient_End_Color);
    }
    TFT_Set_Pen(ABox->Pen_Color, ABox->Pen_Width);
    TFT_Rectangle(ABox->Left, ABox->Top, ABox->Left + ABox->Width - 1, ABox->Top + ABox->Height - 1);
  }
}

void DrawScreen(TScreen *aScreen) {
 unsigned int order;
  unsigned short button_idx;
  TButton *local_button;
  unsigned short round_button_idx;
  TButton_Round *local_round_button;
  unsigned short label_idx;
  TLabel *local_label;
  unsigned short image_idx;
  TImage *local_image;
  unsigned short box_idx;
  TBox *local_box;
  char save_bled;

  object_pressed = 0;
  order = 0;
  button_idx = 0;
  round_button_idx = 0;
  label_idx = 0;
  image_idx = 0;
  box_idx = 0;
  CurrentScreen = aScreen;

  if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
    save_bled = TFT_BLED;
    TFT_BLED           = 0;
    TFT_Set_Active(Set_Index, Write_Command, Write_Data);
    TFT_Init_SSD1963_Board_43(CurrentScreen->Width, CurrentScreen->Height);
    FT5XX6_SetSize(CurrentScreen->Width, CurrentScreen->Height);
    TFT_Fill_Screen(CurrentScreen->Color);
    TFT_Set_DBC_SSD1963(255);
    display_width = CurrentScreen->Width;
    display_height = CurrentScreen->Height;
    TFT_BLED           = save_bled;
  }
  else
    TFT_Fill_Screen(CurrentScreen->Color);


  while (order < CurrentScreen->ObjectsCount) {
    if (button_idx < CurrentScreen->ButtonsCount) {
      local_button = GetButton(button_idx);
      if (order == local_button->Order) {
        button_idx++;
        order++;
        DrawButton(local_button);
      }
    }

    if (round_button_idx < CurrentScreen->Buttons_RoundCount) {
      local_round_button = GetRoundButton(round_button_idx);
      if (order == local_round_button->Order) {
        round_button_idx++;
        order++;
        DrawRoundButton(local_round_button);
      }
    }

    if (label_idx < CurrentScreen->LabelsCount) {
      local_label = GetLabel(label_idx);
      if (order == local_label->Order) {
        label_idx++;
        order++;
        DrawLabel(local_label);
      }
    }

    if (box_idx < CurrentScreen->BoxesCount) {
      local_box = GetBox(box_idx);
      if (order == local_box->Order) {
        box_idx++;
        order++;
        DrawBox(local_box);
      }
    }

    if (image_idx < CurrentScreen->ImagesCount) {
      local_image = GetImage(image_idx);
      if (order == local_image->Order) {
        image_idx++;
        order++;
        DrawImage(local_image);
      }
    }

  }
}

void Get_Object(unsigned int X, unsigned int Y) {
  button_order        = -1;
  round_button_order  = -1;
  label_order         = -1;
  image_order         = -1;
  box_order           = -1;
  //  Buttons
  for ( _object_count = 0 ; _object_count < CurrentScreen->ButtonsCount ; _object_count++ ) {
    local_button = GetButton(_object_count);
    if (local_button->Active != 0) {
      if (IsInsideObject(X, Y, local_button->Left, local_button->Top,
                         local_button->Width, local_button->Height) == 1) {
        button_order = local_button->Order;
        exec_button = local_button;
      }
    }
  }

  //  Buttons with Round Edges
  for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
    local_round_button = GetRoundButton(_object_count);
    if (local_round_button->Active != 0) {
      if (IsInsideObject(X, Y, local_round_button->Left, local_round_button->Top,
                         local_round_button->Width, local_round_button->Height) == 1) {
        round_button_order = local_round_button->Order;
        exec_round_button = local_round_button;
      }
    }
  }

  //  Labels
  for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
    local_label = GetLabel(_object_count);
    if (local_label->Active != 0) {
      if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
                         local_label->Width, local_label->Height) == 1) {
        label_order = local_label->Order;
        exec_label = local_label;
      }
    }
  }

  //  Images
  for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
    local_image = GetImage(_object_count);
    if (local_image->Active != 0) {
      if (IsInsideObject(X, Y, local_image->Left, local_image->Top,
                         local_image->Width, local_image->Height) == 1) {
        image_order = local_image->Order;
        exec_image = local_image;
      }
    }
  }

  //  Boxes
  for ( _object_count = 0 ; _object_count < CurrentScreen->BoxesCount ; _object_count++ ) {
    local_box = GetBox(_object_count);
    if (local_box->Active != 0) {
      if (IsInsideObject(X, Y, local_box->Left, local_box->Top,
                         local_box->Width, local_box->Height) == 1) {
        box_order = local_box->Order;
        exec_box = local_box;
      }
    }
  }

  _object_count = -1;
  if (button_order >  _object_count )
    _object_count = button_order;
  if (round_button_order >  _object_count )
    _object_count = round_button_order;
  if (label_order >  _object_count )
    _object_count = label_order;
  if (image_order >  _object_count )
    _object_count = image_order;
  if (box_order >  _object_count )
    _object_count = box_order;
}


void Process_TP_Press(unsigned int X, unsigned int Y) {
  exec_button         = 0;
  exec_round_button   = 0;
  exec_label          = 0;
  exec_image          = 0;
  exec_box            = 0;

  Get_Object(X, Y);

  if (_object_count != -1) {
    if (_object_count == button_order) {
      if (exec_button->Active != 0) {
        if (exec_button->OnPressPtr != 0) {
          exec_button->OnPressPtr();
          return;
        }
      }
    }

    if (_object_count == round_button_order) {
      if (exec_round_button->Active != 0) {
        if (exec_round_button->OnPressPtr != 0) {
          exec_round_button->OnPressPtr();
          return;
        }
      }
    }

    if (_object_count == label_order) {
      if (exec_label->Active != 0) {
        if (exec_label->OnPressPtr != 0) {
          exec_label->OnPressPtr();
          return;
        }
      }
    }

    if (_object_count == image_order) {
      if (exec_image->Active != 0) {
        if (exec_image->OnPressPtr != 0) {
          exec_image->OnPressPtr();
          return;
        }
      }
    }

    if (_object_count == box_order) {
      if (exec_box->Active != 0) {
        if (exec_box->OnPressPtr != 0) {
          exec_box->OnPressPtr();
          return;
        }
      }
    }

  }
}

void Process_TP_Up(unsigned int X, unsigned int Y) {

  switch (PressedObjectType) {
    // Button
    case 0: {
      if (PressedObject != 0) {
        exec_button = (TButton*)PressedObject;
        if ((exec_button->PressColEnabled != 0) && (exec_button->OwnerScreen == CurrentScreen)) {
          DrawButton(exec_button);
        }
        break;
      }
      break;
    }
    // Round Button
    case 1: {
      if (PressedObject != 0) {
        exec_round_button = (TButton_Round*)PressedObject;
        if ((exec_round_button->PressColEnabled != 0) && (exec_round_button->OwnerScreen == CurrentScreen)) {
          DrawRoundButton(exec_round_button);
        }
        break;
      }
      break;
    }
    // Box
    case 6: {
      if (PressedObject != 0) {
        exec_box = (TBox*)PressedObject;
        if ((exec_box->PressColEnabled != 0) && (exec_box->OwnerScreen == CurrentScreen)) {
          DrawBox(exec_box);
        }
        break;
      }
      break;
    }
  }

  exec_label          = 0;
  exec_image          = 0;

  Get_Object(X, Y);


  if (_object_count != -1) {
  // Buttons
    if (_object_count == button_order) {
      if (exec_button->Active != 0) {
        if (exec_button->OnUpPtr != 0)
          exec_button->OnUpPtr();
        if (PressedObject == (void *)exec_button)
          if (exec_button->OnClickPtr != 0)
            exec_button->OnClickPtr();
        PressedObject = 0;
        PressedObjectType = -1;
        return;
      }
    }

  // Buttons with Round Edges
    if (_object_count == round_button_order) {
      if (exec_round_button->Active != 0) {
        if (exec_round_button->OnUpPtr != 0)
          exec_round_button->OnUpPtr();
        if (PressedObject == (void *)exec_round_button)
          if (exec_round_button->OnClickPtr != 0)
            exec_round_button->OnClickPtr();
        PressedObject = 0;
        PressedObjectType = -1;
        return;
      }
    }

  // Labels
    if (_object_count == label_order) {
      if (exec_label->Active != 0) {
        if (exec_label->OnUpPtr != 0)
          exec_label->OnUpPtr();
        if (PressedObject == (void *)exec_label)
          if (exec_label->OnClickPtr != 0)
            exec_label->OnClickPtr();
        PressedObject = 0;
        PressedObjectType = -1;
        return;
      }
    }

  // Images
    if (_object_count == image_order) {
      if (exec_image->Active != 0) {
        if (exec_image->OnUpPtr != 0)
          exec_image->OnUpPtr();
        if (PressedObject == (void *)exec_image)
          if (exec_image->OnClickPtr != 0)
            exec_image->OnClickPtr();
        PressedObject = 0;
        PressedObjectType = -1;
        return;
      }
    }

  // Boxes
    if (_object_count == box_order) {
      if (exec_box->Active != 0) {
        if (exec_box->OnUpPtr != 0)
          exec_box->OnUpPtr();
        if (PressedObject == (void *)exec_box)
          if (exec_box->OnClickPtr != 0)
            exec_box->OnClickPtr();
        PressedObject = 0;
        PressedObjectType = -1;
        return;
      }
    }

  }
  PressedObject = 0;
  PressedObjectType = -1;
}

void Process_TP_Down(unsigned int X, unsigned int Y) {

  object_pressed      = 0;
  exec_button         = 0;
  exec_round_button   = 0;
  exec_label          = 0;
  exec_image          = 0;
  exec_box            = 0;

  Get_Object(X, Y);

  if (_object_count != -1) {
    if (_object_count == button_order) {
      if (exec_button->Active != 0) {
        if (exec_button->PressColEnabled != 0) {
          object_pressed = 1;
          DrawButton(exec_button);
        }
        PressedObject = (void *)exec_button;
        PressedObjectType = 0;
        if (exec_button->OnDownPtr != 0) {
          exec_button->OnDownPtr();
          return;
        }
      }
    }

    if (_object_count == round_button_order) {
      if (exec_round_button->Active != 0) {
        if (exec_round_button->PressColEnabled != 0) {
          object_pressed = 1;
          DrawRoundButton(exec_round_button);
        }
        PressedObject = (void *)exec_round_button;
        PressedObjectType = 1;
        if (exec_round_button->OnDownPtr != 0) {
          exec_round_button->OnDownPtr();
          return;
        }
      }
    }

    if (_object_count == label_order) {
      if (exec_label->Active != 0) {
        PressedObject = (void *)exec_label;
        PressedObjectType = 2;
        if (exec_label->OnDownPtr != 0) {
          exec_label->OnDownPtr();
          return;
        }
      }
    }

    if (_object_count == image_order) {
      if (exec_image->Active != 0) {
        PressedObject = (void *)exec_image;
        PressedObjectType = 3;
        if (exec_image->OnDownPtr != 0) {
          exec_image->OnDownPtr();
          return;
        }
      }
    }

    if (_object_count == box_order) {
      if (exec_box->Active != 0) {
        if (exec_box->PressColEnabled != 0) {
          object_pressed = 1;
          DrawBox(exec_box);
        }
        PressedObject = (void *)exec_box;
        PressedObjectType = 6;
        if (exec_box->OnDownPtr != 0) {
          exec_box->OnDownPtr();
          return;
        }
      }
    }

  }
}

void Check_TP() {
  if (FT5XX6_PressDetect()) {
    if (FT5XX6_GetCoordinates(&Xcoord, &Ycoord) == 0) {
    // After a PRESS is detected read X-Y and convert it to Display dimensions space
      Process_TP_Press(Xcoord, Ycoord);
      if (PenDown == 0) {
        PenDown = 1;
        Process_TP_Down(Xcoord, Ycoord);
      }
    }
  }
  else if (PenDown == 1) {
    PenDown = 0;
    Process_TP_Up(Xcoord, Ycoord);
  }
}

void Init_MCU() {
  GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_6);
  GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_7);
  GPIOB_ODR.B6 = 1;
  while (GPIOB_IDR.B7 == 0) {
    GPIOB_ODR.B6 = 0;
    Delay_us(10);
    GPIOB_ODR.B6 = 1;
    Delay_us(10);
  }
   I2C1_Init_Advanced(400000, &_GPIO_MODULE_I2C1_PB67);
}

char FT5XX6_Config()  {
  FT5XX6_SetI2CAddress(0x38);
  if (FT5XX6_IsOperational() != FT5XX6_OK)
    return  FT5XX6_FAILURE;
  FT5XX6_SetDefaultMode();
  FT5XX6_SetController(_TC_FT5X16);
  FT5XX6_SetSizeAndRotation(480,272,0);
return FT5XX6_OK;
}

void Start_TP() {
  Init_MCU();

  InitializeTouchPanel();
  if (FT5XX6_Config() == FT5XX6_OK) {
  } else {
    while(1);
  }


  InitializeObjects();
  display_width = Screen1.Width;
  display_height = Screen1.Height;
  DrawScreen(&Screen1);
}

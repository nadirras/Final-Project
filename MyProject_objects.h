typedef enum {_taLeft, _taCenter, _taRight} TTextAlign;
typedef enum {_tavTop, _tavMiddle, _tavBottom} TTextAlignVertical;

typedef struct Screen TScreen;

typedef struct  Button {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  char          Pen_Width;
  unsigned int  Pen_Color;
  char          Visible;
  char          Active;
  char          Transparent;
  char          *Caption;
  TTextAlign    TextAlign;
  TTextAlignVertical TextAlignVertical;
  const char    *FontName;
  unsigned int  Font_Color;
  char          VerticalText;
  char          Gradient;
  char          Gradient_Orientation;
  unsigned int  Gradient_Start_Color;
  unsigned int  Gradient_End_Color;
  unsigned int  Color;
  char          PressColEnabled;
  unsigned int  Press_Color;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TButton;

typedef struct  Button_Round {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  char          Pen_Width;
  unsigned int  Pen_Color;
  char          Visible;
  char          Active;
  char          Transparent;
  char          *Caption;
  TTextAlign    TextAlign;
  TTextAlignVertical TextAlignVertical;
  const char    *FontName;
  unsigned int  Font_Color;
  char          VerticalText;
  char          Gradient;
  char          Gradient_Orientation;
  unsigned int  Gradient_Start_Color;
  unsigned int  Gradient_End_Color;
  unsigned int  Color;
  char          Corner_Radius;
  char          PressColEnabled;
  unsigned int  Press_Color;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TButton_Round;

typedef struct  Label {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  char          *Caption;
  const char    *FontName;
  unsigned int  Font_Color;
  char          VerticalText;
  char          Visible;
  char          Active;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TLabel;

typedef struct  Image {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  const char    *Picture_Name;
  char          Visible;
  char          Active;
  char          Picture_Type;
  char          Picture_Ratio;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TImage;

typedef struct  Box {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  char          Pen_Width;
  unsigned int  Pen_Color;
  char          Visible;
  char          Active;
  char          Transparent;
  char          Gradient;
  char          Gradient_Orientation;
  unsigned int  Gradient_Start_Color;
  unsigned int  Gradient_End_Color;
  unsigned int  Color;
  char          PressColEnabled;
  unsigned int  Press_Color;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TBox;

struct Screen {
  unsigned int           Color;
  unsigned int           Width;
  unsigned int           Height;
  unsigned int           ObjectsCount;
  unsigned int           ButtonsCount;
  TButton                * const code *Buttons;
  unsigned int           Buttons_RoundCount;
  TButton_Round          * const code *Buttons_Round;
  unsigned int           LabelsCount;
  TLabel                 * const code *Labels;
  unsigned int           ImagesCount;
  TImage                 * const code *Images;
  unsigned int           BoxesCount;
  TBox                   * const code *Boxes;
  void          (*OnSwipeLeftPtr)();
  void          (*OnSwipeRightPtr)();
  void          (*OnSwipeUpPtr)();
  void          (*OnSwipeDownPtr)();
  void          (*OnZoomInPtr)();
  void          (*OnZoomOutPtr)();
};

extern   TScreen                Screen1;
extern   TBox                   Box1;
extern   TLabel                 Label1;
extern   TLabel                 Label2;
extern   TImage               Image1;
extern   TImage               Image2;
extern   TButton               Button4;
extern   TButton               Button1;
extern   TLabel                 Label8;
extern   TLabel                 Label9;
extern   TLabel                 Label10;
extern   TLabel                 Label11;
extern   TButton                * const code Screen1_Buttons[2];
extern   TLabel                 * const code Screen1_Labels[6];
extern   TImage                 * const code Screen1_Images[2];
extern   TBox                   * const code Screen1_Boxes[1];

extern   TScreen                Screen2;
extern   TButton               Button2;
extern   TButton_Round          ButtonRound1;
extern   TButton                * const code Screen2_Buttons[1];
extern   TButton_Round          * const code Screen2_Buttons_Round[1];

extern   TScreen                Screen3;
extern   TButton               Button3;
extern   TButton               Button5;
extern   TButton               Button7;
extern   TButton_Round          ButtonRound2;
extern   TButton                * const code Screen3_Buttons[3];
extern   TButton_Round          * const code Screen3_Buttons_Round[1];

extern   TScreen                Screen4;
extern   TLabel                 Label7;
extern   TButton               Button6;
extern   TBox                   Box2;
extern   TBox                   Box3;
extern   TBox                   Box4;
extern   TLabel                 Label4;
extern   TLabel                 Label3;
extern   TLabel                 Label5;
extern   TBox                   Box5;
extern   TLabel                 Label6;
extern   TBox                   Box6;
extern   TButton                * const code Screen4_Buttons[1];
extern   TLabel                 * const code Screen4_Labels[5];
extern   TBox                   * const code Screen4_Boxes[5];


/////////////////////////
// Events Code Declarations
void Button1OnClick();
void Button2OnClick();
void Button3OnClick();
void Button4OnClick();
void Button5OnClick();
void Button6OnClick();
void Button7OnClick();
void ButtonRound1OnClick();
void ButtonRound2OnClick();
/////////////////////////

/////////////////////////////////
// Caption variables Declarations
extern char Box1_Caption[];
extern char Label1_Caption[];
extern char Label2_Caption[];
extern char Image1_Caption[];
extern char Image2_Caption[];
extern char Button4_Caption[];
extern char Button1_Caption[];
extern char Label8_Caption[];
extern char Label9_Caption[];
extern char Label10_Caption[];
extern char Label11_Caption[];
extern char Button2_Caption[];
extern char ButtonRound1_Caption[];
extern char Button3_Caption[];
extern char Button5_Caption[];
extern char Button7_Caption[];
extern char ButtonRound2_Caption[];
extern char Label7_Caption[];
extern char Button6_Caption[];
extern char Box2_Caption[];
extern char Box3_Caption[];
extern char Box4_Caption[];
extern char Label4_Caption[];
extern char Label3_Caption[];
extern char Label5_Caption[];
extern char Box5_Caption[];
extern char Label6_Caption[];
extern char Box6_Caption[];
/////////////////////////////////

void DrawScreen(TScreen *aScreen);
void DrawButton(TButton *aButton);
void DrawRoundButton(TButton_Round *Around_button);
void DrawLabel(TLabel *ALabel);
void DrawImage(TImage *AImage);
void DrawBox(TBox *ABox);
void Check_TP();
void Start_TP();
void Process_TP_Press(unsigned int X, unsigned int Y);
void Process_TP_Up(unsigned int X, unsigned int Y);
void Process_TP_Down(unsigned int X, unsigned int Y);

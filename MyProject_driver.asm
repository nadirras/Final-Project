_Write_to_Data_Lines:
;MyProject_driver.c,46 :: 		void Write_to_Data_Lines(unsigned char _hi, unsigned char _lo) {
; _lo start address is: 4 (R1)
; _hi start address is: 0 (R0)
; _lo end address is: 4 (R1)
; _hi end address is: 0 (R0)
; _hi start address is: 0 (R0)
; _lo start address is: 4 (R1)
;MyProject_driver.c,47 :: 		GPIOE_ODR = (unsigned int) (_lo | (_hi << 8));
LSLS	R2, R0, #8
UXTH	R2, R2
; _hi end address is: 0 (R0)
ORR	R3, R1, R2, LSL #0
UXTH	R3, R3
; _lo end address is: 4 (R1)
MOVW	R2, #lo_addr(GPIOE_ODR+0)
MOVT	R2, #hi_addr(GPIOE_ODR+0)
STR	R3, [R2, #0]
;MyProject_driver.c,48 :: 		}
L_end_Write_to_Data_Lines:
BX	LR
; end of _Write_to_Data_Lines
_Set_Index:
;MyProject_driver.c,50 :: 		void Set_Index(unsigned short index) {
; index start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; index end address is: 0 (R0)
; index start address is: 0 (R0)
;MyProject_driver.c,51 :: 		TFT_RS = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;MyProject_driver.c,52 :: 		Write_to_Data_Lines(0, index);
UXTB	R1, R0
; index end address is: 0 (R0)
MOVS	R0, #0
BL	_Write_to_Data_Lines+0
;MyProject_driver.c,53 :: 		TFT_WR = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;MyProject_driver.c,54 :: 		asm nop;
NOP
;MyProject_driver.c,55 :: 		TFT_WR = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;MyProject_driver.c,56 :: 		}
L_end_Set_Index:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_Index
_Write_Command:
;MyProject_driver.c,58 :: 		void Write_Command(unsigned short cmd) {
; cmd start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; cmd end address is: 0 (R0)
; cmd start address is: 0 (R0)
;MyProject_driver.c,59 :: 		TFT_RS = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;MyProject_driver.c,60 :: 		Write_to_Data_Lines(0, cmd);
UXTB	R1, R0
; cmd end address is: 0 (R0)
MOVS	R0, #0
BL	_Write_to_Data_Lines+0
;MyProject_driver.c,61 :: 		TFT_WR = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;MyProject_driver.c,62 :: 		asm nop;
NOP
;MyProject_driver.c,63 :: 		TFT_WR = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;MyProject_driver.c,64 :: 		}
L_end_Write_Command:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Write_Command
_Write_Data:
;MyProject_driver.c,66 :: 		void Write_Data(unsigned int _data) {
SUB	SP, SP, #8
STR	LR, [SP, #0]
STRH	R0, [SP, #4]
;MyProject_driver.c,67 :: 		TFT_RS = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;MyProject_driver.c,68 :: 		Write_to_Data_Lines(Hi(_data), Lo(_data));
ADD	R3, SP, #4
LDRB	R1, [R3, #0]
UXTB	R2, R1
ADDS	R1, R3, #1
LDRB	R1, [R1, #0]
UXTB	R0, R1
UXTB	R1, R2
BL	_Write_to_Data_Lines+0
;MyProject_driver.c,69 :: 		TFT_WR = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;MyProject_driver.c,70 :: 		asm nop;
NOP
;MyProject_driver.c,71 :: 		TFT_WR = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;MyProject_driver.c,72 :: 		}
L_end_Write_Data:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Write_Data
MyProject_driver_InitializeTouchPanel:
;MyProject_driver.c,74 :: 		static void InitializeTouchPanel() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_driver.c,75 :: 		TFT_Set_Active(Set_Index, Write_Command, Write_Data);
MOVW	R2, #lo_addr(_Write_Data+0)
MOVT	R2, #hi_addr(_Write_Data+0)
MOVW	R1, #lo_addr(_Write_Command+0)
MOVT	R1, #hi_addr(_Write_Command+0)
MOVW	R0, #lo_addr(_Set_Index+0)
MOVT	R0, #hi_addr(_Set_Index+0)
BL	_TFT_Set_Active+0
;MyProject_driver.c,76 :: 		TFT_Init_SSD1963_Board_43(480, 272);
MOVW	R1, #272
MOVW	R0, #480
BL	_TFT_Init_SSD1963_Board_43+0
;MyProject_driver.c,78 :: 		TFT_Set_DBC_SSD1963(255);
MOVS	R0, #255
BL	_TFT_Set_DBC_SSD1963+0
;MyProject_driver.c,80 :: 		PenDown = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;MyProject_driver.c,81 :: 		PressedObject = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PressedObject+0)
MOVT	R0, #hi_addr(_PressedObject+0)
STR	R1, [R0, #0]
;MyProject_driver.c,82 :: 		PressedObjectType = -1;
MOVW	R1, #65535
SXTH	R1, R1
MOVW	R0, #lo_addr(_PressedObjectType+0)
MOVT	R0, #hi_addr(_PressedObjectType+0)
STRH	R1, [R0, #0]
;MyProject_driver.c,83 :: 		}
L_end_InitializeTouchPanel:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of MyProject_driver_InitializeTouchPanel
MyProject_driver_InitializeObjects:
;MyProject_driver.c,228 :: 		static void InitializeObjects() {
;MyProject_driver.c,229 :: 		Screen1.Color                     = 0x4164;
MOVW	R1, #16740
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
STRH	R1, [R0, #0]
;MyProject_driver.c,230 :: 		Screen1.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Screen1+2)
MOVT	R0, #hi_addr(_Screen1+2)
STRH	R1, [R0, #0]
;MyProject_driver.c,231 :: 		Screen1.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Screen1+4)
MOVT	R0, #hi_addr(_Screen1+4)
STRH	R1, [R0, #0]
;MyProject_driver.c,232 :: 		Screen1.ButtonsCount              = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Screen1+8)
MOVT	R0, #hi_addr(_Screen1+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,233 :: 		Screen1.Buttons                   = Screen1_Buttons;
MOVW	R1, #lo_addr(_Screen1_Buttons+0)
MOVT	R1, #hi_addr(_Screen1_Buttons+0)
MOVW	R0, #lo_addr(_Screen1+12)
MOVT	R0, #hi_addr(_Screen1+12)
STR	R1, [R0, #0]
;MyProject_driver.c,234 :: 		Screen1.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+16)
MOVT	R0, #hi_addr(_Screen1+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,235 :: 		Screen1.LabelsCount               = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Screen1+24)
MOVT	R0, #hi_addr(_Screen1+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,236 :: 		Screen1.Labels                    = Screen1_Labels;
MOVW	R1, #lo_addr(_Screen1_Labels+0)
MOVT	R1, #hi_addr(_Screen1_Labels+0)
MOVW	R0, #lo_addr(_Screen1+28)
MOVT	R0, #hi_addr(_Screen1+28)
STR	R1, [R0, #0]
;MyProject_driver.c,237 :: 		Screen1.ImagesCount               = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Screen1+32)
MOVT	R0, #hi_addr(_Screen1+32)
STRH	R1, [R0, #0]
;MyProject_driver.c,238 :: 		Screen1.Images                    = Screen1_Images;
MOVW	R1, #lo_addr(_Screen1_Images+0)
MOVT	R1, #hi_addr(_Screen1_Images+0)
MOVW	R0, #lo_addr(_Screen1+36)
MOVT	R0, #hi_addr(_Screen1+36)
STR	R1, [R0, #0]
;MyProject_driver.c,239 :: 		Screen1.BoxesCount                = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen1+40)
MOVT	R0, #hi_addr(_Screen1+40)
STRH	R1, [R0, #0]
;MyProject_driver.c,240 :: 		Screen1.Boxes                     = Screen1_Boxes;
MOVW	R1, #lo_addr(_Screen1_Boxes+0)
MOVT	R1, #hi_addr(_Screen1_Boxes+0)
MOVW	R0, #lo_addr(_Screen1+44)
MOVT	R0, #hi_addr(_Screen1+44)
STR	R1, [R0, #0]
;MyProject_driver.c,241 :: 		Screen1.ObjectsCount              = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_Screen1+6)
MOVT	R0, #hi_addr(_Screen1+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,242 :: 		Screen1.OnSwipeUpPtr    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+56)
MOVT	R0, #hi_addr(_Screen1+56)
STR	R1, [R0, #0]
;MyProject_driver.c,243 :: 		Screen1.OnSwipeDownPtr  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+60)
MOVT	R0, #hi_addr(_Screen1+60)
STR	R1, [R0, #0]
;MyProject_driver.c,244 :: 		Screen1.OnSwipeLeftPtr  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+48)
MOVT	R0, #hi_addr(_Screen1+48)
STR	R1, [R0, #0]
;MyProject_driver.c,245 :: 		Screen1.OnSwipeRightPtr = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+52)
MOVT	R0, #hi_addr(_Screen1+52)
STR	R1, [R0, #0]
;MyProject_driver.c,246 :: 		Screen1.OnZoomInPtr     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+64)
MOVT	R0, #hi_addr(_Screen1+64)
STR	R1, [R0, #0]
;MyProject_driver.c,247 :: 		Screen1.OnZoomOutPtr    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+68)
MOVT	R0, #hi_addr(_Screen1+68)
STR	R1, [R0, #0]
;MyProject_driver.c,249 :: 		Screen2.Color                     = 0x4164;
MOVW	R1, #16740
MOVW	R0, #lo_addr(_Screen2+0)
MOVT	R0, #hi_addr(_Screen2+0)
STRH	R1, [R0, #0]
;MyProject_driver.c,250 :: 		Screen2.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Screen2+2)
MOVT	R0, #hi_addr(_Screen2+2)
STRH	R1, [R0, #0]
;MyProject_driver.c,251 :: 		Screen2.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Screen2+4)
MOVT	R0, #hi_addr(_Screen2+4)
STRH	R1, [R0, #0]
;MyProject_driver.c,252 :: 		Screen2.ButtonsCount              = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen2+8)
MOVT	R0, #hi_addr(_Screen2+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,253 :: 		Screen2.Buttons                   = Screen2_Buttons;
MOVW	R1, #lo_addr(_Screen2_Buttons+0)
MOVT	R1, #hi_addr(_Screen2_Buttons+0)
MOVW	R0, #lo_addr(_Screen2+12)
MOVT	R0, #hi_addr(_Screen2+12)
STR	R1, [R0, #0]
;MyProject_driver.c,254 :: 		Screen2.Buttons_RoundCount        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen2+16)
MOVT	R0, #hi_addr(_Screen2+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,255 :: 		Screen2.Buttons_Round             = Screen2_Buttons_Round;
MOVW	R1, #lo_addr(_Screen2_Buttons_Round+0)
MOVT	R1, #hi_addr(_Screen2_Buttons_Round+0)
MOVW	R0, #lo_addr(_Screen2+20)
MOVT	R0, #hi_addr(_Screen2+20)
STR	R1, [R0, #0]
;MyProject_driver.c,256 :: 		Screen2.LabelsCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+24)
MOVT	R0, #hi_addr(_Screen2+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,257 :: 		Screen2.ImagesCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+32)
MOVT	R0, #hi_addr(_Screen2+32)
STRH	R1, [R0, #0]
;MyProject_driver.c,258 :: 		Screen2.BoxesCount                = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+40)
MOVT	R0, #hi_addr(_Screen2+40)
STRH	R1, [R0, #0]
;MyProject_driver.c,259 :: 		Screen2.ObjectsCount              = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Screen2+6)
MOVT	R0, #hi_addr(_Screen2+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,260 :: 		Screen2.OnSwipeUpPtr    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+56)
MOVT	R0, #hi_addr(_Screen2+56)
STR	R1, [R0, #0]
;MyProject_driver.c,261 :: 		Screen2.OnSwipeDownPtr  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+60)
MOVT	R0, #hi_addr(_Screen2+60)
STR	R1, [R0, #0]
;MyProject_driver.c,262 :: 		Screen2.OnSwipeLeftPtr  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+48)
MOVT	R0, #hi_addr(_Screen2+48)
STR	R1, [R0, #0]
;MyProject_driver.c,263 :: 		Screen2.OnSwipeRightPtr = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+52)
MOVT	R0, #hi_addr(_Screen2+52)
STR	R1, [R0, #0]
;MyProject_driver.c,264 :: 		Screen2.OnZoomInPtr     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+64)
MOVT	R0, #hi_addr(_Screen2+64)
STR	R1, [R0, #0]
;MyProject_driver.c,265 :: 		Screen2.OnZoomOutPtr    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+68)
MOVT	R0, #hi_addr(_Screen2+68)
STR	R1, [R0, #0]
;MyProject_driver.c,267 :: 		Screen3.Color                     = 0x4164;
MOVW	R1, #16740
MOVW	R0, #lo_addr(_Screen3+0)
MOVT	R0, #hi_addr(_Screen3+0)
STRH	R1, [R0, #0]
;MyProject_driver.c,268 :: 		Screen3.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Screen3+2)
MOVT	R0, #hi_addr(_Screen3+2)
STRH	R1, [R0, #0]
;MyProject_driver.c,269 :: 		Screen3.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Screen3+4)
MOVT	R0, #hi_addr(_Screen3+4)
STRH	R1, [R0, #0]
;MyProject_driver.c,270 :: 		Screen3.ButtonsCount              = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Screen3+8)
MOVT	R0, #hi_addr(_Screen3+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,271 :: 		Screen3.Buttons                   = Screen3_Buttons;
MOVW	R1, #lo_addr(_Screen3_Buttons+0)
MOVT	R1, #hi_addr(_Screen3_Buttons+0)
MOVW	R0, #lo_addr(_Screen3+12)
MOVT	R0, #hi_addr(_Screen3+12)
STR	R1, [R0, #0]
;MyProject_driver.c,272 :: 		Screen3.Buttons_RoundCount        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen3+16)
MOVT	R0, #hi_addr(_Screen3+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,273 :: 		Screen3.Buttons_Round             = Screen3_Buttons_Round;
MOVW	R1, #lo_addr(_Screen3_Buttons_Round+0)
MOVT	R1, #hi_addr(_Screen3_Buttons_Round+0)
MOVW	R0, #lo_addr(_Screen3+20)
MOVT	R0, #hi_addr(_Screen3+20)
STR	R1, [R0, #0]
;MyProject_driver.c,274 :: 		Screen3.LabelsCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen3+24)
MOVT	R0, #hi_addr(_Screen3+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,275 :: 		Screen3.ImagesCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen3+32)
MOVT	R0, #hi_addr(_Screen3+32)
STRH	R1, [R0, #0]
;MyProject_driver.c,276 :: 		Screen3.BoxesCount                = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen3+40)
MOVT	R0, #hi_addr(_Screen3+40)
STRH	R1, [R0, #0]
;MyProject_driver.c,277 :: 		Screen3.ObjectsCount              = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Screen3+6)
MOVT	R0, #hi_addr(_Screen3+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,278 :: 		Screen3.OnSwipeUpPtr    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen3+56)
MOVT	R0, #hi_addr(_Screen3+56)
STR	R1, [R0, #0]
;MyProject_driver.c,279 :: 		Screen3.OnSwipeDownPtr  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen3+60)
MOVT	R0, #hi_addr(_Screen3+60)
STR	R1, [R0, #0]
;MyProject_driver.c,280 :: 		Screen3.OnSwipeLeftPtr  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen3+48)
MOVT	R0, #hi_addr(_Screen3+48)
STR	R1, [R0, #0]
;MyProject_driver.c,281 :: 		Screen3.OnSwipeRightPtr = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen3+52)
MOVT	R0, #hi_addr(_Screen3+52)
STR	R1, [R0, #0]
;MyProject_driver.c,282 :: 		Screen3.OnZoomInPtr     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen3+64)
MOVT	R0, #hi_addr(_Screen3+64)
STR	R1, [R0, #0]
;MyProject_driver.c,283 :: 		Screen3.OnZoomOutPtr    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen3+68)
MOVT	R0, #hi_addr(_Screen3+68)
STR	R1, [R0, #0]
;MyProject_driver.c,285 :: 		Screen4.Color                     = 0x4164;
MOVW	R1, #16740
MOVW	R0, #lo_addr(_Screen4+0)
MOVT	R0, #hi_addr(_Screen4+0)
STRH	R1, [R0, #0]
;MyProject_driver.c,286 :: 		Screen4.Width                     = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Screen4+2)
MOVT	R0, #hi_addr(_Screen4+2)
STRH	R1, [R0, #0]
;MyProject_driver.c,287 :: 		Screen4.Height                    = 272;
MOVW	R1, #272
MOVW	R0, #lo_addr(_Screen4+4)
MOVT	R0, #hi_addr(_Screen4+4)
STRH	R1, [R0, #0]
;MyProject_driver.c,288 :: 		Screen4.ButtonsCount              = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen4+8)
MOVT	R0, #hi_addr(_Screen4+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,289 :: 		Screen4.Buttons                   = Screen4_Buttons;
MOVW	R1, #lo_addr(_Screen4_Buttons+0)
MOVT	R1, #hi_addr(_Screen4_Buttons+0)
MOVW	R0, #lo_addr(_Screen4+12)
MOVT	R0, #hi_addr(_Screen4+12)
STR	R1, [R0, #0]
;MyProject_driver.c,290 :: 		Screen4.Buttons_RoundCount        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen4+16)
MOVT	R0, #hi_addr(_Screen4+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,291 :: 		Screen4.LabelsCount               = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Screen4+24)
MOVT	R0, #hi_addr(_Screen4+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,292 :: 		Screen4.Labels                    = Screen4_Labels;
MOVW	R1, #lo_addr(_Screen4_Labels+0)
MOVT	R1, #hi_addr(_Screen4_Labels+0)
MOVW	R0, #lo_addr(_Screen4+28)
MOVT	R0, #hi_addr(_Screen4+28)
STR	R1, [R0, #0]
;MyProject_driver.c,293 :: 		Screen4.ImagesCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen4+32)
MOVT	R0, #hi_addr(_Screen4+32)
STRH	R1, [R0, #0]
;MyProject_driver.c,294 :: 		Screen4.BoxesCount                = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Screen4+40)
MOVT	R0, #hi_addr(_Screen4+40)
STRH	R1, [R0, #0]
;MyProject_driver.c,295 :: 		Screen4.Boxes                     = Screen4_Boxes;
MOVW	R1, #lo_addr(_Screen4_Boxes+0)
MOVT	R1, #hi_addr(_Screen4_Boxes+0)
MOVW	R0, #lo_addr(_Screen4+44)
MOVT	R0, #hi_addr(_Screen4+44)
STR	R1, [R0, #0]
;MyProject_driver.c,296 :: 		Screen4.ObjectsCount              = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_Screen4+6)
MOVT	R0, #hi_addr(_Screen4+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,297 :: 		Screen4.OnSwipeUpPtr    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen4+56)
MOVT	R0, #hi_addr(_Screen4+56)
STR	R1, [R0, #0]
;MyProject_driver.c,298 :: 		Screen4.OnSwipeDownPtr  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen4+60)
MOVT	R0, #hi_addr(_Screen4+60)
STR	R1, [R0, #0]
;MyProject_driver.c,299 :: 		Screen4.OnSwipeLeftPtr  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen4+48)
MOVT	R0, #hi_addr(_Screen4+48)
STR	R1, [R0, #0]
;MyProject_driver.c,300 :: 		Screen4.OnSwipeRightPtr = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen4+52)
MOVT	R0, #hi_addr(_Screen4+52)
STR	R1, [R0, #0]
;MyProject_driver.c,301 :: 		Screen4.OnZoomInPtr     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen4+64)
MOVT	R0, #hi_addr(_Screen4+64)
STR	R1, [R0, #0]
;MyProject_driver.c,302 :: 		Screen4.OnZoomOutPtr    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen4+68)
MOVT	R0, #hi_addr(_Screen4+68)
STR	R1, [R0, #0]
;MyProject_driver.c,305 :: 		Box1.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Box1+0)
MOVT	R0, #hi_addr(_Box1+0)
STR	R1, [R0, #0]
;MyProject_driver.c,306 :: 		Box1.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box1+4)
MOVT	R0, #hi_addr(_Box1+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,307 :: 		Box1.Left            = 34;
MOVS	R1, #34
MOVW	R0, #lo_addr(_Box1+6)
MOVT	R0, #hi_addr(_Box1+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,308 :: 		Box1.Top             = 51;
MOVS	R1, #51
MOVW	R0, #lo_addr(_Box1+8)
MOVT	R0, #hi_addr(_Box1+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,309 :: 		Box1.Width           = 403;
MOVW	R1, #403
MOVW	R0, #lo_addr(_Box1+10)
MOVT	R0, #hi_addr(_Box1+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,310 :: 		Box1.Height          = 133;
MOVS	R1, #133
MOVW	R0, #lo_addr(_Box1+12)
MOVT	R0, #hi_addr(_Box1+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,311 :: 		Box1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+14)
MOVT	R0, #hi_addr(_Box1+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,312 :: 		Box1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box1+16)
MOVT	R0, #hi_addr(_Box1+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,313 :: 		Box1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+18)
MOVT	R0, #hi_addr(_Box1+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,314 :: 		Box1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+19)
MOVT	R0, #hi_addr(_Box1+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,315 :: 		Box1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+20)
MOVT	R0, #hi_addr(_Box1+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,316 :: 		Box1.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box1+21)
MOVT	R0, #hi_addr(_Box1+21)
STRB	R1, [R0, #0]
;MyProject_driver.c,317 :: 		Box1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box1+22)
MOVT	R0, #hi_addr(_Box1+22)
STRB	R1, [R0, #0]
;MyProject_driver.c,318 :: 		Box1.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box1+24)
MOVT	R0, #hi_addr(_Box1+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,319 :: 		Box1.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box1+26)
MOVT	R0, #hi_addr(_Box1+26)
STRH	R1, [R0, #0]
;MyProject_driver.c,320 :: 		Box1.Color           = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box1+28)
MOVT	R0, #hi_addr(_Box1+28)
STRH	R1, [R0, #0]
;MyProject_driver.c,321 :: 		Box1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+30)
MOVT	R0, #hi_addr(_Box1+30)
STRB	R1, [R0, #0]
;MyProject_driver.c,322 :: 		Box1.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box1+32)
MOVT	R0, #hi_addr(_Box1+32)
STRH	R1, [R0, #0]
;MyProject_driver.c,324 :: 		Label1.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label1+0)
MOVT	R0, #hi_addr(_Label1+0)
STR	R1, [R0, #0]
;MyProject_driver.c,325 :: 		Label1.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label1+4)
MOVT	R0, #hi_addr(_Label1+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,326 :: 		Label1.Left            = 243;
MOVS	R1, #243
MOVW	R0, #lo_addr(_Label1+6)
MOVT	R0, #hi_addr(_Label1+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,327 :: 		Label1.Top             = 76;
MOVS	R1, #76
MOVW	R0, #lo_addr(_Label1+8)
MOVT	R0, #hi_addr(_Label1+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,328 :: 		Label1.Width           = 139;
MOVS	R1, #139
MOVW	R0, #lo_addr(_Label1+10)
MOVT	R0, #hi_addr(_Label1+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,329 :: 		Label1.Height          = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Label1+12)
MOVT	R0, #hi_addr(_Label1+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,330 :: 		Label1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label1+27)
MOVT	R0, #hi_addr(_Label1+27)
STRB	R1, [R0, #0]
;MyProject_driver.c,331 :: 		Label1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label1+28)
MOVT	R0, #hi_addr(_Label1+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,332 :: 		Label1.Caption         = Label1_Caption;
MOVW	R1, #lo_addr(_Label1_Caption+0)
MOVT	R1, #hi_addr(_Label1_Caption+0)
MOVW	R0, #lo_addr(_Label1+16)
MOVT	R0, #hi_addr(_Label1+16)
STR	R1, [R0, #0]
;MyProject_driver.c,333 :: 		Label1.FontName        = Tahoma11x13_Regular;
MOVW	R3, #lo_addr(_Tahoma11x13_Regular+0)
MOVT	R3, #hi_addr(_Tahoma11x13_Regular+0)
MOVW	R0, #lo_addr(_Label1+20)
MOVT	R0, #hi_addr(_Label1+20)
STR	R3, [R0, #0]
;MyProject_driver.c,334 :: 		Label1.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label1+24)
MOVT	R0, #hi_addr(_Label1+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,335 :: 		Label1.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+26)
MOVT	R0, #hi_addr(_Label1+26)
STRB	R1, [R0, #0]
;MyProject_driver.c,337 :: 		Label2.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label2+0)
MOVT	R0, #hi_addr(_Label2+0)
STR	R1, [R0, #0]
;MyProject_driver.c,338 :: 		Label2.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label2+4)
MOVT	R0, #hi_addr(_Label2+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,339 :: 		Label2.Left            = 243;
MOVS	R1, #243
MOVW	R0, #lo_addr(_Label2+6)
MOVT	R0, #hi_addr(_Label2+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,340 :: 		Label2.Top             = 95;
MOVS	R1, #95
MOVW	R0, #lo_addr(_Label2+8)
MOVT	R0, #hi_addr(_Label2+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,341 :: 		Label2.Width           = 90;
MOVS	R1, #90
MOVW	R0, #lo_addr(_Label2+10)
MOVT	R0, #hi_addr(_Label2+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,342 :: 		Label2.Height          = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Label2+12)
MOVT	R0, #hi_addr(_Label2+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,343 :: 		Label2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label2+27)
MOVT	R0, #hi_addr(_Label2+27)
STRB	R1, [R0, #0]
;MyProject_driver.c,344 :: 		Label2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label2+28)
MOVT	R0, #hi_addr(_Label2+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,345 :: 		Label2.Caption         = Label2_Caption;
MOVW	R1, #lo_addr(_Label2_Caption+0)
MOVT	R1, #hi_addr(_Label2_Caption+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
STR	R1, [R0, #0]
;MyProject_driver.c,346 :: 		Label2.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_Label2+20)
MOVT	R0, #hi_addr(_Label2+20)
STR	R3, [R0, #0]
;MyProject_driver.c,347 :: 		Label2.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,348 :: 		Label2.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+26)
MOVT	R0, #hi_addr(_Label2+26)
STRB	R1, [R0, #0]
;MyProject_driver.c,350 :: 		Image1.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Image1+0)
MOVT	R0, #hi_addr(_Image1+0)
STR	R1, [R0, #0]
;MyProject_driver.c,351 :: 		Image1.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Image1+4)
MOVT	R0, #hi_addr(_Image1+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,352 :: 		Image1.Left            = 150;
MOVS	R1, #150
MOVW	R0, #lo_addr(_Image1+6)
MOVT	R0, #hi_addr(_Image1+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,353 :: 		Image1.Top             = 77;
MOVS	R1, #77
MOVW	R0, #lo_addr(_Image1+8)
MOVT	R0, #hi_addr(_Image1+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,354 :: 		Image1.Width           = 74;
MOVS	R1, #74
MOVW	R0, #lo_addr(_Image1+10)
MOVT	R0, #hi_addr(_Image1+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,355 :: 		Image1.Height          = 78;
MOVS	R1, #78
MOVW	R0, #lo_addr(_Image1+12)
MOVT	R0, #hi_addr(_Image1+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,356 :: 		Image1.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image1+22)
MOVT	R0, #hi_addr(_Image1+22)
STRB	R1, [R0, #0]
;MyProject_driver.c,357 :: 		Image1.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+23)
MOVT	R0, #hi_addr(_Image1+23)
STRB	R1, [R0, #0]
;MyProject_driver.c,358 :: 		Image1.Picture_Name    = bme_logo_bmp;
MOVW	R1, #lo_addr(_bme_logo_bmp+0)
MOVT	R1, #hi_addr(_bme_logo_bmp+0)
MOVW	R0, #lo_addr(_Image1+16)
MOVT	R0, #hi_addr(_Image1+16)
STR	R1, [R0, #0]
;MyProject_driver.c,359 :: 		Image1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+20)
MOVT	R0, #hi_addr(_Image1+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,360 :: 		Image1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+21)
MOVT	R0, #hi_addr(_Image1+21)
STRB	R1, [R0, #0]
;MyProject_driver.c,362 :: 		Image2.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Image2+0)
MOVT	R0, #hi_addr(_Image2+0)
STR	R1, [R0, #0]
;MyProject_driver.c,363 :: 		Image2.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Image2+4)
MOVT	R0, #hi_addr(_Image2+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,364 :: 		Image2.Left            = 55;
MOVS	R1, #55
MOVW	R0, #lo_addr(_Image2+6)
MOVT	R0, #hi_addr(_Image2+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,365 :: 		Image2.Top             = 76;
MOVS	R1, #76
MOVW	R0, #lo_addr(_Image2+8)
MOVT	R0, #hi_addr(_Image2+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,366 :: 		Image2.Width           = 78;
MOVS	R1, #78
MOVW	R0, #lo_addr(_Image2+10)
MOVT	R0, #hi_addr(_Image2+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,367 :: 		Image2.Height          = 78;
MOVS	R1, #78
MOVW	R0, #lo_addr(_Image2+12)
MOVT	R0, #hi_addr(_Image2+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,368 :: 		Image2.Picture_Type    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Image2+22)
MOVT	R0, #hi_addr(_Image2+22)
STRB	R1, [R0, #0]
;MyProject_driver.c,369 :: 		Image2.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image2+23)
MOVT	R0, #hi_addr(_Image2+23)
STRB	R1, [R0, #0]
;MyProject_driver.c,370 :: 		Image2.Picture_Name    = Badge_ITS2_bmp;
MOVW	R1, #lo_addr(_Badge_ITS2_bmp+0)
MOVT	R1, #hi_addr(_Badge_ITS2_bmp+0)
MOVW	R0, #lo_addr(_Image2+16)
MOVT	R0, #hi_addr(_Image2+16)
STR	R1, [R0, #0]
;MyProject_driver.c,371 :: 		Image2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image2+20)
MOVT	R0, #hi_addr(_Image2+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,372 :: 		Image2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image2+21)
MOVT	R0, #hi_addr(_Image2+21)
STRB	R1, [R0, #0]
;MyProject_driver.c,374 :: 		Button4.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Button4+0)
MOVT	R0, #hi_addr(_Button4+0)
STR	R1, [R0, #0]
;MyProject_driver.c,375 :: 		Button4.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Button4+4)
MOVT	R0, #hi_addr(_Button4+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,376 :: 		Button4.Left            = 177;
MOVS	R1, #177
MOVW	R0, #lo_addr(_Button4+6)
MOVT	R0, #hi_addr(_Button4+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,377 :: 		Button4.Top             = 222;
MOVS	R1, #222
MOVW	R0, #lo_addr(_Button4+8)
MOVT	R0, #hi_addr(_Button4+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,378 :: 		Button4.Width           = 122;
MOVS	R1, #122
MOVW	R0, #lo_addr(_Button4+10)
MOVT	R0, #hi_addr(_Button4+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,379 :: 		Button4.Height          = 28;
MOVS	R1, #28
MOVW	R0, #lo_addr(_Button4+12)
MOVT	R0, #hi_addr(_Button4+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,380 :: 		Button4.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button4+14)
MOVT	R0, #hi_addr(_Button4+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,381 :: 		Button4.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button4+16)
MOVT	R0, #hi_addr(_Button4+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,382 :: 		Button4.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button4+18)
MOVT	R0, #hi_addr(_Button4+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,383 :: 		Button4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button4+19)
MOVT	R0, #hi_addr(_Button4+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,384 :: 		Button4.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button4+20)
MOVT	R0, #hi_addr(_Button4+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,385 :: 		Button4.Caption         = Button4_Caption;
MOVW	R1, #lo_addr(_Button4_Caption+0)
MOVT	R1, #hi_addr(_Button4_Caption+0)
MOVW	R0, #lo_addr(_Button4+24)
MOVT	R0, #hi_addr(_Button4+24)
STR	R1, [R0, #0]
;MyProject_driver.c,386 :: 		Button4.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button4+28)
MOVT	R0, #hi_addr(_Button4+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,387 :: 		Button4.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button4+29)
MOVT	R0, #hi_addr(_Button4+29)
STRB	R1, [R0, #0]
;MyProject_driver.c,388 :: 		Button4.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_Button4+32)
MOVT	R0, #hi_addr(_Button4+32)
STR	R3, [R0, #0]
;MyProject_driver.c,389 :: 		Button4.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button4+48)
MOVT	R0, #hi_addr(_Button4+48)
STRB	R1, [R0, #0]
;MyProject_driver.c,390 :: 		Button4.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button4+36)
MOVT	R0, #hi_addr(_Button4+36)
STRH	R1, [R0, #0]
;MyProject_driver.c,391 :: 		Button4.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button4+38)
MOVT	R0, #hi_addr(_Button4+38)
STRB	R1, [R0, #0]
;MyProject_driver.c,392 :: 		Button4.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button4+39)
MOVT	R0, #hi_addr(_Button4+39)
STRB	R1, [R0, #0]
;MyProject_driver.c,393 :: 		Button4.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button4+40)
MOVT	R0, #hi_addr(_Button4+40)
STRB	R1, [R0, #0]
;MyProject_driver.c,394 :: 		Button4.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button4+42)
MOVT	R0, #hi_addr(_Button4+42)
STRH	R1, [R0, #0]
;MyProject_driver.c,395 :: 		Button4.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button4+44)
MOVT	R0, #hi_addr(_Button4+44)
STRH	R1, [R0, #0]
;MyProject_driver.c,396 :: 		Button4.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button4+46)
MOVT	R0, #hi_addr(_Button4+46)
STRH	R1, [R0, #0]
;MyProject_driver.c,397 :: 		Button4.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button4+50)
MOVT	R0, #hi_addr(_Button4+50)
STRH	R1, [R0, #0]
;MyProject_driver.c,398 :: 		Button4.OnClickPtr      = Button4OnClick;
MOVW	R1, #lo_addr(_Button4OnClick+0)
MOVT	R1, #hi_addr(_Button4OnClick+0)
MOVW	R0, #lo_addr(_Button4+60)
MOVT	R0, #hi_addr(_Button4+60)
STR	R1, [R0, #0]
;MyProject_driver.c,400 :: 		Button1.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Button1+0)
MOVT	R0, #hi_addr(_Button1+0)
STR	R1, [R0, #0]
;MyProject_driver.c,401 :: 		Button1.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Button1+4)
MOVT	R0, #hi_addr(_Button1+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,402 :: 		Button1.Left            = 335;
MOVW	R1, #335
MOVW	R0, #lo_addr(_Button1+6)
MOVT	R0, #hi_addr(_Button1+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,403 :: 		Button1.Top             = 222;
MOVS	R1, #222
MOVW	R0, #lo_addr(_Button1+8)
MOVT	R0, #hi_addr(_Button1+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,404 :: 		Button1.Width           = 111;
MOVS	R1, #111
MOVW	R0, #lo_addr(_Button1+10)
MOVT	R0, #hi_addr(_Button1+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,405 :: 		Button1.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Button1+12)
MOVT	R0, #hi_addr(_Button1+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,406 :: 		Button1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button1+14)
MOVT	R0, #hi_addr(_Button1+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,407 :: 		Button1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button1+16)
MOVT	R0, #hi_addr(_Button1+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,408 :: 		Button1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button1+18)
MOVT	R0, #hi_addr(_Button1+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,409 :: 		Button1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button1+19)
MOVT	R0, #hi_addr(_Button1+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,410 :: 		Button1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button1+20)
MOVT	R0, #hi_addr(_Button1+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,411 :: 		Button1.Caption         = Button1_Caption;
MOVW	R1, #lo_addr(_Button1_Caption+0)
MOVT	R1, #hi_addr(_Button1_Caption+0)
MOVW	R0, #lo_addr(_Button1+24)
MOVT	R0, #hi_addr(_Button1+24)
STR	R1, [R0, #0]
;MyProject_driver.c,412 :: 		Button1.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button1+28)
MOVT	R0, #hi_addr(_Button1+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,413 :: 		Button1.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button1+29)
MOVT	R0, #hi_addr(_Button1+29)
STRB	R1, [R0, #0]
;MyProject_driver.c,414 :: 		Button1.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_Button1+32)
MOVT	R0, #hi_addr(_Button1+32)
STR	R3, [R0, #0]
;MyProject_driver.c,415 :: 		Button1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button1+48)
MOVT	R0, #hi_addr(_Button1+48)
STRB	R1, [R0, #0]
;MyProject_driver.c,416 :: 		Button1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button1+36)
MOVT	R0, #hi_addr(_Button1+36)
STRH	R1, [R0, #0]
;MyProject_driver.c,417 :: 		Button1.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button1+38)
MOVT	R0, #hi_addr(_Button1+38)
STRB	R1, [R0, #0]
;MyProject_driver.c,418 :: 		Button1.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button1+39)
MOVT	R0, #hi_addr(_Button1+39)
STRB	R1, [R0, #0]
;MyProject_driver.c,419 :: 		Button1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button1+40)
MOVT	R0, #hi_addr(_Button1+40)
STRB	R1, [R0, #0]
;MyProject_driver.c,420 :: 		Button1.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button1+42)
MOVT	R0, #hi_addr(_Button1+42)
STRH	R1, [R0, #0]
;MyProject_driver.c,421 :: 		Button1.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button1+44)
MOVT	R0, #hi_addr(_Button1+44)
STRH	R1, [R0, #0]
;MyProject_driver.c,422 :: 		Button1.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button1+46)
MOVT	R0, #hi_addr(_Button1+46)
STRH	R1, [R0, #0]
;MyProject_driver.c,423 :: 		Button1.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button1+50)
MOVT	R0, #hi_addr(_Button1+50)
STRH	R1, [R0, #0]
;MyProject_driver.c,424 :: 		Button1.OnClickPtr      = Button1OnClick;
MOVW	R1, #lo_addr(_Button1OnClick+0)
MOVT	R1, #hi_addr(_Button1OnClick+0)
MOVW	R0, #lo_addr(_Button1+60)
MOVT	R0, #hi_addr(_Button1+60)
STR	R1, [R0, #0]
;MyProject_driver.c,426 :: 		Label8.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label8+0)
MOVT	R0, #hi_addr(_Label8+0)
STR	R1, [R0, #0]
;MyProject_driver.c,427 :: 		Label8.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label8+4)
MOVT	R0, #hi_addr(_Label8+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,428 :: 		Label8.Left            = 273;
MOVW	R1, #273
MOVW	R0, #lo_addr(_Label8+6)
MOVT	R0, #hi_addr(_Label8+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,429 :: 		Label8.Top             = 124;
MOVS	R1, #124
MOVW	R0, #lo_addr(_Label8+8)
MOVT	R0, #hi_addr(_Label8+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,430 :: 		Label8.Width           = 133;
MOVS	R1, #133
MOVW	R0, #lo_addr(_Label8+10)
MOVT	R0, #hi_addr(_Label8+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,431 :: 		Label8.Height          = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Label8+12)
MOVT	R0, #hi_addr(_Label8+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,432 :: 		Label8.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label8+27)
MOVT	R0, #hi_addr(_Label8+27)
STRB	R1, [R0, #0]
;MyProject_driver.c,433 :: 		Label8.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label8+28)
MOVT	R0, #hi_addr(_Label8+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,434 :: 		Label8.Caption         = Label8_Caption;
MOVW	R1, #lo_addr(_Label8_Caption+0)
MOVT	R1, #hi_addr(_Label8_Caption+0)
MOVW	R0, #lo_addr(_Label8+16)
MOVT	R0, #hi_addr(_Label8+16)
STR	R1, [R0, #0]
;MyProject_driver.c,435 :: 		Label8.FontName        = Tahoma10x11_Regular;
MOVW	R2, #lo_addr(_Tahoma10x11_Regular+0)
MOVT	R2, #hi_addr(_Tahoma10x11_Regular+0)
MOVW	R0, #lo_addr(_Label8+20)
MOVT	R0, #hi_addr(_Label8+20)
STR	R2, [R0, #0]
;MyProject_driver.c,436 :: 		Label8.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label8+24)
MOVT	R0, #hi_addr(_Label8+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,437 :: 		Label8.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label8+26)
MOVT	R0, #hi_addr(_Label8+26)
STRB	R1, [R0, #0]
;MyProject_driver.c,439 :: 		Label9.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label9+0)
MOVT	R0, #hi_addr(_Label9+0)
STR	R1, [R0, #0]
;MyProject_driver.c,440 :: 		Label9.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Label9+4)
MOVT	R0, #hi_addr(_Label9+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,441 :: 		Label9.Left            = 234;
MOVS	R1, #234
MOVW	R0, #lo_addr(_Label9+6)
MOVT	R0, #hi_addr(_Label9+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,442 :: 		Label9.Top             = 137;
MOVS	R1, #137
MOVW	R0, #lo_addr(_Label9+8)
MOVT	R0, #hi_addr(_Label9+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,443 :: 		Label9.Width           = 178;
MOVS	R1, #178
MOVW	R0, #lo_addr(_Label9+10)
MOVT	R0, #hi_addr(_Label9+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,444 :: 		Label9.Height          = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Label9+12)
MOVT	R0, #hi_addr(_Label9+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,445 :: 		Label9.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label9+27)
MOVT	R0, #hi_addr(_Label9+27)
STRB	R1, [R0, #0]
;MyProject_driver.c,446 :: 		Label9.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label9+28)
MOVT	R0, #hi_addr(_Label9+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,447 :: 		Label9.Caption         = Label9_Caption;
MOVW	R1, #lo_addr(_Label9_Caption+0)
MOVT	R1, #hi_addr(_Label9_Caption+0)
MOVW	R0, #lo_addr(_Label9+16)
MOVT	R0, #hi_addr(_Label9+16)
STR	R1, [R0, #0]
;MyProject_driver.c,448 :: 		Label9.FontName        = Tahoma10x11_Regular;
MOVW	R0, #lo_addr(_Label9+20)
MOVT	R0, #hi_addr(_Label9+20)
STR	R2, [R0, #0]
;MyProject_driver.c,449 :: 		Label9.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label9+24)
MOVT	R0, #hi_addr(_Label9+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,450 :: 		Label9.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label9+26)
MOVT	R0, #hi_addr(_Label9+26)
STRB	R1, [R0, #0]
;MyProject_driver.c,452 :: 		Label10.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label10+0)
MOVT	R0, #hi_addr(_Label10+0)
STR	R1, [R0, #0]
;MyProject_driver.c,453 :: 		Label10.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Label10+4)
MOVT	R0, #hi_addr(_Label10+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,454 :: 		Label10.Left            = 245;
MOVS	R1, #245
MOVW	R0, #lo_addr(_Label10+6)
MOVT	R0, #hi_addr(_Label10+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,455 :: 		Label10.Top             = 152;
MOVS	R1, #152
MOVW	R0, #lo_addr(_Label10+8)
MOVT	R0, #hi_addr(_Label10+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,456 :: 		Label10.Width           = 165;
MOVS	R1, #165
MOVW	R0, #lo_addr(_Label10+10)
MOVT	R0, #hi_addr(_Label10+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,457 :: 		Label10.Height          = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Label10+12)
MOVT	R0, #hi_addr(_Label10+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,458 :: 		Label10.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label10+27)
MOVT	R0, #hi_addr(_Label10+27)
STRB	R1, [R0, #0]
;MyProject_driver.c,459 :: 		Label10.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label10+28)
MOVT	R0, #hi_addr(_Label10+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,460 :: 		Label10.Caption         = Label10_Caption;
MOVW	R1, #lo_addr(_Label10_Caption+0)
MOVT	R1, #hi_addr(_Label10_Caption+0)
MOVW	R0, #lo_addr(_Label10+16)
MOVT	R0, #hi_addr(_Label10+16)
STR	R1, [R0, #0]
;MyProject_driver.c,461 :: 		Label10.FontName        = Tahoma10x11_Regular;
MOVW	R0, #lo_addr(_Label10+20)
MOVT	R0, #hi_addr(_Label10+20)
STR	R2, [R0, #0]
;MyProject_driver.c,462 :: 		Label10.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label10+24)
MOVT	R0, #hi_addr(_Label10+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,463 :: 		Label10.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label10+26)
MOVT	R0, #hi_addr(_Label10+26)
STRB	R1, [R0, #0]
;MyProject_driver.c,465 :: 		Label11.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label11+0)
MOVT	R0, #hi_addr(_Label11+0)
STR	R1, [R0, #0]
;MyProject_driver.c,466 :: 		Label11.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Label11+4)
MOVT	R0, #hi_addr(_Label11+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,467 :: 		Label11.Left            = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Label11+6)
MOVT	R0, #hi_addr(_Label11+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,468 :: 		Label11.Top             = 167;
MOVS	R1, #167
MOVW	R0, #lo_addr(_Label11+8)
MOVT	R0, #hi_addr(_Label11+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,469 :: 		Label11.Width           = 92;
MOVS	R1, #92
MOVW	R0, #lo_addr(_Label11+10)
MOVT	R0, #hi_addr(_Label11+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,470 :: 		Label11.Height          = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Label11+12)
MOVT	R0, #hi_addr(_Label11+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,471 :: 		Label11.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label11+27)
MOVT	R0, #hi_addr(_Label11+27)
STRB	R1, [R0, #0]
;MyProject_driver.c,472 :: 		Label11.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label11+28)
MOVT	R0, #hi_addr(_Label11+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,473 :: 		Label11.Caption         = Label11_Caption;
MOVW	R1, #lo_addr(_Label11_Caption+0)
MOVT	R1, #hi_addr(_Label11_Caption+0)
MOVW	R0, #lo_addr(_Label11+16)
MOVT	R0, #hi_addr(_Label11+16)
STR	R1, [R0, #0]
;MyProject_driver.c,474 :: 		Label11.FontName        = Tahoma10x11_Regular;
MOVW	R0, #lo_addr(_Label11+20)
MOVT	R0, #hi_addr(_Label11+20)
STR	R2, [R0, #0]
;MyProject_driver.c,475 :: 		Label11.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label11+24)
MOVT	R0, #hi_addr(_Label11+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,476 :: 		Label11.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label11+26)
MOVT	R0, #hi_addr(_Label11+26)
STRB	R1, [R0, #0]
;MyProject_driver.c,478 :: 		Button2.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_Button2+0)
MOVT	R0, #hi_addr(_Button2+0)
STR	R1, [R0, #0]
;MyProject_driver.c,479 :: 		Button2.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button2+4)
MOVT	R0, #hi_addr(_Button2+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,480 :: 		Button2.Left            = 326;
MOVW	R1, #326
MOVW	R0, #lo_addr(_Button2+6)
MOVT	R0, #hi_addr(_Button2+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,481 :: 		Button2.Top             = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Button2+8)
MOVT	R0, #hi_addr(_Button2+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,482 :: 		Button2.Width           = 139;
MOVS	R1, #139
MOVW	R0, #lo_addr(_Button2+10)
MOVT	R0, #hi_addr(_Button2+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,483 :: 		Button2.Height          = 30;
MOVS	R1, #30
MOVW	R0, #lo_addr(_Button2+12)
MOVT	R0, #hi_addr(_Button2+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,484 :: 		Button2.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button2+14)
MOVT	R0, #hi_addr(_Button2+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,485 :: 		Button2.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button2+16)
MOVT	R0, #hi_addr(_Button2+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,486 :: 		Button2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button2+18)
MOVT	R0, #hi_addr(_Button2+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,487 :: 		Button2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button2+19)
MOVT	R0, #hi_addr(_Button2+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,488 :: 		Button2.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button2+20)
MOVT	R0, #hi_addr(_Button2+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,489 :: 		Button2.Caption         = Button2_Caption;
MOVW	R1, #lo_addr(_Button2_Caption+0)
MOVT	R1, #hi_addr(_Button2_Caption+0)
MOVW	R0, #lo_addr(_Button2+24)
MOVT	R0, #hi_addr(_Button2+24)
STR	R1, [R0, #0]
;MyProject_driver.c,490 :: 		Button2.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button2+28)
MOVT	R0, #hi_addr(_Button2+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,491 :: 		Button2.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button2+29)
MOVT	R0, #hi_addr(_Button2+29)
STRB	R1, [R0, #0]
;MyProject_driver.c,492 :: 		Button2.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_Button2+32)
MOVT	R0, #hi_addr(_Button2+32)
STR	R3, [R0, #0]
;MyProject_driver.c,493 :: 		Button2.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button2+48)
MOVT	R0, #hi_addr(_Button2+48)
STRB	R1, [R0, #0]
;MyProject_driver.c,494 :: 		Button2.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button2+36)
MOVT	R0, #hi_addr(_Button2+36)
STRH	R1, [R0, #0]
;MyProject_driver.c,495 :: 		Button2.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button2+38)
MOVT	R0, #hi_addr(_Button2+38)
STRB	R1, [R0, #0]
;MyProject_driver.c,496 :: 		Button2.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button2+39)
MOVT	R0, #hi_addr(_Button2+39)
STRB	R1, [R0, #0]
;MyProject_driver.c,497 :: 		Button2.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button2+40)
MOVT	R0, #hi_addr(_Button2+40)
STRB	R1, [R0, #0]
;MyProject_driver.c,498 :: 		Button2.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button2+42)
MOVT	R0, #hi_addr(_Button2+42)
STRH	R1, [R0, #0]
;MyProject_driver.c,499 :: 		Button2.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button2+44)
MOVT	R0, #hi_addr(_Button2+44)
STRH	R1, [R0, #0]
;MyProject_driver.c,500 :: 		Button2.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button2+46)
MOVT	R0, #hi_addr(_Button2+46)
STRH	R1, [R0, #0]
;MyProject_driver.c,501 :: 		Button2.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button2+50)
MOVT	R0, #hi_addr(_Button2+50)
STRH	R1, [R0, #0]
;MyProject_driver.c,502 :: 		Button2.OnClickPtr      = Button2OnClick;
MOVW	R1, #lo_addr(_Button2OnClick+0)
MOVT	R1, #hi_addr(_Button2OnClick+0)
MOVW	R0, #lo_addr(_Button2+60)
MOVT	R0, #hi_addr(_Button2+60)
STR	R1, [R0, #0]
;MyProject_driver.c,504 :: 		ButtonRound1.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_ButtonRound1+0)
MOVT	R0, #hi_addr(_ButtonRound1+0)
STR	R1, [R0, #0]
;MyProject_driver.c,505 :: 		ButtonRound1.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+4)
MOVT	R0, #hi_addr(_ButtonRound1+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,506 :: 		ButtonRound1.Left            = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_ButtonRound1+6)
MOVT	R0, #hi_addr(_ButtonRound1+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,507 :: 		ButtonRound1.Top             = 18;
MOVS	R1, #18
MOVW	R0, #lo_addr(_ButtonRound1+8)
MOVT	R0, #hi_addr(_ButtonRound1+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,508 :: 		ButtonRound1.Width           = 48;
MOVS	R1, #48
MOVW	R0, #lo_addr(_ButtonRound1+10)
MOVT	R0, #hi_addr(_ButtonRound1+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,509 :: 		ButtonRound1.Height          = 31;
MOVS	R1, #31
MOVW	R0, #lo_addr(_ButtonRound1+12)
MOVT	R0, #hi_addr(_ButtonRound1+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,510 :: 		ButtonRound1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+14)
MOVT	R0, #hi_addr(_ButtonRound1+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,511 :: 		ButtonRound1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+16)
MOVT	R0, #hi_addr(_ButtonRound1+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,512 :: 		ButtonRound1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+18)
MOVT	R0, #hi_addr(_ButtonRound1+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,513 :: 		ButtonRound1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+19)
MOVT	R0, #hi_addr(_ButtonRound1+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,514 :: 		ButtonRound1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+20)
MOVT	R0, #hi_addr(_ButtonRound1+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,515 :: 		ButtonRound1.Caption         = ButtonRound1_Caption;
MOVW	R1, #lo_addr(_ButtonRound1_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound1_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound1+24)
MOVT	R0, #hi_addr(_ButtonRound1+24)
STR	R1, [R0, #0]
;MyProject_driver.c,516 :: 		ButtonRound1.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+28)
MOVT	R0, #hi_addr(_ButtonRound1+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,517 :: 		ButtonRound1.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+29)
MOVT	R0, #hi_addr(_ButtonRound1+29)
STRB	R1, [R0, #0]
;MyProject_driver.c,518 :: 		ButtonRound1.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_ButtonRound1+32)
MOVT	R0, #hi_addr(_ButtonRound1+32)
STR	R3, [R0, #0]
;MyProject_driver.c,519 :: 		ButtonRound1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+49)
MOVT	R0, #hi_addr(_ButtonRound1+49)
STRB	R1, [R0, #0]
;MyProject_driver.c,520 :: 		ButtonRound1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+36)
MOVT	R0, #hi_addr(_ButtonRound1+36)
STRH	R1, [R0, #0]
;MyProject_driver.c,521 :: 		ButtonRound1.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+38)
MOVT	R0, #hi_addr(_ButtonRound1+38)
STRB	R1, [R0, #0]
;MyProject_driver.c,522 :: 		ButtonRound1.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+39)
MOVT	R0, #hi_addr(_ButtonRound1+39)
STRB	R1, [R0, #0]
;MyProject_driver.c,523 :: 		ButtonRound1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+40)
MOVT	R0, #hi_addr(_ButtonRound1+40)
STRB	R1, [R0, #0]
;MyProject_driver.c,524 :: 		ButtonRound1.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound1+42)
MOVT	R0, #hi_addr(_ButtonRound1+42)
STRH	R1, [R0, #0]
;MyProject_driver.c,525 :: 		ButtonRound1.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound1+44)
MOVT	R0, #hi_addr(_ButtonRound1+44)
STRH	R1, [R0, #0]
;MyProject_driver.c,526 :: 		ButtonRound1.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound1+46)
MOVT	R0, #hi_addr(_ButtonRound1+46)
STRH	R1, [R0, #0]
;MyProject_driver.c,527 :: 		ButtonRound1.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound1+50)
MOVT	R0, #hi_addr(_ButtonRound1+50)
STRH	R1, [R0, #0]
;MyProject_driver.c,528 :: 		ButtonRound1.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound1+48)
MOVT	R0, #hi_addr(_ButtonRound1+48)
STRB	R1, [R0, #0]
;MyProject_driver.c,529 :: 		ButtonRound1.OnClickPtr      = ButtonRound1OnClick;
MOVW	R1, #lo_addr(_ButtonRound1OnClick+0)
MOVT	R1, #hi_addr(_ButtonRound1OnClick+0)
MOVW	R0, #lo_addr(_ButtonRound1+60)
MOVT	R0, #hi_addr(_ButtonRound1+60)
STR	R1, [R0, #0]
;MyProject_driver.c,531 :: 		Button3.OwnerScreen     = &Screen3;
MOVW	R1, #lo_addr(_Screen3+0)
MOVT	R1, #hi_addr(_Screen3+0)
MOVW	R0, #lo_addr(_Button3+0)
MOVT	R0, #hi_addr(_Button3+0)
STR	R1, [R0, #0]
;MyProject_driver.c,532 :: 		Button3.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button3+4)
MOVT	R0, #hi_addr(_Button3+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,533 :: 		Button3.Left            = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Button3+6)
MOVT	R0, #hi_addr(_Button3+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,534 :: 		Button3.Top             = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Button3+8)
MOVT	R0, #hi_addr(_Button3+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,535 :: 		Button3.Width           = 138;
MOVS	R1, #138
MOVW	R0, #lo_addr(_Button3+10)
MOVT	R0, #hi_addr(_Button3+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,536 :: 		Button3.Height          = 28;
MOVS	R1, #28
MOVW	R0, #lo_addr(_Button3+12)
MOVT	R0, #hi_addr(_Button3+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,537 :: 		Button3.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button3+14)
MOVT	R0, #hi_addr(_Button3+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,538 :: 		Button3.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button3+16)
MOVT	R0, #hi_addr(_Button3+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,539 :: 		Button3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button3+18)
MOVT	R0, #hi_addr(_Button3+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,540 :: 		Button3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button3+19)
MOVT	R0, #hi_addr(_Button3+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,541 :: 		Button3.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button3+20)
MOVT	R0, #hi_addr(_Button3+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,542 :: 		Button3.Caption         = Button3_Caption;
MOVW	R1, #lo_addr(_Button3_Caption+0)
MOVT	R1, #hi_addr(_Button3_Caption+0)
MOVW	R0, #lo_addr(_Button3+24)
MOVT	R0, #hi_addr(_Button3+24)
STR	R1, [R0, #0]
;MyProject_driver.c,543 :: 		Button3.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button3+28)
MOVT	R0, #hi_addr(_Button3+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,544 :: 		Button3.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button3+29)
MOVT	R0, #hi_addr(_Button3+29)
STRB	R1, [R0, #0]
;MyProject_driver.c,545 :: 		Button3.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_Button3+32)
MOVT	R0, #hi_addr(_Button3+32)
STR	R3, [R0, #0]
;MyProject_driver.c,546 :: 		Button3.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button3+48)
MOVT	R0, #hi_addr(_Button3+48)
STRB	R1, [R0, #0]
;MyProject_driver.c,547 :: 		Button3.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button3+36)
MOVT	R0, #hi_addr(_Button3+36)
STRH	R1, [R0, #0]
;MyProject_driver.c,548 :: 		Button3.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button3+38)
MOVT	R0, #hi_addr(_Button3+38)
STRB	R1, [R0, #0]
;MyProject_driver.c,549 :: 		Button3.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button3+39)
MOVT	R0, #hi_addr(_Button3+39)
STRB	R1, [R0, #0]
;MyProject_driver.c,550 :: 		Button3.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button3+40)
MOVT	R0, #hi_addr(_Button3+40)
STRB	R1, [R0, #0]
;MyProject_driver.c,551 :: 		Button3.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button3+42)
MOVT	R0, #hi_addr(_Button3+42)
STRH	R1, [R0, #0]
;MyProject_driver.c,552 :: 		Button3.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button3+44)
MOVT	R0, #hi_addr(_Button3+44)
STRH	R1, [R0, #0]
;MyProject_driver.c,553 :: 		Button3.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button3+46)
MOVT	R0, #hi_addr(_Button3+46)
STRH	R1, [R0, #0]
;MyProject_driver.c,554 :: 		Button3.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button3+50)
MOVT	R0, #hi_addr(_Button3+50)
STRH	R1, [R0, #0]
;MyProject_driver.c,555 :: 		Button3.OnClickPtr      = Button3OnClick;
MOVW	R1, #lo_addr(_Button3OnClick+0)
MOVT	R1, #hi_addr(_Button3OnClick+0)
MOVW	R0, #lo_addr(_Button3+60)
MOVT	R0, #hi_addr(_Button3+60)
STR	R1, [R0, #0]
;MyProject_driver.c,557 :: 		Button5.OwnerScreen     = &Screen3;
MOVW	R1, #lo_addr(_Screen3+0)
MOVT	R1, #hi_addr(_Screen3+0)
MOVW	R0, #lo_addr(_Button5+0)
MOVT	R0, #hi_addr(_Button5+0)
STR	R1, [R0, #0]
;MyProject_driver.c,558 :: 		Button5.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button5+4)
MOVT	R0, #hi_addr(_Button5+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,559 :: 		Button5.Left            = 390;
MOVW	R1, #390
MOVW	R0, #lo_addr(_Button5+6)
MOVT	R0, #hi_addr(_Button5+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,560 :: 		Button5.Top             = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Button5+8)
MOVT	R0, #hi_addr(_Button5+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,561 :: 		Button5.Width           = 76;
MOVS	R1, #76
MOVW	R0, #lo_addr(_Button5+10)
MOVT	R0, #hi_addr(_Button5+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,562 :: 		Button5.Height          = 27;
MOVS	R1, #27
MOVW	R0, #lo_addr(_Button5+12)
MOVT	R0, #hi_addr(_Button5+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,563 :: 		Button5.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button5+14)
MOVT	R0, #hi_addr(_Button5+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,564 :: 		Button5.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button5+16)
MOVT	R0, #hi_addr(_Button5+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,565 :: 		Button5.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button5+18)
MOVT	R0, #hi_addr(_Button5+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,566 :: 		Button5.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button5+19)
MOVT	R0, #hi_addr(_Button5+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,567 :: 		Button5.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button5+20)
MOVT	R0, #hi_addr(_Button5+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,568 :: 		Button5.Caption         = Button5_Caption;
MOVW	R1, #lo_addr(_Button5_Caption+0)
MOVT	R1, #hi_addr(_Button5_Caption+0)
MOVW	R0, #lo_addr(_Button5+24)
MOVT	R0, #hi_addr(_Button5+24)
STR	R1, [R0, #0]
;MyProject_driver.c,569 :: 		Button5.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button5+28)
MOVT	R0, #hi_addr(_Button5+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,570 :: 		Button5.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button5+29)
MOVT	R0, #hi_addr(_Button5+29)
STRB	R1, [R0, #0]
;MyProject_driver.c,571 :: 		Button5.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_Button5+32)
MOVT	R0, #hi_addr(_Button5+32)
STR	R3, [R0, #0]
;MyProject_driver.c,572 :: 		Button5.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button5+48)
MOVT	R0, #hi_addr(_Button5+48)
STRB	R1, [R0, #0]
;MyProject_driver.c,573 :: 		Button5.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button5+36)
MOVT	R0, #hi_addr(_Button5+36)
STRH	R1, [R0, #0]
;MyProject_driver.c,574 :: 		Button5.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button5+38)
MOVT	R0, #hi_addr(_Button5+38)
STRB	R1, [R0, #0]
;MyProject_driver.c,575 :: 		Button5.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button5+39)
MOVT	R0, #hi_addr(_Button5+39)
STRB	R1, [R0, #0]
;MyProject_driver.c,576 :: 		Button5.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button5+40)
MOVT	R0, #hi_addr(_Button5+40)
STRB	R1, [R0, #0]
;MyProject_driver.c,577 :: 		Button5.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button5+42)
MOVT	R0, #hi_addr(_Button5+42)
STRH	R1, [R0, #0]
;MyProject_driver.c,578 :: 		Button5.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button5+44)
MOVT	R0, #hi_addr(_Button5+44)
STRH	R1, [R0, #0]
;MyProject_driver.c,579 :: 		Button5.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button5+46)
MOVT	R0, #hi_addr(_Button5+46)
STRH	R1, [R0, #0]
;MyProject_driver.c,580 :: 		Button5.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button5+50)
MOVT	R0, #hi_addr(_Button5+50)
STRH	R1, [R0, #0]
;MyProject_driver.c,581 :: 		Button5.OnClickPtr      = Button5OnClick;
MOVW	R1, #lo_addr(_Button5OnClick+0)
MOVT	R1, #hi_addr(_Button5OnClick+0)
MOVW	R0, #lo_addr(_Button5+60)
MOVT	R0, #hi_addr(_Button5+60)
STR	R1, [R0, #0]
;MyProject_driver.c,583 :: 		Button7.OwnerScreen     = &Screen3;
MOVW	R1, #lo_addr(_Screen3+0)
MOVT	R1, #hi_addr(_Screen3+0)
MOVW	R0, #lo_addr(_Button7+0)
MOVT	R0, #hi_addr(_Button7+0)
STR	R1, [R0, #0]
;MyProject_driver.c,584 :: 		Button7.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Button7+4)
MOVT	R0, #hi_addr(_Button7+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,585 :: 		Button7.Left            = 103;
MOVS	R1, #103
MOVW	R0, #lo_addr(_Button7+6)
MOVT	R0, #hi_addr(_Button7+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,586 :: 		Button7.Top             = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Button7+8)
MOVT	R0, #hi_addr(_Button7+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,587 :: 		Button7.Width           = 127;
MOVS	R1, #127
MOVW	R0, #lo_addr(_Button7+10)
MOVT	R0, #hi_addr(_Button7+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,588 :: 		Button7.Height          = 29;
MOVS	R1, #29
MOVW	R0, #lo_addr(_Button7+12)
MOVT	R0, #hi_addr(_Button7+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,589 :: 		Button7.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button7+14)
MOVT	R0, #hi_addr(_Button7+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,590 :: 		Button7.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button7+16)
MOVT	R0, #hi_addr(_Button7+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,591 :: 		Button7.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button7+18)
MOVT	R0, #hi_addr(_Button7+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,592 :: 		Button7.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button7+19)
MOVT	R0, #hi_addr(_Button7+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,593 :: 		Button7.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button7+20)
MOVT	R0, #hi_addr(_Button7+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,594 :: 		Button7.Caption         = Button7_Caption;
MOVW	R1, #lo_addr(_Button7_Caption+0)
MOVT	R1, #hi_addr(_Button7_Caption+0)
MOVW	R0, #lo_addr(_Button7+24)
MOVT	R0, #hi_addr(_Button7+24)
STR	R1, [R0, #0]
;MyProject_driver.c,595 :: 		Button7.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button7+28)
MOVT	R0, #hi_addr(_Button7+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,596 :: 		Button7.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button7+29)
MOVT	R0, #hi_addr(_Button7+29)
STRB	R1, [R0, #0]
;MyProject_driver.c,597 :: 		Button7.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_Button7+32)
MOVT	R0, #hi_addr(_Button7+32)
STR	R3, [R0, #0]
;MyProject_driver.c,598 :: 		Button7.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button7+48)
MOVT	R0, #hi_addr(_Button7+48)
STRB	R1, [R0, #0]
;MyProject_driver.c,599 :: 		Button7.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button7+36)
MOVT	R0, #hi_addr(_Button7+36)
STRH	R1, [R0, #0]
;MyProject_driver.c,600 :: 		Button7.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button7+38)
MOVT	R0, #hi_addr(_Button7+38)
STRB	R1, [R0, #0]
;MyProject_driver.c,601 :: 		Button7.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button7+39)
MOVT	R0, #hi_addr(_Button7+39)
STRB	R1, [R0, #0]
;MyProject_driver.c,602 :: 		Button7.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button7+40)
MOVT	R0, #hi_addr(_Button7+40)
STRB	R1, [R0, #0]
;MyProject_driver.c,603 :: 		Button7.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button7+42)
MOVT	R0, #hi_addr(_Button7+42)
STRH	R1, [R0, #0]
;MyProject_driver.c,604 :: 		Button7.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button7+44)
MOVT	R0, #hi_addr(_Button7+44)
STRH	R1, [R0, #0]
;MyProject_driver.c,605 :: 		Button7.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button7+46)
MOVT	R0, #hi_addr(_Button7+46)
STRH	R1, [R0, #0]
;MyProject_driver.c,606 :: 		Button7.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button7+50)
MOVT	R0, #hi_addr(_Button7+50)
STRH	R1, [R0, #0]
;MyProject_driver.c,607 :: 		Button7.OnClickPtr      = Button7OnClick;
MOVW	R1, #lo_addr(_Button7OnClick+0)
MOVT	R1, #hi_addr(_Button7OnClick+0)
MOVW	R0, #lo_addr(_Button7+60)
MOVT	R0, #hi_addr(_Button7+60)
STR	R1, [R0, #0]
;MyProject_driver.c,609 :: 		ButtonRound2.OwnerScreen     = &Screen3;
MOVW	R1, #lo_addr(_Screen3+0)
MOVT	R1, #hi_addr(_Screen3+0)
MOVW	R0, #lo_addr(_ButtonRound2+0)
MOVT	R0, #hi_addr(_ButtonRound2+0)
STR	R1, [R0, #0]
;MyProject_driver.c,610 :: 		ButtonRound2.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound2+4)
MOVT	R0, #hi_addr(_ButtonRound2+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,611 :: 		ButtonRound2.Left            = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_ButtonRound2+6)
MOVT	R0, #hi_addr(_ButtonRound2+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,612 :: 		ButtonRound2.Top             = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_ButtonRound2+8)
MOVT	R0, #hi_addr(_ButtonRound2+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,613 :: 		ButtonRound2.Width           = 39;
MOVS	R1, #39
MOVW	R0, #lo_addr(_ButtonRound2+10)
MOVT	R0, #hi_addr(_ButtonRound2+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,614 :: 		ButtonRound2.Height          = 28;
MOVS	R1, #28
MOVW	R0, #lo_addr(_ButtonRound2+12)
MOVT	R0, #hi_addr(_ButtonRound2+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,615 :: 		ButtonRound2.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+14)
MOVT	R0, #hi_addr(_ButtonRound2+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,616 :: 		ButtonRound2.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound2+16)
MOVT	R0, #hi_addr(_ButtonRound2+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,617 :: 		ButtonRound2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+18)
MOVT	R0, #hi_addr(_ButtonRound2+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,618 :: 		ButtonRound2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+19)
MOVT	R0, #hi_addr(_ButtonRound2+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,619 :: 		ButtonRound2.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+20)
MOVT	R0, #hi_addr(_ButtonRound2+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,620 :: 		ButtonRound2.Caption         = ButtonRound2_Caption;
MOVW	R1, #lo_addr(_ButtonRound2_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound2_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound2+24)
MOVT	R0, #hi_addr(_ButtonRound2+24)
STR	R1, [R0, #0]
;MyProject_driver.c,621 :: 		ButtonRound2.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+28)
MOVT	R0, #hi_addr(_ButtonRound2+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,622 :: 		ButtonRound2.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+29)
MOVT	R0, #hi_addr(_ButtonRound2+29)
STRB	R1, [R0, #0]
;MyProject_driver.c,623 :: 		ButtonRound2.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_ButtonRound2+32)
MOVT	R0, #hi_addr(_ButtonRound2+32)
STR	R3, [R0, #0]
;MyProject_driver.c,624 :: 		ButtonRound2.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+49)
MOVT	R0, #hi_addr(_ButtonRound2+49)
STRB	R1, [R0, #0]
;MyProject_driver.c,625 :: 		ButtonRound2.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound2+36)
MOVT	R0, #hi_addr(_ButtonRound2+36)
STRH	R1, [R0, #0]
;MyProject_driver.c,626 :: 		ButtonRound2.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound2+38)
MOVT	R0, #hi_addr(_ButtonRound2+38)
STRB	R1, [R0, #0]
;MyProject_driver.c,627 :: 		ButtonRound2.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+39)
MOVT	R0, #hi_addr(_ButtonRound2+39)
STRB	R1, [R0, #0]
;MyProject_driver.c,628 :: 		ButtonRound2.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound2+40)
MOVT	R0, #hi_addr(_ButtonRound2+40)
STRB	R1, [R0, #0]
;MyProject_driver.c,629 :: 		ButtonRound2.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound2+42)
MOVT	R0, #hi_addr(_ButtonRound2+42)
STRH	R1, [R0, #0]
;MyProject_driver.c,630 :: 		ButtonRound2.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound2+44)
MOVT	R0, #hi_addr(_ButtonRound2+44)
STRH	R1, [R0, #0]
;MyProject_driver.c,631 :: 		ButtonRound2.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound2+46)
MOVT	R0, #hi_addr(_ButtonRound2+46)
STRH	R1, [R0, #0]
;MyProject_driver.c,632 :: 		ButtonRound2.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound2+50)
MOVT	R0, #hi_addr(_ButtonRound2+50)
STRH	R1, [R0, #0]
;MyProject_driver.c,633 :: 		ButtonRound2.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound2+48)
MOVT	R0, #hi_addr(_ButtonRound2+48)
STRB	R1, [R0, #0]
;MyProject_driver.c,634 :: 		ButtonRound2.OnClickPtr      = ButtonRound2OnClick;
MOVW	R1, #lo_addr(_ButtonRound2OnClick+0)
MOVT	R1, #hi_addr(_ButtonRound2OnClick+0)
MOVW	R0, #lo_addr(_ButtonRound2+60)
MOVT	R0, #hi_addr(_ButtonRound2+60)
STR	R1, [R0, #0]
;MyProject_driver.c,636 :: 		Label7.OwnerScreen     = &Screen4;
MOVW	R1, #lo_addr(_Screen4+0)
MOVT	R1, #hi_addr(_Screen4+0)
MOVW	R0, #lo_addr(_Label7+0)
MOVT	R0, #hi_addr(_Label7+0)
STR	R1, [R0, #0]
;MyProject_driver.c,637 :: 		Label7.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label7+4)
MOVT	R0, #hi_addr(_Label7+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,638 :: 		Label7.Left            = 341;
MOVW	R1, #341
MOVW	R0, #lo_addr(_Label7+6)
MOVT	R0, #hi_addr(_Label7+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,639 :: 		Label7.Top             = 173;
MOVS	R1, #173
MOVW	R0, #lo_addr(_Label7+8)
MOVT	R0, #hi_addr(_Label7+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,640 :: 		Label7.Width           = 43;
MOVS	R1, #43
MOVW	R0, #lo_addr(_Label7+10)
MOVT	R0, #hi_addr(_Label7+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,641 :: 		Label7.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label7+12)
MOVT	R0, #hi_addr(_Label7+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,642 :: 		Label7.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label7+27)
MOVT	R0, #hi_addr(_Label7+27)
STRB	R1, [R0, #0]
;MyProject_driver.c,643 :: 		Label7.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label7+28)
MOVT	R0, #hi_addr(_Label7+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,644 :: 		Label7.Caption         = Label7_Caption;
MOVW	R1, #lo_addr(_Label7_Caption+0)
MOVT	R1, #hi_addr(_Label7_Caption+0)
MOVW	R0, #lo_addr(_Label7+16)
MOVT	R0, #hi_addr(_Label7+16)
STR	R1, [R0, #0]
;MyProject_driver.c,645 :: 		Label7.FontName        = Tahoma18x18_Bold;
MOVW	R2, #lo_addr(_Tahoma18x18_Bold+0)
MOVT	R2, #hi_addr(_Tahoma18x18_Bold+0)
MOVW	R0, #lo_addr(_Label7+20)
MOVT	R0, #hi_addr(_Label7+20)
STR	R2, [R0, #0]
;MyProject_driver.c,646 :: 		Label7.Font_Color      = 0xDED8;
MOVW	R1, #57048
MOVW	R0, #lo_addr(_Label7+24)
MOVT	R0, #hi_addr(_Label7+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,647 :: 		Label7.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label7+26)
MOVT	R0, #hi_addr(_Label7+26)
STRB	R1, [R0, #0]
;MyProject_driver.c,649 :: 		Button6.OwnerScreen     = &Screen4;
MOVW	R1, #lo_addr(_Screen4+0)
MOVT	R1, #hi_addr(_Screen4+0)
MOVW	R0, #lo_addr(_Button6+0)
MOVT	R0, #hi_addr(_Button6+0)
STR	R1, [R0, #0]
;MyProject_driver.c,650 :: 		Button6.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button6+4)
MOVT	R0, #hi_addr(_Button6+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,651 :: 		Button6.Left            = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_Button6+6)
MOVT	R0, #hi_addr(_Button6+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,652 :: 		Button6.Top             = 229;
MOVS	R1, #229
MOVW	R0, #lo_addr(_Button6+8)
MOVT	R0, #hi_addr(_Button6+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,653 :: 		Button6.Width           = 39;
MOVS	R1, #39
MOVW	R0, #lo_addr(_Button6+10)
MOVT	R0, #hi_addr(_Button6+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,654 :: 		Button6.Height          = 33;
MOVS	R1, #33
MOVW	R0, #lo_addr(_Button6+12)
MOVT	R0, #hi_addr(_Button6+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,655 :: 		Button6.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button6+14)
MOVT	R0, #hi_addr(_Button6+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,656 :: 		Button6.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button6+16)
MOVT	R0, #hi_addr(_Button6+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,657 :: 		Button6.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button6+18)
MOVT	R0, #hi_addr(_Button6+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,658 :: 		Button6.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button6+19)
MOVT	R0, #hi_addr(_Button6+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,659 :: 		Button6.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button6+20)
MOVT	R0, #hi_addr(_Button6+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,660 :: 		Button6.Caption         = Button6_Caption;
MOVW	R1, #lo_addr(_Button6_Caption+0)
MOVT	R1, #hi_addr(_Button6_Caption+0)
MOVW	R0, #lo_addr(_Button6+24)
MOVT	R0, #hi_addr(_Button6+24)
STR	R1, [R0, #0]
;MyProject_driver.c,661 :: 		Button6.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button6+28)
MOVT	R0, #hi_addr(_Button6+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,662 :: 		Button6.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button6+29)
MOVT	R0, #hi_addr(_Button6+29)
STRB	R1, [R0, #0]
;MyProject_driver.c,663 :: 		Button6.FontName        = Tahoma11x13_Regular;
MOVW	R0, #lo_addr(_Button6+32)
MOVT	R0, #hi_addr(_Button6+32)
STR	R3, [R0, #0]
;MyProject_driver.c,664 :: 		Button6.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button6+48)
MOVT	R0, #hi_addr(_Button6+48)
STRB	R1, [R0, #0]
;MyProject_driver.c,665 :: 		Button6.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button6+36)
MOVT	R0, #hi_addr(_Button6+36)
STRH	R1, [R0, #0]
;MyProject_driver.c,666 :: 		Button6.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button6+38)
MOVT	R0, #hi_addr(_Button6+38)
STRB	R1, [R0, #0]
;MyProject_driver.c,667 :: 		Button6.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Button6+39)
MOVT	R0, #hi_addr(_Button6+39)
STRB	R1, [R0, #0]
;MyProject_driver.c,668 :: 		Button6.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Button6+40)
MOVT	R0, #hi_addr(_Button6+40)
STRB	R1, [R0, #0]
;MyProject_driver.c,669 :: 		Button6.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Button6+42)
MOVT	R0, #hi_addr(_Button6+42)
STRH	R1, [R0, #0]
;MyProject_driver.c,670 :: 		Button6.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button6+44)
MOVT	R0, #hi_addr(_Button6+44)
STRH	R1, [R0, #0]
;MyProject_driver.c,671 :: 		Button6.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Button6+46)
MOVT	R0, #hi_addr(_Button6+46)
STRH	R1, [R0, #0]
;MyProject_driver.c,672 :: 		Button6.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Button6+50)
MOVT	R0, #hi_addr(_Button6+50)
STRH	R1, [R0, #0]
;MyProject_driver.c,673 :: 		Button6.OnClickPtr      = Button6OnClick;
MOVW	R1, #lo_addr(_Button6OnClick+0)
MOVT	R1, #hi_addr(_Button6OnClick+0)
MOVW	R0, #lo_addr(_Button6+60)
MOVT	R0, #hi_addr(_Button6+60)
STR	R1, [R0, #0]
;MyProject_driver.c,675 :: 		Box2.OwnerScreen     = &Screen4;
MOVW	R1, #lo_addr(_Screen4+0)
MOVT	R1, #hi_addr(_Screen4+0)
MOVW	R0, #lo_addr(_Box2+0)
MOVT	R0, #hi_addr(_Box2+0)
STR	R1, [R0, #0]
;MyProject_driver.c,676 :: 		Box2.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Box2+4)
MOVT	R0, #hi_addr(_Box2+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,677 :: 		Box2.Left            = 39;
MOVS	R1, #39
MOVW	R0, #lo_addr(_Box2+6)
MOVT	R0, #hi_addr(_Box2+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,678 :: 		Box2.Top             = 45;
MOVS	R1, #45
MOVW	R0, #lo_addr(_Box2+8)
MOVT	R0, #hi_addr(_Box2+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,679 :: 		Box2.Width           = 163;
MOVS	R1, #163
MOVW	R0, #lo_addr(_Box2+10)
MOVT	R0, #hi_addr(_Box2+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,680 :: 		Box2.Height          = 26;
MOVS	R1, #26
MOVW	R0, #lo_addr(_Box2+12)
MOVT	R0, #hi_addr(_Box2+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,681 :: 		Box2.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+14)
MOVT	R0, #hi_addr(_Box2+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,682 :: 		Box2.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+16)
MOVT	R0, #hi_addr(_Box2+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,683 :: 		Box2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+18)
MOVT	R0, #hi_addr(_Box2+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,684 :: 		Box2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+19)
MOVT	R0, #hi_addr(_Box2+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,685 :: 		Box2.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+20)
MOVT	R0, #hi_addr(_Box2+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,686 :: 		Box2.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+21)
MOVT	R0, #hi_addr(_Box2+21)
STRB	R1, [R0, #0]
;MyProject_driver.c,687 :: 		Box2.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+22)
MOVT	R0, #hi_addr(_Box2+22)
STRB	R1, [R0, #0]
;MyProject_driver.c,688 :: 		Box2.Gradient_Start_Color = 0x20C2;
MOVW	R1, #8386
MOVW	R0, #lo_addr(_Box2+24)
MOVT	R0, #hi_addr(_Box2+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,689 :: 		Box2.Gradient_End_Color = 0x630C;
MOVW	R1, #25356
MOVW	R0, #lo_addr(_Box2+26)
MOVT	R0, #hi_addr(_Box2+26)
STRH	R1, [R0, #0]
;MyProject_driver.c,690 :: 		Box2.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box2+28)
MOVT	R0, #hi_addr(_Box2+28)
STRH	R1, [R0, #0]
;MyProject_driver.c,691 :: 		Box2.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+30)
MOVT	R0, #hi_addr(_Box2+30)
STRB	R1, [R0, #0]
;MyProject_driver.c,692 :: 		Box2.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box2+32)
MOVT	R0, #hi_addr(_Box2+32)
STRH	R1, [R0, #0]
;MyProject_driver.c,694 :: 		Box3.OwnerScreen     = &Screen4;
MOVW	R1, #lo_addr(_Screen4+0)
MOVT	R1, #hi_addr(_Screen4+0)
MOVW	R0, #lo_addr(_Box3+0)
MOVT	R0, #hi_addr(_Box3+0)
STR	R1, [R0, #0]
;MyProject_driver.c,695 :: 		Box3.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Box3+4)
MOVT	R0, #hi_addr(_Box3+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,696 :: 		Box3.Left            = 39;
MOVS	R1, #39
MOVW	R0, #lo_addr(_Box3+6)
MOVT	R0, #hi_addr(_Box3+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,697 :: 		Box3.Top             = 89;
MOVS	R1, #89
MOVW	R0, #lo_addr(_Box3+8)
MOVT	R0, #hi_addr(_Box3+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,698 :: 		Box3.Width           = 163;
MOVS	R1, #163
MOVW	R0, #lo_addr(_Box3+10)
MOVT	R0, #hi_addr(_Box3+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,699 :: 		Box3.Height          = 26;
MOVS	R1, #26
MOVW	R0, #lo_addr(_Box3+12)
MOVT	R0, #hi_addr(_Box3+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,700 :: 		Box3.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box3+14)
MOVT	R0, #hi_addr(_Box3+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,701 :: 		Box3.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+16)
MOVT	R0, #hi_addr(_Box3+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,702 :: 		Box3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box3+18)
MOVT	R0, #hi_addr(_Box3+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,703 :: 		Box3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box3+19)
MOVT	R0, #hi_addr(_Box3+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,704 :: 		Box3.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box3+20)
MOVT	R0, #hi_addr(_Box3+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,705 :: 		Box3.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box3+21)
MOVT	R0, #hi_addr(_Box3+21)
STRB	R1, [R0, #0]
;MyProject_driver.c,706 :: 		Box3.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+22)
MOVT	R0, #hi_addr(_Box3+22)
STRB	R1, [R0, #0]
;MyProject_driver.c,707 :: 		Box3.Gradient_Start_Color = 0x20C2;
MOVW	R1, #8386
MOVW	R0, #lo_addr(_Box3+24)
MOVT	R0, #hi_addr(_Box3+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,708 :: 		Box3.Gradient_End_Color = 0x630C;
MOVW	R1, #25356
MOVW	R0, #lo_addr(_Box3+26)
MOVT	R0, #hi_addr(_Box3+26)
STRH	R1, [R0, #0]
;MyProject_driver.c,709 :: 		Box3.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box3+28)
MOVT	R0, #hi_addr(_Box3+28)
STRH	R1, [R0, #0]
;MyProject_driver.c,710 :: 		Box3.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box3+30)
MOVT	R0, #hi_addr(_Box3+30)
STRB	R1, [R0, #0]
;MyProject_driver.c,711 :: 		Box3.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box3+32)
MOVT	R0, #hi_addr(_Box3+32)
STRH	R1, [R0, #0]
;MyProject_driver.c,713 :: 		Box4.OwnerScreen     = &Screen4;
MOVW	R1, #lo_addr(_Screen4+0)
MOVT	R1, #hi_addr(_Screen4+0)
MOVW	R0, #lo_addr(_Box4+0)
MOVT	R0, #hi_addr(_Box4+0)
STR	R1, [R0, #0]
;MyProject_driver.c,714 :: 		Box4.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Box4+4)
MOVT	R0, #hi_addr(_Box4+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,715 :: 		Box4.Left            = 269;
MOVW	R1, #269
MOVW	R0, #lo_addr(_Box4+6)
MOVT	R0, #hi_addr(_Box4+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,716 :: 		Box4.Top             = 89;
MOVS	R1, #89
MOVW	R0, #lo_addr(_Box4+8)
MOVT	R0, #hi_addr(_Box4+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,717 :: 		Box4.Width           = 163;
MOVS	R1, #163
MOVW	R0, #lo_addr(_Box4+10)
MOVT	R0, #hi_addr(_Box4+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,718 :: 		Box4.Height          = 26;
MOVS	R1, #26
MOVW	R0, #lo_addr(_Box4+12)
MOVT	R0, #hi_addr(_Box4+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,719 :: 		Box4.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box4+14)
MOVT	R0, #hi_addr(_Box4+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,720 :: 		Box4.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+16)
MOVT	R0, #hi_addr(_Box4+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,721 :: 		Box4.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box4+18)
MOVT	R0, #hi_addr(_Box4+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,722 :: 		Box4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box4+19)
MOVT	R0, #hi_addr(_Box4+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,723 :: 		Box4.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box4+20)
MOVT	R0, #hi_addr(_Box4+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,724 :: 		Box4.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box4+21)
MOVT	R0, #hi_addr(_Box4+21)
STRB	R1, [R0, #0]
;MyProject_driver.c,725 :: 		Box4.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box4+22)
MOVT	R0, #hi_addr(_Box4+22)
STRB	R1, [R0, #0]
;MyProject_driver.c,726 :: 		Box4.Gradient_Start_Color = 0x20C2;
MOVW	R1, #8386
MOVW	R0, #lo_addr(_Box4+24)
MOVT	R0, #hi_addr(_Box4+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,727 :: 		Box4.Gradient_End_Color = 0x630C;
MOVW	R1, #25356
MOVW	R0, #lo_addr(_Box4+26)
MOVT	R0, #hi_addr(_Box4+26)
STRH	R1, [R0, #0]
;MyProject_driver.c,728 :: 		Box4.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box4+28)
MOVT	R0, #hi_addr(_Box4+28)
STRH	R1, [R0, #0]
;MyProject_driver.c,729 :: 		Box4.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box4+30)
MOVT	R0, #hi_addr(_Box4+30)
STRB	R1, [R0, #0]
;MyProject_driver.c,730 :: 		Box4.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box4+32)
MOVT	R0, #hi_addr(_Box4+32)
STRH	R1, [R0, #0]
;MyProject_driver.c,732 :: 		Label4.OwnerScreen     = &Screen4;
MOVW	R1, #lo_addr(_Screen4+0)
MOVT	R1, #hi_addr(_Screen4+0)
MOVW	R0, #lo_addr(_Label4+0)
MOVT	R0, #hi_addr(_Label4+0)
STR	R1, [R0, #0]
;MyProject_driver.c,733 :: 		Label4.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Label4+4)
MOVT	R0, #hi_addr(_Label4+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,734 :: 		Label4.Left            = 89;
MOVS	R1, #89
MOVW	R0, #lo_addr(_Label4+6)
MOVT	R0, #hi_addr(_Label4+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,735 :: 		Label4.Top             = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label4+8)
MOVT	R0, #hi_addr(_Label4+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,736 :: 		Label4.Width           = 61;
MOVS	R1, #61
MOVW	R0, #lo_addr(_Label4+10)
MOVT	R0, #hi_addr(_Label4+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,737 :: 		Label4.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label4+12)
MOVT	R0, #hi_addr(_Label4+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,738 :: 		Label4.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label4+27)
MOVT	R0, #hi_addr(_Label4+27)
STRB	R1, [R0, #0]
;MyProject_driver.c,739 :: 		Label4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label4+28)
MOVT	R0, #hi_addr(_Label4+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,740 :: 		Label4.Caption         = Label4_Caption;
MOVW	R1, #lo_addr(_Label4_Caption+0)
MOVT	R1, #hi_addr(_Label4_Caption+0)
MOVW	R0, #lo_addr(_Label4+16)
MOVT	R0, #hi_addr(_Label4+16)
STR	R1, [R0, #0]
;MyProject_driver.c,741 :: 		Label4.FontName        = Tahoma18x18_Bold;
MOVW	R0, #lo_addr(_Label4+20)
MOVT	R0, #hi_addr(_Label4+20)
STR	R2, [R0, #0]
;MyProject_driver.c,742 :: 		Label4.Font_Color      = 0xDED8;
MOVW	R1, #57048
MOVW	R0, #lo_addr(_Label4+24)
MOVT	R0, #hi_addr(_Label4+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,743 :: 		Label4.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+26)
MOVT	R0, #hi_addr(_Label4+26)
STRB	R1, [R0, #0]
;MyProject_driver.c,745 :: 		Label3.OwnerScreen     = &Screen4;
MOVW	R1, #lo_addr(_Screen4+0)
MOVT	R1, #hi_addr(_Screen4+0)
MOVW	R0, #lo_addr(_Label3+0)
MOVT	R0, #hi_addr(_Label3+0)
STR	R1, [R0, #0]
;MyProject_driver.c,746 :: 		Label3.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Label3+4)
MOVT	R0, #hi_addr(_Label3+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,747 :: 		Label3.Left            = 90;
MOVS	R1, #90
MOVW	R0, #lo_addr(_Label3+6)
MOVT	R0, #hi_addr(_Label3+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,748 :: 		Label3.Top             = 69;
MOVS	R1, #69
MOVW	R0, #lo_addr(_Label3+8)
MOVT	R0, #hi_addr(_Label3+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,749 :: 		Label3.Width           = 61;
MOVS	R1, #61
MOVW	R0, #lo_addr(_Label3+10)
MOVT	R0, #hi_addr(_Label3+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,750 :: 		Label3.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label3+12)
MOVT	R0, #hi_addr(_Label3+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,751 :: 		Label3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label3+27)
MOVT	R0, #hi_addr(_Label3+27)
STRB	R1, [R0, #0]
;MyProject_driver.c,752 :: 		Label3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label3+28)
MOVT	R0, #hi_addr(_Label3+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,753 :: 		Label3.Caption         = Label3_Caption;
MOVW	R1, #lo_addr(_Label3_Caption+0)
MOVT	R1, #hi_addr(_Label3_Caption+0)
MOVW	R0, #lo_addr(_Label3+16)
MOVT	R0, #hi_addr(_Label3+16)
STR	R1, [R0, #0]
;MyProject_driver.c,754 :: 		Label3.FontName        = Tahoma18x18_Bold;
MOVW	R0, #lo_addr(_Label3+20)
MOVT	R0, #hi_addr(_Label3+20)
STR	R2, [R0, #0]
;MyProject_driver.c,755 :: 		Label3.Font_Color      = 0xDED8;
MOVW	R1, #57048
MOVW	R0, #lo_addr(_Label3+24)
MOVT	R0, #hi_addr(_Label3+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,756 :: 		Label3.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+26)
MOVT	R0, #hi_addr(_Label3+26)
STRB	R1, [R0, #0]
;MyProject_driver.c,758 :: 		Label5.OwnerScreen     = &Screen4;
MOVW	R1, #lo_addr(_Screen4+0)
MOVT	R1, #hi_addr(_Screen4+0)
MOVW	R0, #lo_addr(_Label5+0)
MOVT	R0, #hi_addr(_Label5+0)
STR	R1, [R0, #0]
;MyProject_driver.c,759 :: 		Label5.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label5+4)
MOVT	R0, #hi_addr(_Label5+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,760 :: 		Label5.Left            = 339;
MOVW	R1, #339
MOVW	R0, #lo_addr(_Label5+6)
MOVT	R0, #hi_addr(_Label5+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,761 :: 		Label5.Top             = 63;
MOVS	R1, #63
MOVW	R0, #lo_addr(_Label5+8)
MOVT	R0, #hi_addr(_Label5+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,762 :: 		Label5.Width           = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_Label5+10)
MOVT	R0, #hi_addr(_Label5+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,763 :: 		Label5.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label5+12)
MOVT	R0, #hi_addr(_Label5+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,764 :: 		Label5.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label5+27)
MOVT	R0, #hi_addr(_Label5+27)
STRB	R1, [R0, #0]
;MyProject_driver.c,765 :: 		Label5.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label5+28)
MOVT	R0, #hi_addr(_Label5+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,766 :: 		Label5.Caption         = Label5_Caption;
MOVW	R1, #lo_addr(_Label5_Caption+0)
MOVT	R1, #hi_addr(_Label5_Caption+0)
MOVW	R0, #lo_addr(_Label5+16)
MOVT	R0, #hi_addr(_Label5+16)
STR	R1, [R0, #0]
;MyProject_driver.c,767 :: 		Label5.FontName        = Tahoma18x18_Bold;
MOVW	R0, #lo_addr(_Label5+20)
MOVT	R0, #hi_addr(_Label5+20)
STR	R2, [R0, #0]
;MyProject_driver.c,768 :: 		Label5.Font_Color      = 0xDED8;
MOVW	R1, #57048
MOVW	R0, #lo_addr(_Label5+24)
MOVT	R0, #hi_addr(_Label5+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,769 :: 		Label5.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+26)
MOVT	R0, #hi_addr(_Label5+26)
STRB	R1, [R0, #0]
;MyProject_driver.c,771 :: 		Box5.OwnerScreen     = &Screen4;
MOVW	R1, #lo_addr(_Screen4+0)
MOVT	R1, #hi_addr(_Screen4+0)
MOVW	R0, #lo_addr(_Box5+0)
MOVT	R0, #hi_addr(_Box5+0)
STR	R1, [R0, #0]
;MyProject_driver.c,772 :: 		Box5.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Box5+4)
MOVT	R0, #hi_addr(_Box5+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,773 :: 		Box5.Left            = 174;
MOVS	R1, #174
MOVW	R0, #lo_addr(_Box5+6)
MOVT	R0, #hi_addr(_Box5+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,774 :: 		Box5.Top             = 198;
MOVS	R1, #198
MOVW	R0, #lo_addr(_Box5+8)
MOVT	R0, #hi_addr(_Box5+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,775 :: 		Box5.Width           = 111;
MOVS	R1, #111
MOVW	R0, #lo_addr(_Box5+10)
MOVT	R0, #hi_addr(_Box5+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,776 :: 		Box5.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Box5+12)
MOVT	R0, #hi_addr(_Box5+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,777 :: 		Box5.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box5+14)
MOVT	R0, #hi_addr(_Box5+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,778 :: 		Box5.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+16)
MOVT	R0, #hi_addr(_Box5+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,779 :: 		Box5.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box5+18)
MOVT	R0, #hi_addr(_Box5+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,780 :: 		Box5.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box5+19)
MOVT	R0, #hi_addr(_Box5+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,781 :: 		Box5.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box5+20)
MOVT	R0, #hi_addr(_Box5+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,782 :: 		Box5.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box5+21)
MOVT	R0, #hi_addr(_Box5+21)
STRB	R1, [R0, #0]
;MyProject_driver.c,783 :: 		Box5.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box5+22)
MOVT	R0, #hi_addr(_Box5+22)
STRB	R1, [R0, #0]
;MyProject_driver.c,784 :: 		Box5.Gradient_Start_Color = 0x20C2;
MOVW	R1, #8386
MOVW	R0, #lo_addr(_Box5+24)
MOVT	R0, #hi_addr(_Box5+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,785 :: 		Box5.Gradient_End_Color = 0x630C;
MOVW	R1, #25356
MOVW	R0, #lo_addr(_Box5+26)
MOVT	R0, #hi_addr(_Box5+26)
STRH	R1, [R0, #0]
;MyProject_driver.c,786 :: 		Box5.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box5+28)
MOVT	R0, #hi_addr(_Box5+28)
STRH	R1, [R0, #0]
;MyProject_driver.c,787 :: 		Box5.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box5+30)
MOVT	R0, #hi_addr(_Box5+30)
STRB	R1, [R0, #0]
;MyProject_driver.c,788 :: 		Box5.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box5+32)
MOVT	R0, #hi_addr(_Box5+32)
STRH	R1, [R0, #0]
;MyProject_driver.c,790 :: 		Label6.OwnerScreen     = &Screen4;
MOVW	R1, #lo_addr(_Screen4+0)
MOVT	R1, #hi_addr(_Screen4+0)
MOVW	R0, #lo_addr(_Label6+0)
MOVT	R0, #hi_addr(_Label6+0)
STR	R1, [R0, #0]
;MyProject_driver.c,791 :: 		Label6.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Label6+4)
MOVT	R0, #hi_addr(_Label6+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,792 :: 		Label6.Left            = 176;
MOVS	R1, #176
MOVW	R0, #lo_addr(_Label6+6)
MOVT	R0, #hi_addr(_Label6+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,793 :: 		Label6.Top             = 172;
MOVS	R1, #172
MOVW	R0, #lo_addr(_Label6+8)
MOVT	R0, #hi_addr(_Label6+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,794 :: 		Label6.Width           = 107;
MOVS	R1, #107
MOVW	R0, #lo_addr(_Label6+10)
MOVT	R0, #hi_addr(_Label6+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,795 :: 		Label6.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label6+12)
MOVT	R0, #hi_addr(_Label6+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,796 :: 		Label6.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label6+27)
MOVT	R0, #hi_addr(_Label6+27)
STRB	R1, [R0, #0]
;MyProject_driver.c,797 :: 		Label6.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label6+28)
MOVT	R0, #hi_addr(_Label6+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,798 :: 		Label6.Caption         = Label6_Caption;
MOVW	R1, #lo_addr(_Label6_Caption+0)
MOVT	R1, #hi_addr(_Label6_Caption+0)
MOVW	R0, #lo_addr(_Label6+16)
MOVT	R0, #hi_addr(_Label6+16)
STR	R1, [R0, #0]
;MyProject_driver.c,799 :: 		Label6.FontName        = Tahoma18x18_Bold;
MOVW	R0, #lo_addr(_Label6+20)
MOVT	R0, #hi_addr(_Label6+20)
STR	R2, [R0, #0]
;MyProject_driver.c,800 :: 		Label6.Font_Color      = 0xDED8;
MOVW	R1, #57048
MOVW	R0, #lo_addr(_Label6+24)
MOVT	R0, #hi_addr(_Label6+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,801 :: 		Label6.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+26)
MOVT	R0, #hi_addr(_Label6+26)
STRB	R1, [R0, #0]
;MyProject_driver.c,803 :: 		Box6.OwnerScreen     = &Screen4;
MOVW	R1, #lo_addr(_Screen4+0)
MOVT	R1, #hi_addr(_Screen4+0)
MOVW	R0, #lo_addr(_Box6+0)
MOVT	R0, #hi_addr(_Box6+0)
STR	R1, [R0, #0]
;MyProject_driver.c,804 :: 		Box6.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Box6+4)
MOVT	R0, #hi_addr(_Box6+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,805 :: 		Box6.Left            = 315;
MOVW	R1, #315
MOVW	R0, #lo_addr(_Box6+6)
MOVT	R0, #hi_addr(_Box6+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,806 :: 		Box6.Top             = 198;
MOVS	R1, #198
MOVW	R0, #lo_addr(_Box6+8)
MOVT	R0, #hi_addr(_Box6+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,807 :: 		Box6.Width           = 94;
MOVS	R1, #94
MOVW	R0, #lo_addr(_Box6+10)
MOVT	R0, #hi_addr(_Box6+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,808 :: 		Box6.Height          = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_Box6+12)
MOVT	R0, #hi_addr(_Box6+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,809 :: 		Box6.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box6+14)
MOVT	R0, #hi_addr(_Box6+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,810 :: 		Box6.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box6+16)
MOVT	R0, #hi_addr(_Box6+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,811 :: 		Box6.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box6+18)
MOVT	R0, #hi_addr(_Box6+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,812 :: 		Box6.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box6+19)
MOVT	R0, #hi_addr(_Box6+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,813 :: 		Box6.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box6+20)
MOVT	R0, #hi_addr(_Box6+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,814 :: 		Box6.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box6+21)
MOVT	R0, #hi_addr(_Box6+21)
STRB	R1, [R0, #0]
;MyProject_driver.c,815 :: 		Box6.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box6+22)
MOVT	R0, #hi_addr(_Box6+22)
STRB	R1, [R0, #0]
;MyProject_driver.c,816 :: 		Box6.Gradient_Start_Color = 0x20C2;
MOVW	R1, #8386
MOVW	R0, #lo_addr(_Box6+24)
MOVT	R0, #hi_addr(_Box6+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,817 :: 		Box6.Gradient_End_Color = 0x630C;
MOVW	R1, #25356
MOVW	R0, #lo_addr(_Box6+26)
MOVT	R0, #hi_addr(_Box6+26)
STRH	R1, [R0, #0]
;MyProject_driver.c,818 :: 		Box6.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box6+28)
MOVT	R0, #hi_addr(_Box6+28)
STRH	R1, [R0, #0]
;MyProject_driver.c,819 :: 		Box6.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box6+30)
MOVT	R0, #hi_addr(_Box6+30)
STRB	R1, [R0, #0]
;MyProject_driver.c,820 :: 		Box6.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box6+32)
MOVT	R0, #hi_addr(_Box6+32)
STRH	R1, [R0, #0]
;MyProject_driver.c,821 :: 		}
L_end_InitializeObjects:
BX	LR
; end of MyProject_driver_InitializeObjects
MyProject_driver_IsInsideObject:
;MyProject_driver.c,823 :: 		static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) { // static
; Top start address is: 12 (R3)
; Left start address is: 8 (R2)
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
; Top end address is: 12 (R3)
; Left end address is: 8 (R2)
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
; Left start address is: 8 (R2)
; Top start address is: 12 (R3)
; Width start address is: 20 (R5)
LDRH	R5, [SP, #0]
; Height start address is: 24 (R6)
LDRH	R6, [SP, #4]
;MyProject_driver.c,824 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
CMP	R2, R0
IT	HI
BHI	L_MyProject_driver_IsInsideObject185
ADDS	R4, R2, R5
UXTH	R4, R4
; Left end address is: 8 (R2)
; Width end address is: 20 (R5)
SUBS	R4, R4, #1
UXTH	R4, R4
CMP	R4, R0
IT	CC
BCC	L_MyProject_driver_IsInsideObject184
; X end address is: 0 (R0)
;MyProject_driver.c,825 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
CMP	R3, R1
IT	HI
BHI	L_MyProject_driver_IsInsideObject183
ADDS	R4, R3, R6
UXTH	R4, R4
; Top end address is: 12 (R3)
; Height end address is: 24 (R6)
SUBS	R4, R4, #1
UXTH	R4, R4
CMP	R4, R1
IT	CC
BCC	L_MyProject_driver_IsInsideObject182
; Y end address is: 4 (R1)
L_MyProject_driver_IsInsideObject181:
;MyProject_driver.c,826 :: 		return 1;
MOVS	R0, #1
IT	AL
BAL	L_end_IsInsideObject
;MyProject_driver.c,824 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
L_MyProject_driver_IsInsideObject185:
L_MyProject_driver_IsInsideObject184:
;MyProject_driver.c,825 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
L_MyProject_driver_IsInsideObject183:
L_MyProject_driver_IsInsideObject182:
;MyProject_driver.c,828 :: 		return 0;
MOVS	R0, #0
;MyProject_driver.c,829 :: 		}
L_end_IsInsideObject:
BX	LR
; end of MyProject_driver_IsInsideObject
_DrawButton:
;MyProject_driver.c,838 :: 		void DrawButton(TButton *Abutton) {
; Abutton start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; Abutton end address is: 0 (R0)
; Abutton start address is: 0 (R0)
;MyProject_driver.c,840 :: 		if (Abutton->Visible != 0) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawButton4
;MyProject_driver.c,841 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawButton5
;MyProject_driver.c,842 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;MyProject_driver.c,843 :: 		TFT_Set_Brush(Abutton->Transparent, Abutton->Press_Color, Abutton->Gradient, Abutton->Gradient_Orientation, Abutton->Gradient_End_Color, Abutton->Gradient_Start_Color);
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #44
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #40
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #39
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #50
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;MyProject_driver.c,844 :: 		}
IT	AL
BAL	L_DrawButton6
L_DrawButton5:
;MyProject_driver.c,846 :: 		TFT_Set_Brush(Abutton->Transparent, Abutton->Color, Abutton->Gradient, Abutton->Gradient_Orientation, Abutton->Gradient_Start_Color, Abutton->Gradient_End_Color);
ADDW	R1, R0, #44
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #40
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #39
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #46
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;MyProject_driver.c,847 :: 		}
L_DrawButton6:
;MyProject_driver.c,848 :: 		TFT_Set_Pen(Abutton->Pen_Color, Abutton->Pen_Width);
ADDW	R1, R0, #14
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R0, #16
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;MyProject_driver.c,849 :: 		TFT_Rectangle(Abutton->Left, Abutton->Top, Abutton->Left + Abutton->Width - 1, Abutton->Top + Abutton->Height - 1);
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R1, R2, R1
UXTH	R1, R1
SUBS	R5, R1, #1
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R1, R4, R1
UXTH	R1, R1
SUBS	R3, R1, #1
SXTH	R2, R2
SXTH	R1, R4
STR	R0, [SP, #4]
SXTH	R0, R1
SXTH	R1, R2
SXTH	R2, R3
SXTH	R3, R5
BL	_TFT_Rectangle+0
LDR	R0, [SP, #4]
;MyProject_driver.c,850 :: 		if (Abutton->VerticalText != 0)
ADDW	R1, R0, #38
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawButton7
;MyProject_driver.c,851 :: 		TFT_Set_Font(Abutton->FontName, Abutton->Font_Color, FO_VERTICAL_COLUMN);
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #32
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #2
BL	_TFT_Set_Font+0
LDR	R0, [SP, #4]
IT	AL
BAL	L_DrawButton8
L_DrawButton7:
;MyProject_driver.c,853 :: 		TFT_Set_Font(Abutton->FontName, Abutton->Font_Color, FO_HORIZONTAL);
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #32
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Font+0
LDR	R0, [SP, #4]
L_DrawButton8:
;MyProject_driver.c,854 :: 		TFT_Write_Text_Return_Pos(Abutton->Caption, Abutton->Left, Abutton->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text_Return_Pos+0
LDR	R0, [SP, #4]
;MyProject_driver.c,855 :: 		if (Abutton->TextAlign == _taLeft)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_DrawButton9
;MyProject_driver.c,856 :: 		ALeft = Abutton->Left + 4;
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ADDS	R1, R1, #4
STRH	R1, [SP, #8]
IT	AL
BAL	L_DrawButton10
L_DrawButton9:
;MyProject_driver.c,857 :: 		else if (Abutton->TextAlign == _taCenter)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawButton11
;MyProject_driver.c,858 :: 		ALeft = Abutton->Left + (Abutton->Width - caption_length) / 2;
ADDS	R1, R0, #6
LDRH	R3, [R1, #0]
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R1, R3, R1
STRH	R1, [SP, #8]
IT	AL
BAL	L_DrawButton12
L_DrawButton11:
;MyProject_driver.c,859 :: 		else if (Abutton->TextAlign == _taRight)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	NE
BNE	L_DrawButton13
;MyProject_driver.c,860 :: 		ALeft = Abutton->Left + Abutton->Width - caption_length - 4;
ADDS	R1, R0, #6
LDRH	R2, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R2, R2, R1
UXTH	R2, R2
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
SUBS	R1, R1, #4
STRH	R1, [SP, #8]
L_DrawButton13:
L_DrawButton12:
L_DrawButton10:
;MyProject_driver.c,862 :: 		if (Abutton->TextAlignVertical == _tavTop)
ADDW	R1, R0, #29
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_DrawButton14
;MyProject_driver.c,863 :: 		ATop = Abutton->Top + 4;
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
ADDS	R1, R1, #4
STRH	R1, [SP, #10]
IT	AL
BAL	L_DrawButton15
L_DrawButton14:
;MyProject_driver.c,864 :: 		else if (Abutton->TextAlignVertical == _tavMiddle)
ADDW	R1, R0, #29
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawButton16
;MyProject_driver.c,865 :: 		ATop = Abutton->Top + ((Abutton->Height - caption_height) / 2);
ADDW	R1, R0, #8
LDRH	R3, [R1, #0]
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R1, R3, R1
STRH	R1, [SP, #10]
IT	AL
BAL	L_DrawButton17
L_DrawButton16:
;MyProject_driver.c,866 :: 		else if (Abutton->TextAlignVertical == _tavBottom)
ADDW	R1, R0, #29
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	NE
BNE	L_DrawButton18
;MyProject_driver.c,867 :: 		ATop = Abutton->Top + (Abutton->Height - caption_height - 4);
ADDW	R1, R0, #8
LDRH	R3, [R1, #0]
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
SUBS	R1, R1, #4
UXTH	R1, R1
ADDS	R1, R3, R1
STRH	R1, [SP, #10]
L_DrawButton18:
L_DrawButton17:
L_DrawButton15:
;MyProject_driver.c,869 :: 		TFT_Write_Text(Abutton->Caption, ALeft, ATop);
ADDW	R1, R0, #24
; Abutton end address is: 0 (R0)
LDR	R1, [R1, #0]
LDRH	R2, [SP, #10]
MOV	R0, R1
LDRH	R1, [SP, #8]
BL	_TFT_Write_Text+0
;MyProject_driver.c,870 :: 		}
L_DrawButton4:
;MyProject_driver.c,871 :: 		}
L_end_DrawButton:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _DrawButton
_DrawRoundButton:
;MyProject_driver.c,873 :: 		void DrawRoundButton(TButton_Round *Around_button) {
; Around_button start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; Around_button end address is: 0 (R0)
; Around_button start address is: 0 (R0)
;MyProject_driver.c,875 :: 		if (Around_button->Visible != 0) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawRoundButton19
;MyProject_driver.c,876 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRoundButton20
;MyProject_driver.c,877 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;MyProject_driver.c,879 :: 		Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #44
LDRH	R1, [R1, #0]
UXTH	R5, R1
;MyProject_driver.c,878 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
ADDW	R1, R0, #40
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #39
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #50
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
;MyProject_driver.c,879 :: 		Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;MyProject_driver.c,878 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
LDR	R0, [SP, #4]
;MyProject_driver.c,880 :: 		}
IT	AL
BAL	L_DrawRoundButton21
L_DrawRoundButton20:
;MyProject_driver.c,883 :: 		Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
ADDW	R1, R0, #44
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R5, R1
;MyProject_driver.c,882 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
ADDW	R1, R0, #40
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #39
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #46
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
;MyProject_driver.c,883 :: 		Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;MyProject_driver.c,882 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
LDR	R0, [SP, #4]
;MyProject_driver.c,884 :: 		}
L_DrawRoundButton21:
;MyProject_driver.c,885 :: 		TFT_Set_Pen(Around_button->Pen_Color, Around_button->Pen_Width);
ADDW	R1, R0, #14
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R0, #16
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;MyProject_driver.c,888 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
ADDW	R1, R0, #48
LDRB	R1, [R1, #0]
UXTB	R6, R1
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R1, R2, R1
UXTH	R1, R1
SUBS	R5, R1, #2
;MyProject_driver.c,887 :: 		Around_button->Left + Around_button->Width - 2,
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R1, R4, R1
UXTH	R1, R1
SUBS	R3, R1, #2
;MyProject_driver.c,886 :: 		TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
ADDS	R2, R2, #1
ADDS	R1, R4, #1
;MyProject_driver.c,888 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
STR	R0, [SP, #4]
;MyProject_driver.c,886 :: 		TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
UXTH	R0, R1
UXTH	R1, R2
;MyProject_driver.c,887 :: 		Around_button->Left + Around_button->Width - 2,
UXTH	R2, R3
;MyProject_driver.c,888 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
UXTH	R3, R5
PUSH	(R6)
BL	_TFT_Rectangle_Round_Edges+0
ADD	SP, SP, #4
LDR	R0, [SP, #4]
;MyProject_driver.c,889 :: 		if (Around_button->VerticalText != 0)
ADDW	R1, R0, #38
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawRoundButton22
;MyProject_driver.c,890 :: 		TFT_Set_Font(Around_button->FontName, Around_button->Font_Color, FO_VERTICAL_COLUMN);
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #32
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #2
BL	_TFT_Set_Font+0
LDR	R0, [SP, #4]
IT	AL
BAL	L_DrawRoundButton23
L_DrawRoundButton22:
;MyProject_driver.c,892 :: 		TFT_Set_Font(Around_button->FontName, Around_button->Font_Color, FO_HORIZONTAL);
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #32
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Font+0
LDR	R0, [SP, #4]
L_DrawRoundButton23:
;MyProject_driver.c,893 :: 		TFT_Write_Text_Return_Pos(Around_button->Caption, Around_button->Left, Around_button->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text_Return_Pos+0
LDR	R0, [SP, #4]
;MyProject_driver.c,894 :: 		if (Around_button->TextAlign == _taLeft)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_DrawRoundButton24
;MyProject_driver.c,895 :: 		ALeft = Around_button->Left + 4;
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ADDS	R1, R1, #4
STRH	R1, [SP, #8]
IT	AL
BAL	L_DrawRoundButton25
L_DrawRoundButton24:
;MyProject_driver.c,896 :: 		else if (Around_button->TextAlign == _taCenter)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRoundButton26
;MyProject_driver.c,897 :: 		ALeft = Around_button->Left + (Around_button->Width - caption_length) / 2;
ADDS	R1, R0, #6
LDRH	R3, [R1, #0]
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R1, R3, R1
STRH	R1, [SP, #8]
IT	AL
BAL	L_DrawRoundButton27
L_DrawRoundButton26:
;MyProject_driver.c,898 :: 		else if (Around_button->TextAlign == _taRight)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	NE
BNE	L_DrawRoundButton28
;MyProject_driver.c,899 :: 		ALeft = Around_button->Left + Around_button->Width - caption_length - 4;
ADDS	R1, R0, #6
LDRH	R2, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R2, R2, R1
UXTH	R2, R2
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
SUBS	R1, R1, #4
STRH	R1, [SP, #8]
L_DrawRoundButton28:
L_DrawRoundButton27:
L_DrawRoundButton25:
;MyProject_driver.c,901 :: 		if (Around_button->TextAlignVertical == _tavTop)
ADDW	R1, R0, #29
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_DrawRoundButton29
;MyProject_driver.c,902 :: 		ATop = Around_button->Top + 3;
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
ADDS	R1, R1, #3
STRH	R1, [SP, #10]
IT	AL
BAL	L_DrawRoundButton30
L_DrawRoundButton29:
;MyProject_driver.c,903 :: 		else if (Around_button->TextAlignVertical == _tavMiddle)
ADDW	R1, R0, #29
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRoundButton31
;MyProject_driver.c,904 :: 		ATop = Around_button->Top + (Around_button->Height - caption_height) / 2;
ADDW	R1, R0, #8
LDRH	R3, [R1, #0]
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R1, R3, R1
STRH	R1, [SP, #10]
IT	AL
BAL	L_DrawRoundButton32
L_DrawRoundButton31:
;MyProject_driver.c,905 :: 		else if (Around_button->TextAlignVertical == _tavBottom)
ADDW	R1, R0, #29
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	NE
BNE	L_DrawRoundButton33
;MyProject_driver.c,906 :: 		ATop  = Around_button->Top + Around_button->Height - caption_height - 4;
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R2, R2, R1
UXTH	R2, R2
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
SUBS	R1, R1, #4
STRH	R1, [SP, #10]
L_DrawRoundButton33:
L_DrawRoundButton32:
L_DrawRoundButton30:
;MyProject_driver.c,908 :: 		TFT_Write_Text(Around_button->Caption, ALeft, ATop);
ADDW	R1, R0, #24
; Around_button end address is: 0 (R0)
LDR	R1, [R1, #0]
LDRH	R2, [SP, #10]
MOV	R0, R1
LDRH	R1, [SP, #8]
BL	_TFT_Write_Text+0
;MyProject_driver.c,909 :: 		}
L_DrawRoundButton19:
;MyProject_driver.c,910 :: 		}
L_end_DrawRoundButton:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _DrawRoundButton
_DrawLabel:
;MyProject_driver.c,912 :: 		void DrawLabel(TLabel *ALabel) {
; ALabel start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; ALabel end address is: 0 (R0)
; ALabel start address is: 0 (R0)
;MyProject_driver.c,913 :: 		if (ALabel->Visible != 0) {
ADDW	R1, R0, #27
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawLabel34
;MyProject_driver.c,914 :: 		if (ALabel->VerticalText != 0)
ADDW	R1, R0, #26
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawLabel35
;MyProject_driver.c,915 :: 		TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_VERTICAL_COLUMN);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #2
BL	_TFT_Set_Font+0
LDR	R0, [SP, #4]
IT	AL
BAL	L_DrawLabel36
L_DrawLabel35:
;MyProject_driver.c,917 :: 		TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_HORIZONTAL);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Font+0
LDR	R0, [SP, #4]
L_DrawLabel36:
;MyProject_driver.c,918 :: 		TFT_Write_Text(ALabel->Caption, ALabel->Left, ALabel->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #16
; ALabel end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text+0
;MyProject_driver.c,919 :: 		}
L_DrawLabel34:
;MyProject_driver.c,920 :: 		}
L_end_DrawLabel:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawLabel
_DrawImage:
;MyProject_driver.c,922 :: 		void DrawImage(TImage *AImage) {
; AImage start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; AImage end address is: 0 (R0)
; AImage start address is: 0 (R0)
;MyProject_driver.c,923 :: 		if (AImage->Visible != 0) {
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawImage37
;MyProject_driver.c,924 :: 		TFT_Image(AImage->Left, AImage->Top, AImage->Picture_Name, AImage->Picture_Ratio);
ADDW	R1, R0, #23
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #16
LDR	R1, [R1, #0]
MOV	R3, R1
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDS	R1, R0, #6
; AImage end address is: 0 (R0)
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
MOV	R2, R3
UXTB	R3, R4
BL	_TFT_Image+0
;MyProject_driver.c,925 :: 		}
L_DrawImage37:
;MyProject_driver.c,926 :: 		}
L_end_DrawImage:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _DrawImage
_DrawBox:
;MyProject_driver.c,928 :: 		void DrawBox(TBox *ABox) {
; ABox start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; ABox end address is: 0 (R0)
; ABox start address is: 0 (R0)
;MyProject_driver.c,929 :: 		if (ABox->Visible != 0) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawBox38
;MyProject_driver.c,930 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawBox39
;MyProject_driver.c,931 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;MyProject_driver.c,932 :: 		TFT_Set_Brush(ABox->Transparent, ABox->Press_Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_End_Color, ABox->Gradient_Start_Color);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #26
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #22
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #32
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;MyProject_driver.c,933 :: 		}
IT	AL
BAL	L_DrawBox40
L_DrawBox39:
;MyProject_driver.c,935 :: 		TFT_Set_Brush(ABox->Transparent, ABox->Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_Start_Color, ABox->Gradient_End_Color);
ADDW	R1, R0, #26
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #22
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #28
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;MyProject_driver.c,936 :: 		}
L_DrawBox40:
;MyProject_driver.c,937 :: 		TFT_Set_Pen(ABox->Pen_Color, ABox->Pen_Width);
ADDW	R1, R0, #14
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R0, #16
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;MyProject_driver.c,938 :: 		TFT_Rectangle(ABox->Left, ABox->Top, ABox->Left + ABox->Width - 1, ABox->Top + ABox->Height - 1);
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R1, R2, R1
UXTH	R1, R1
SUBS	R5, R1, #1
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
; ABox end address is: 0 (R0)
LDRH	R1, [R1, #0]
ADDS	R1, R4, R1
UXTH	R1, R1
SUBS	R3, R1, #1
SXTH	R2, R2
SXTH	R1, R4
SXTH	R0, R1
SXTH	R1, R2
SXTH	R2, R3
SXTH	R3, R5
BL	_TFT_Rectangle+0
;MyProject_driver.c,939 :: 		}
L_DrawBox38:
;MyProject_driver.c,940 :: 		}
L_end_DrawBox:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawBox
_DrawScreen:
;MyProject_driver.c,942 :: 		void DrawScreen(TScreen *aScreen) {
; aScreen start address is: 0 (R0)
SUB	SP, SP, #48
STR	LR, [SP, #0]
; aScreen end address is: 0 (R0)
; aScreen start address is: 0 (R0)
;MyProject_driver.c,956 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;MyProject_driver.c,957 :: 		order = 0;
MOVS	R1, #0
STRH	R1, [SP, #4]
;MyProject_driver.c,958 :: 		button_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #6]
;MyProject_driver.c,959 :: 		round_button_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #12]
;MyProject_driver.c,960 :: 		label_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #20]
;MyProject_driver.c,961 :: 		image_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #28]
;MyProject_driver.c,962 :: 		box_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #36]
;MyProject_driver.c,963 :: 		CurrentScreen = aScreen;
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
STR	R0, [R1, #0]
;MyProject_driver.c,965 :: 		if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
ADDS	R1, R0, #2
; aScreen end address is: 0 (R0)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_width+0)
MOVT	R1, #hi_addr(_display_width+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	NE
BNE	L__DrawScreen188
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #4
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_height+0)
MOVT	R1, #hi_addr(_display_height+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	NE
BNE	L__DrawScreen187
IT	AL
BAL	L_DrawScreen43
L__DrawScreen188:
L__DrawScreen187:
;MyProject_driver.c,966 :: 		save_bled = TFT_BLED;
MOVW	R2, #lo_addr(GPIOF_ODR+0)
MOVT	R2, #hi_addr(GPIOF_ODR+0)
_LX	[R2, ByteOffset(GPIOF_ODR+0)]
STRB	R1, [SP, #44]
;MyProject_driver.c,967 :: 		TFT_BLED           = 0;
MOVS	R1, #0
SXTB	R1, R1
_SX	[R2, ByteOffset(GPIOF_ODR+0)]
;MyProject_driver.c,968 :: 		TFT_Set_Active(Set_Index, Write_Command, Write_Data);
MOVW	R3, #lo_addr(_Write_Data+0)
MOVT	R3, #hi_addr(_Write_Data+0)
MOVW	R2, #lo_addr(_Write_Command+0)
MOVT	R2, #hi_addr(_Write_Command+0)
MOVW	R1, #lo_addr(_Set_Index+0)
MOVT	R1, #hi_addr(_Set_Index+0)
MOV	R0, R1
MOV	R1, R2
MOV	R2, R3
BL	_TFT_Set_Active+0
;MyProject_driver.c,969 :: 		TFT_Init_SSD1963_Board_43(CurrentScreen->Width, CurrentScreen->Height);
MOVW	R3, #lo_addr(_CurrentScreen+0)
MOVT	R3, #hi_addr(_CurrentScreen+0)
LDR	R1, [R3, #0]
ADDS	R1, R1, #4
LDRH	R1, [R1, #0]
UXTH	R2, R1
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #2
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
BL	_TFT_Init_SSD1963_Board_43+0
;MyProject_driver.c,970 :: 		FT5XX6_SetSize(CurrentScreen->Width, CurrentScreen->Height);
MOVW	R3, #lo_addr(_CurrentScreen+0)
MOVT	R3, #hi_addr(_CurrentScreen+0)
LDR	R1, [R3, #0]
ADDS	R1, R1, #4
LDRH	R1, [R1, #0]
UXTH	R2, R1
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #2
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
BL	_FT5XX6_SetSize+0
;MyProject_driver.c,971 :: 		TFT_Fill_Screen(CurrentScreen->Color);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
LDRH	R1, [R1, #0]
UXTH	R0, R1
BL	_TFT_Fill_Screen+0
;MyProject_driver.c,972 :: 		TFT_Set_DBC_SSD1963(255);
MOVS	R0, #255
BL	_TFT_Set_DBC_SSD1963+0
;MyProject_driver.c,973 :: 		display_width = CurrentScreen->Width;
MOVW	R3, #lo_addr(_CurrentScreen+0)
MOVT	R3, #hi_addr(_CurrentScreen+0)
LDR	R1, [R3, #0]
ADDS	R1, R1, #2
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_width+0)
MOVT	R1, #hi_addr(_display_width+0)
STRH	R2, [R1, #0]
;MyProject_driver.c,974 :: 		display_height = CurrentScreen->Height;
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #4
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_height+0)
MOVT	R1, #hi_addr(_display_height+0)
STRH	R2, [R1, #0]
;MyProject_driver.c,975 :: 		TFT_BLED           = save_bled;
LDRB	R2, [SP, #44]
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;MyProject_driver.c,976 :: 		}
IT	AL
BAL	L_DrawScreen44
L_DrawScreen43:
;MyProject_driver.c,978 :: 		TFT_Fill_Screen(CurrentScreen->Color);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
LDRH	R1, [R1, #0]
UXTH	R0, R1
BL	_TFT_Fill_Screen+0
L_DrawScreen44:
;MyProject_driver.c,981 :: 		while (order < CurrentScreen->ObjectsCount) {
L_DrawScreen45:
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #6
LDRH	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen46
;MyProject_driver.c,982 :: 		if (button_idx < CurrentScreen->ButtonsCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #8
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #6]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen47
;MyProject_driver.c,983 :: 		local_button = GetButton(button_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #12
LDR	R2, [R1, #0]
LDRB	R1, [SP, #6]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #8]
;MyProject_driver.c,984 :: 		if (order == local_button->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen48
;MyProject_driver.c,985 :: 		button_idx++;
LDRB	R1, [SP, #6]
ADDS	R1, R1, #1
STRB	R1, [SP, #6]
;MyProject_driver.c,986 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;MyProject_driver.c,987 :: 		DrawButton(local_button);
LDR	R0, [SP, #8]
BL	_DrawButton+0
;MyProject_driver.c,988 :: 		}
L_DrawScreen48:
;MyProject_driver.c,989 :: 		}
L_DrawScreen47:
;MyProject_driver.c,991 :: 		if (round_button_idx < CurrentScreen->Buttons_RoundCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #16
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #12]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen49
;MyProject_driver.c,992 :: 		local_round_button = GetRoundButton(round_button_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #20
LDR	R2, [R1, #0]
LDRB	R1, [SP, #12]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #16]
;MyProject_driver.c,993 :: 		if (order == local_round_button->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen50
;MyProject_driver.c,994 :: 		round_button_idx++;
LDRB	R1, [SP, #12]
ADDS	R1, R1, #1
STRB	R1, [SP, #12]
;MyProject_driver.c,995 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;MyProject_driver.c,996 :: 		DrawRoundButton(local_round_button);
LDR	R0, [SP, #16]
BL	_DrawRoundButton+0
;MyProject_driver.c,997 :: 		}
L_DrawScreen50:
;MyProject_driver.c,998 :: 		}
L_DrawScreen49:
;MyProject_driver.c,1000 :: 		if (label_idx < CurrentScreen->LabelsCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #24
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #20]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen51
;MyProject_driver.c,1001 :: 		local_label = GetLabel(label_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #28
LDR	R2, [R1, #0]
LDRB	R1, [SP, #20]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #24]
;MyProject_driver.c,1002 :: 		if (order == local_label->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen52
;MyProject_driver.c,1003 :: 		label_idx++;
LDRB	R1, [SP, #20]
ADDS	R1, R1, #1
STRB	R1, [SP, #20]
;MyProject_driver.c,1004 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;MyProject_driver.c,1005 :: 		DrawLabel(local_label);
LDR	R0, [SP, #24]
BL	_DrawLabel+0
;MyProject_driver.c,1006 :: 		}
L_DrawScreen52:
;MyProject_driver.c,1007 :: 		}
L_DrawScreen51:
;MyProject_driver.c,1009 :: 		if (box_idx < CurrentScreen->BoxesCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #40
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #36]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen53
;MyProject_driver.c,1010 :: 		local_box = GetBox(box_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #44
LDR	R2, [R1, #0]
LDRB	R1, [SP, #36]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #40]
;MyProject_driver.c,1011 :: 		if (order == local_box->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen54
;MyProject_driver.c,1012 :: 		box_idx++;
LDRB	R1, [SP, #36]
ADDS	R1, R1, #1
STRB	R1, [SP, #36]
;MyProject_driver.c,1013 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;MyProject_driver.c,1014 :: 		DrawBox(local_box);
LDR	R0, [SP, #40]
BL	_DrawBox+0
;MyProject_driver.c,1015 :: 		}
L_DrawScreen54:
;MyProject_driver.c,1016 :: 		}
L_DrawScreen53:
;MyProject_driver.c,1018 :: 		if (image_idx < CurrentScreen->ImagesCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #32
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #28]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen55
;MyProject_driver.c,1019 :: 		local_image = GetImage(image_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #36
LDR	R2, [R1, #0]
LDRB	R1, [SP, #28]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #32]
;MyProject_driver.c,1020 :: 		if (order == local_image->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen56
;MyProject_driver.c,1021 :: 		image_idx++;
LDRB	R1, [SP, #28]
ADDS	R1, R1, #1
STRB	R1, [SP, #28]
;MyProject_driver.c,1022 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;MyProject_driver.c,1023 :: 		DrawImage(local_image);
LDR	R0, [SP, #32]
BL	_DrawImage+0
;MyProject_driver.c,1024 :: 		}
L_DrawScreen56:
;MyProject_driver.c,1025 :: 		}
L_DrawScreen55:
;MyProject_driver.c,1027 :: 		}
IT	AL
BAL	L_DrawScreen45
L_DrawScreen46:
;MyProject_driver.c,1028 :: 		}
L_end_DrawScreen:
LDR	LR, [SP, #0]
ADD	SP, SP, #48
BX	LR
; end of _DrawScreen
_Get_Object:
;MyProject_driver.c,1030 :: 		void Get_Object(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;MyProject_driver.c,1031 :: 		button_order        = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_button_order+0)
MOVT	R2, #hi_addr(_button_order+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1032 :: 		round_button_order  = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1033 :: 		label_order         = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1034 :: 		image_order         = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1035 :: 		box_order           = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1037 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ButtonsCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; X end address is: 0 (R0)
; Y end address is: 4 (R1)
UXTH	R8, R0
UXTH	R7, R1
L_Get_Object57:
; Y start address is: 28 (R7)
; X start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object58
;MyProject_driver.c,1038 :: 		local_button = GetButton(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #12
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_button+0)
MOVT	R2, #hi_addr(_local_button+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1039 :: 		if (local_button->Active != 0) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Get_Object60
;MyProject_driver.c,1041 :: 		local_button->Width, local_button->Height) == 1) {
MOVW	R6, #lo_addr(_local_button+0)
MOVT	R6, #hi_addr(_local_button+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;MyProject_driver.c,1040 :: 		if (IsInsideObject(X, Y, local_button->Left, local_button->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R7
UXTH	R0, R8
;MyProject_driver.c,1041 :: 		local_button->Width, local_button->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	MyProject_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object61
;MyProject_driver.c,1042 :: 		button_order = local_button->Order;
MOVW	R4, #lo_addr(_local_button+0)
MOVT	R4, #hi_addr(_local_button+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_button_order+0)
MOVT	R2, #hi_addr(_button_order+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1043 :: 		exec_button = local_button;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1044 :: 		}
L_Get_Object61:
;MyProject_driver.c,1045 :: 		}
L_Get_Object60:
;MyProject_driver.c,1037 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ButtonsCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;MyProject_driver.c,1046 :: 		}
IT	AL
BAL	L_Get_Object57
L_Get_Object58:
;MyProject_driver.c,1049 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object62:
; X start address is: 28 (R7)
; Y start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #16
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object63
;MyProject_driver.c,1050 :: 		local_round_button = GetRoundButton(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #20
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_round_button+0)
MOVT	R2, #hi_addr(_local_round_button+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1051 :: 		if (local_round_button->Active != 0) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Get_Object65
;MyProject_driver.c,1053 :: 		local_round_button->Width, local_round_button->Height) == 1) {
MOVW	R6, #lo_addr(_local_round_button+0)
MOVT	R6, #hi_addr(_local_round_button+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;MyProject_driver.c,1052 :: 		if (IsInsideObject(X, Y, local_round_button->Left, local_round_button->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R8
UXTH	R0, R7
;MyProject_driver.c,1053 :: 		local_round_button->Width, local_round_button->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	MyProject_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object66
;MyProject_driver.c,1054 :: 		round_button_order = local_round_button->Order;
MOVW	R4, #lo_addr(_local_round_button+0)
MOVT	R4, #hi_addr(_local_round_button+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1055 :: 		exec_round_button = local_round_button;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1056 :: 		}
L_Get_Object66:
;MyProject_driver.c,1057 :: 		}
L_Get_Object65:
;MyProject_driver.c,1049 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;MyProject_driver.c,1058 :: 		}
IT	AL
BAL	L_Get_Object62
L_Get_Object63:
;MyProject_driver.c,1061 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; X end address is: 28 (R7)
; Y end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object67:
; Y start address is: 28 (R7)
; X start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #24
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object68
;MyProject_driver.c,1062 :: 		local_label = GetLabel(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_label+0)
MOVT	R2, #hi_addr(_local_label+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1063 :: 		if (local_label->Active != 0) {
ADDW	R2, R3, #28
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Get_Object70
;MyProject_driver.c,1065 :: 		local_label->Width, local_label->Height) == 1) {
MOVW	R6, #lo_addr(_local_label+0)
MOVT	R6, #hi_addr(_local_label+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;MyProject_driver.c,1064 :: 		if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R7
UXTH	R0, R8
;MyProject_driver.c,1065 :: 		local_label->Width, local_label->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	MyProject_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object71
;MyProject_driver.c,1066 :: 		label_order = local_label->Order;
MOVW	R4, #lo_addr(_local_label+0)
MOVT	R4, #hi_addr(_local_label+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1067 :: 		exec_label = local_label;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1068 :: 		}
L_Get_Object71:
;MyProject_driver.c,1069 :: 		}
L_Get_Object70:
;MyProject_driver.c,1061 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;MyProject_driver.c,1070 :: 		}
IT	AL
BAL	L_Get_Object67
L_Get_Object68:
;MyProject_driver.c,1073 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object72:
; X start address is: 28 (R7)
; Y start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #32
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object73
;MyProject_driver.c,1074 :: 		local_image = GetImage(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #36
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_image+0)
MOVT	R2, #hi_addr(_local_image+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1075 :: 		if (local_image->Active != 0) {
ADDW	R2, R3, #21
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Get_Object75
;MyProject_driver.c,1077 :: 		local_image->Width, local_image->Height) == 1) {
MOVW	R6, #lo_addr(_local_image+0)
MOVT	R6, #hi_addr(_local_image+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;MyProject_driver.c,1076 :: 		if (IsInsideObject(X, Y, local_image->Left, local_image->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R8
UXTH	R0, R7
;MyProject_driver.c,1077 :: 		local_image->Width, local_image->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	MyProject_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object76
;MyProject_driver.c,1078 :: 		image_order = local_image->Order;
MOVW	R4, #lo_addr(_local_image+0)
MOVT	R4, #hi_addr(_local_image+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1079 :: 		exec_image = local_image;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1080 :: 		}
L_Get_Object76:
;MyProject_driver.c,1081 :: 		}
L_Get_Object75:
;MyProject_driver.c,1073 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;MyProject_driver.c,1082 :: 		}
IT	AL
BAL	L_Get_Object72
L_Get_Object73:
;MyProject_driver.c,1085 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->BoxesCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; X end address is: 28 (R7)
; Y end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object77:
; X start address is: 32 (R8)
; Y start address is: 28 (R7)
; Y start address is: 28 (R7)
; Y end address is: 28 (R7)
; X start address is: 32 (R8)
; X end address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #40
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object78
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
;MyProject_driver.c,1086 :: 		local_box = GetBox(_object_count);
; X start address is: 32 (R8)
; Y start address is: 28 (R7)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #44
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_box+0)
MOVT	R2, #hi_addr(_local_box+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1087 :: 		if (local_box->Active != 0) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Get_Object80
;MyProject_driver.c,1089 :: 		local_box->Width, local_box->Height) == 1) {
MOVW	R6, #lo_addr(_local_box+0)
MOVT	R6, #hi_addr(_local_box+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;MyProject_driver.c,1088 :: 		if (IsInsideObject(X, Y, local_box->Left, local_box->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R7
UXTH	R0, R8
;MyProject_driver.c,1089 :: 		local_box->Width, local_box->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	MyProject_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object81
;MyProject_driver.c,1090 :: 		box_order = local_box->Order;
MOVW	R4, #lo_addr(_local_box+0)
MOVT	R4, #hi_addr(_local_box+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1091 :: 		exec_box = local_box;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1092 :: 		}
L_Get_Object81:
;MyProject_driver.c,1093 :: 		}
L_Get_Object80:
;MyProject_driver.c,1085 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->BoxesCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;MyProject_driver.c,1094 :: 		}
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
IT	AL
BAL	L_Get_Object77
L_Get_Object78:
;MyProject_driver.c,1096 :: 		_object_count = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1097 :: 		if (button_order >  _object_count )
MOVW	R2, #lo_addr(_button_order+0)
MOVT	R2, #hi_addr(_button_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	LE
BLE	L_Get_Object82
;MyProject_driver.c,1098 :: 		_object_count = button_order;
MOVW	R2, #lo_addr(_button_order+0)
MOVT	R2, #hi_addr(_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object82:
;MyProject_driver.c,1099 :: 		if (round_button_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object83
;MyProject_driver.c,1100 :: 		_object_count = round_button_order;
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object83:
;MyProject_driver.c,1101 :: 		if (label_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object84
;MyProject_driver.c,1102 :: 		_object_count = label_order;
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object84:
;MyProject_driver.c,1103 :: 		if (image_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object85
;MyProject_driver.c,1104 :: 		_object_count = image_order;
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object85:
;MyProject_driver.c,1105 :: 		if (box_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object86
;MyProject_driver.c,1106 :: 		_object_count = box_order;
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object86:
;MyProject_driver.c,1107 :: 		}
L_end_Get_Object:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Get_Object
_Process_TP_Press:
;MyProject_driver.c,1110 :: 		void Process_TP_Press(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;MyProject_driver.c,1111 :: 		exec_button         = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1112 :: 		exec_round_button   = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1113 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1114 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1115 :: 		exec_box            = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1117 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;MyProject_driver.c,1119 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_Process_TP_Press87
;MyProject_driver.c,1120 :: 		if (_object_count == button_order) {
MOVW	R2, #lo_addr(_button_order+0)
MOVT	R2, #hi_addr(_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press88
;MyProject_driver.c,1121 :: 		if (exec_button->Active != 0) {
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Press89
;MyProject_driver.c,1122 :: 		if (exec_button->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press90
;MyProject_driver.c,1123 :: 		exec_button->OnPressPtr();
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R2, [R4, #0]
BLX	R2
;MyProject_driver.c,1124 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;MyProject_driver.c,1125 :: 		}
L_Process_TP_Press90:
;MyProject_driver.c,1126 :: 		}
L_Process_TP_Press89:
;MyProject_driver.c,1127 :: 		}
L_Process_TP_Press88:
;MyProject_driver.c,1129 :: 		if (_object_count == round_button_order) {
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press91
;MyProject_driver.c,1130 :: 		if (exec_round_button->Active != 0) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Press92
;MyProject_driver.c,1131 :: 		if (exec_round_button->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press93
;MyProject_driver.c,1132 :: 		exec_round_button->OnPressPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R2, [R4, #0]
BLX	R2
;MyProject_driver.c,1133 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;MyProject_driver.c,1134 :: 		}
L_Process_TP_Press93:
;MyProject_driver.c,1135 :: 		}
L_Process_TP_Press92:
;MyProject_driver.c,1136 :: 		}
L_Process_TP_Press91:
;MyProject_driver.c,1138 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press94
;MyProject_driver.c,1139 :: 		if (exec_label->Active != 0) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Press95
;MyProject_driver.c,1140 :: 		if (exec_label->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press96
;MyProject_driver.c,1141 :: 		exec_label->OnPressPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R2, [R4, #0]
BLX	R2
;MyProject_driver.c,1142 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;MyProject_driver.c,1143 :: 		}
L_Process_TP_Press96:
;MyProject_driver.c,1144 :: 		}
L_Process_TP_Press95:
;MyProject_driver.c,1145 :: 		}
L_Process_TP_Press94:
;MyProject_driver.c,1147 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press97
;MyProject_driver.c,1148 :: 		if (exec_image->Active != 0) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Press98
;MyProject_driver.c,1149 :: 		if (exec_image->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press99
;MyProject_driver.c,1150 :: 		exec_image->OnPressPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
;MyProject_driver.c,1151 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;MyProject_driver.c,1152 :: 		}
L_Process_TP_Press99:
;MyProject_driver.c,1153 :: 		}
L_Process_TP_Press98:
;MyProject_driver.c,1154 :: 		}
L_Process_TP_Press97:
;MyProject_driver.c,1156 :: 		if (_object_count == box_order) {
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press100
;MyProject_driver.c,1157 :: 		if (exec_box->Active != 0) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Press101
;MyProject_driver.c,1158 :: 		if (exec_box->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press102
;MyProject_driver.c,1159 :: 		exec_box->OnPressPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R2, [R4, #0]
BLX	R2
;MyProject_driver.c,1160 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;MyProject_driver.c,1161 :: 		}
L_Process_TP_Press102:
;MyProject_driver.c,1162 :: 		}
L_Process_TP_Press101:
;MyProject_driver.c,1163 :: 		}
L_Process_TP_Press100:
;MyProject_driver.c,1165 :: 		}
L_Process_TP_Press87:
;MyProject_driver.c,1166 :: 		}
L_end_Process_TP_Press:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Process_TP_Press
_Process_TP_Up:
;MyProject_driver.c,1168 :: 		void Process_TP_Up(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;MyProject_driver.c,1170 :: 		switch (PressedObjectType) {
IT	AL
BAL	L_Process_TP_Up103
;MyProject_driver.c,1172 :: 		case 0: {
L_Process_TP_Up105:
;MyProject_driver.c,1173 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up106
;MyProject_driver.c,1174 :: 		exec_button = (TButton*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1175 :: 		if ((exec_button->PressColEnabled != 0) && (exec_button->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #48
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L__Process_TP_Up193
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L__Process_TP_Up192
L__Process_TP_Up191:
;MyProject_driver.c,1176 :: 		DrawButton(exec_button);
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawButton+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;MyProject_driver.c,1175 :: 		if ((exec_button->PressColEnabled != 0) && (exec_button->OwnerScreen == CurrentScreen)) {
L__Process_TP_Up193:
L__Process_TP_Up192:
;MyProject_driver.c,1178 :: 		break;
IT	AL
BAL	L_Process_TP_Up104
;MyProject_driver.c,1179 :: 		}
L_Process_TP_Up106:
;MyProject_driver.c,1180 :: 		break;
IT	AL
BAL	L_Process_TP_Up104
;MyProject_driver.c,1183 :: 		case 1: {
L_Process_TP_Up110:
;MyProject_driver.c,1184 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up111
;MyProject_driver.c,1185 :: 		exec_round_button = (TButton_Round*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1186 :: 		if ((exec_round_button->PressColEnabled != 0) && (exec_round_button->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #49
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L__Process_TP_Up195
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L__Process_TP_Up194
L__Process_TP_Up190:
;MyProject_driver.c,1187 :: 		DrawRoundButton(exec_round_button);
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawRoundButton+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;MyProject_driver.c,1186 :: 		if ((exec_round_button->PressColEnabled != 0) && (exec_round_button->OwnerScreen == CurrentScreen)) {
L__Process_TP_Up195:
L__Process_TP_Up194:
;MyProject_driver.c,1189 :: 		break;
IT	AL
BAL	L_Process_TP_Up104
;MyProject_driver.c,1190 :: 		}
L_Process_TP_Up111:
;MyProject_driver.c,1191 :: 		break;
IT	AL
BAL	L_Process_TP_Up104
;MyProject_driver.c,1194 :: 		case 6: {
L_Process_TP_Up115:
;MyProject_driver.c,1195 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up116
;MyProject_driver.c,1196 :: 		exec_box = (TBox*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1197 :: 		if ((exec_box->PressColEnabled != 0) && (exec_box->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #30
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L__Process_TP_Up197
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L__Process_TP_Up196
L__Process_TP_Up189:
;MyProject_driver.c,1198 :: 		DrawBox(exec_box);
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawBox+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;MyProject_driver.c,1197 :: 		if ((exec_box->PressColEnabled != 0) && (exec_box->OwnerScreen == CurrentScreen)) {
L__Process_TP_Up197:
L__Process_TP_Up196:
;MyProject_driver.c,1200 :: 		break;
IT	AL
BAL	L_Process_TP_Up104
;MyProject_driver.c,1201 :: 		}
L_Process_TP_Up116:
;MyProject_driver.c,1202 :: 		break;
IT	AL
BAL	L_Process_TP_Up104
;MyProject_driver.c,1204 :: 		}
L_Process_TP_Up103:
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up105
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #1
IT	EQ
BEQ	L_Process_TP_Up110
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #6
IT	EQ
BEQ	L_Process_TP_Up115
L_Process_TP_Up104:
;MyProject_driver.c,1206 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1207 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1209 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;MyProject_driver.c,1212 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_Process_TP_Up120
;MyProject_driver.c,1214 :: 		if (_object_count == button_order) {
MOVW	R2, #lo_addr(_button_order+0)
MOVT	R2, #hi_addr(_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up121
;MyProject_driver.c,1215 :: 		if (exec_button->Active != 0) {
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up122
;MyProject_driver.c,1216 :: 		if (exec_button->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up123
;MyProject_driver.c,1217 :: 		exec_button->OnUpPtr();
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up123:
;MyProject_driver.c,1218 :: 		if (PressedObject == (void *)exec_button)
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up124
;MyProject_driver.c,1219 :: 		if (exec_button->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up125
;MyProject_driver.c,1220 :: 		exec_button->OnClickPtr();
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up125:
L_Process_TP_Up124:
;MyProject_driver.c,1221 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1222 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1223 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;MyProject_driver.c,1224 :: 		}
L_Process_TP_Up122:
;MyProject_driver.c,1225 :: 		}
L_Process_TP_Up121:
;MyProject_driver.c,1228 :: 		if (_object_count == round_button_order) {
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up126
;MyProject_driver.c,1229 :: 		if (exec_round_button->Active != 0) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up127
;MyProject_driver.c,1230 :: 		if (exec_round_button->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up128
;MyProject_driver.c,1231 :: 		exec_round_button->OnUpPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up128:
;MyProject_driver.c,1232 :: 		if (PressedObject == (void *)exec_round_button)
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up129
;MyProject_driver.c,1233 :: 		if (exec_round_button->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up130
;MyProject_driver.c,1234 :: 		exec_round_button->OnClickPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up130:
L_Process_TP_Up129:
;MyProject_driver.c,1235 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1236 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1237 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;MyProject_driver.c,1238 :: 		}
L_Process_TP_Up127:
;MyProject_driver.c,1239 :: 		}
L_Process_TP_Up126:
;MyProject_driver.c,1242 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up131
;MyProject_driver.c,1243 :: 		if (exec_label->Active != 0) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up132
;MyProject_driver.c,1244 :: 		if (exec_label->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up133
;MyProject_driver.c,1245 :: 		exec_label->OnUpPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up133:
;MyProject_driver.c,1246 :: 		if (PressedObject == (void *)exec_label)
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up134
;MyProject_driver.c,1247 :: 		if (exec_label->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up135
;MyProject_driver.c,1248 :: 		exec_label->OnClickPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up135:
L_Process_TP_Up134:
;MyProject_driver.c,1249 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1250 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1251 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;MyProject_driver.c,1252 :: 		}
L_Process_TP_Up132:
;MyProject_driver.c,1253 :: 		}
L_Process_TP_Up131:
;MyProject_driver.c,1256 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up136
;MyProject_driver.c,1257 :: 		if (exec_image->Active != 0) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up137
;MyProject_driver.c,1258 :: 		if (exec_image->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #24
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up138
;MyProject_driver.c,1259 :: 		exec_image->OnUpPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #24
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up138:
;MyProject_driver.c,1260 :: 		if (PressedObject == (void *)exec_image)
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up139
;MyProject_driver.c,1261 :: 		if (exec_image->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up140
;MyProject_driver.c,1262 :: 		exec_image->OnClickPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up140:
L_Process_TP_Up139:
;MyProject_driver.c,1263 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1264 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1265 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;MyProject_driver.c,1266 :: 		}
L_Process_TP_Up137:
;MyProject_driver.c,1267 :: 		}
L_Process_TP_Up136:
;MyProject_driver.c,1270 :: 		if (_object_count == box_order) {
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up141
;MyProject_driver.c,1271 :: 		if (exec_box->Active != 0) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up142
;MyProject_driver.c,1272 :: 		if (exec_box->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up143
;MyProject_driver.c,1273 :: 		exec_box->OnUpPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up143:
;MyProject_driver.c,1274 :: 		if (PressedObject == (void *)exec_box)
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up144
;MyProject_driver.c,1275 :: 		if (exec_box->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up145
;MyProject_driver.c,1276 :: 		exec_box->OnClickPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up145:
L_Process_TP_Up144:
;MyProject_driver.c,1277 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1278 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1279 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;MyProject_driver.c,1280 :: 		}
L_Process_TP_Up142:
;MyProject_driver.c,1281 :: 		}
L_Process_TP_Up141:
;MyProject_driver.c,1283 :: 		}
L_Process_TP_Up120:
;MyProject_driver.c,1284 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1285 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1286 :: 		}
L_end_Process_TP_Up:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Process_TP_Up
_Process_TP_Down:
;MyProject_driver.c,1288 :: 		void Process_TP_Down(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;MyProject_driver.c,1290 :: 		object_pressed      = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;MyProject_driver.c,1291 :: 		exec_button         = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1292 :: 		exec_round_button   = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1293 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1294 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1295 :: 		exec_box            = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1297 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;MyProject_driver.c,1299 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_Process_TP_Down146
;MyProject_driver.c,1300 :: 		if (_object_count == button_order) {
MOVW	R2, #lo_addr(_button_order+0)
MOVT	R2, #hi_addr(_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down147
;MyProject_driver.c,1301 :: 		if (exec_button->Active != 0) {
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down148
;MyProject_driver.c,1302 :: 		if (exec_button->PressColEnabled != 0) {
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #48
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down149
;MyProject_driver.c,1303 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;MyProject_driver.c,1304 :: 		DrawButton(exec_button);
MOVW	R2, #lo_addr(_exec_button+0)
MOVT	R2, #hi_addr(_exec_button+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawButton+0
;MyProject_driver.c,1305 :: 		}
L_Process_TP_Down149:
;MyProject_driver.c,1306 :: 		PressedObject = (void *)exec_button;
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1307 :: 		PressedObjectType = 0;
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1308 :: 		if (exec_button->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down150
;MyProject_driver.c,1309 :: 		exec_button->OnDownPtr();
MOVW	R4, #lo_addr(_exec_button+0)
MOVT	R4, #hi_addr(_exec_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R2, [R4, #0]
BLX	R2
;MyProject_driver.c,1310 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;MyProject_driver.c,1311 :: 		}
L_Process_TP_Down150:
;MyProject_driver.c,1312 :: 		}
L_Process_TP_Down148:
;MyProject_driver.c,1313 :: 		}
L_Process_TP_Down147:
;MyProject_driver.c,1315 :: 		if (_object_count == round_button_order) {
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down151
;MyProject_driver.c,1316 :: 		if (exec_round_button->Active != 0) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down152
;MyProject_driver.c,1317 :: 		if (exec_round_button->PressColEnabled != 0) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #49
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down153
;MyProject_driver.c,1318 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;MyProject_driver.c,1319 :: 		DrawRoundButton(exec_round_button);
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawRoundButton+0
;MyProject_driver.c,1320 :: 		}
L_Process_TP_Down153:
;MyProject_driver.c,1321 :: 		PressedObject = (void *)exec_round_button;
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1322 :: 		PressedObjectType = 1;
MOVS	R3, #1
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1323 :: 		if (exec_round_button->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down154
;MyProject_driver.c,1324 :: 		exec_round_button->OnDownPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R2, [R4, #0]
BLX	R2
;MyProject_driver.c,1325 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;MyProject_driver.c,1326 :: 		}
L_Process_TP_Down154:
;MyProject_driver.c,1327 :: 		}
L_Process_TP_Down152:
;MyProject_driver.c,1328 :: 		}
L_Process_TP_Down151:
;MyProject_driver.c,1330 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down155
;MyProject_driver.c,1331 :: 		if (exec_label->Active != 0) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down156
;MyProject_driver.c,1332 :: 		PressedObject = (void *)exec_label;
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1333 :: 		PressedObjectType = 2;
MOVS	R3, #2
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1334 :: 		if (exec_label->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down157
;MyProject_driver.c,1335 :: 		exec_label->OnDownPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
;MyProject_driver.c,1336 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;MyProject_driver.c,1337 :: 		}
L_Process_TP_Down157:
;MyProject_driver.c,1338 :: 		}
L_Process_TP_Down156:
;MyProject_driver.c,1339 :: 		}
L_Process_TP_Down155:
;MyProject_driver.c,1341 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down158
;MyProject_driver.c,1342 :: 		if (exec_image->Active != 0) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down159
;MyProject_driver.c,1343 :: 		PressedObject = (void *)exec_image;
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1344 :: 		PressedObjectType = 3;
MOVS	R3, #3
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1345 :: 		if (exec_image->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down160
;MyProject_driver.c,1346 :: 		exec_image->OnDownPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R2, [R4, #0]
BLX	R2
;MyProject_driver.c,1347 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;MyProject_driver.c,1348 :: 		}
L_Process_TP_Down160:
;MyProject_driver.c,1349 :: 		}
L_Process_TP_Down159:
;MyProject_driver.c,1350 :: 		}
L_Process_TP_Down158:
;MyProject_driver.c,1352 :: 		if (_object_count == box_order) {
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down161
;MyProject_driver.c,1353 :: 		if (exec_box->Active != 0) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down162
;MyProject_driver.c,1354 :: 		if (exec_box->PressColEnabled != 0) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #30
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down163
;MyProject_driver.c,1355 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;MyProject_driver.c,1356 :: 		DrawBox(exec_box);
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawBox+0
;MyProject_driver.c,1357 :: 		}
L_Process_TP_Down163:
;MyProject_driver.c,1358 :: 		PressedObject = (void *)exec_box;
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MyProject_driver.c,1359 :: 		PressedObjectType = 6;
MOVS	R3, #6
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,1360 :: 		if (exec_box->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down164
;MyProject_driver.c,1361 :: 		exec_box->OnDownPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R2, [R4, #0]
BLX	R2
;MyProject_driver.c,1362 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;MyProject_driver.c,1363 :: 		}
L_Process_TP_Down164:
;MyProject_driver.c,1364 :: 		}
L_Process_TP_Down162:
;MyProject_driver.c,1365 :: 		}
L_Process_TP_Down161:
;MyProject_driver.c,1367 :: 		}
L_Process_TP_Down146:
;MyProject_driver.c,1368 :: 		}
L_end_Process_TP_Down:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Process_TP_Down
_Check_TP:
;MyProject_driver.c,1370 :: 		void Check_TP() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_driver.c,1371 :: 		if (FT5XX6_PressDetect()) {
BL	_FT5XX6_PressDetect+0
CMP	R0, #0
IT	EQ
BEQ	L_Check_TP165
;MyProject_driver.c,1372 :: 		if (FT5XX6_GetCoordinates(&Xcoord, &Ycoord) == 0) {
MOVW	R1, #lo_addr(_Ycoord+0)
MOVT	R1, #hi_addr(_Ycoord+0)
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
BL	_FT5XX6_GetCoordinates+0
CMP	R0, #0
IT	NE
BNE	L_Check_TP166
;MyProject_driver.c,1374 :: 		Process_TP_Press(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	_Process_TP_Press+0
;MyProject_driver.c,1375 :: 		if (PenDown == 0) {
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Check_TP167
;MyProject_driver.c,1376 :: 		PenDown = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;MyProject_driver.c,1377 :: 		Process_TP_Down(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	_Process_TP_Down+0
;MyProject_driver.c,1378 :: 		}
L_Check_TP167:
;MyProject_driver.c,1379 :: 		}
L_Check_TP166:
;MyProject_driver.c,1380 :: 		}
IT	AL
BAL	L_Check_TP168
L_Check_TP165:
;MyProject_driver.c,1381 :: 		else if (PenDown == 1) {
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_Check_TP169
;MyProject_driver.c,1382 :: 		PenDown = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;MyProject_driver.c,1383 :: 		Process_TP_Up(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	_Process_TP_Up+0
;MyProject_driver.c,1384 :: 		}
L_Check_TP169:
L_Check_TP168:
;MyProject_driver.c,1385 :: 		}
L_end_Check_TP:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Check_TP
_Init_MCU:
;MyProject_driver.c,1387 :: 		void Init_MCU() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_driver.c,1388 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_6);
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;MyProject_driver.c,1389 :: 		GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
;MyProject_driver.c,1390 :: 		GPIOB_ODR.B6 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;MyProject_driver.c,1391 :: 		while (GPIOB_IDR.B7 == 0) {
L_Init_MCU170:
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
_LX	[R0, ByteOffset(GPIOB_IDR+0)]
CMP	R0, #0
IT	NE
BNE	L_Init_MCU171
;MyProject_driver.c,1392 :: 		GPIOB_ODR.B6 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;MyProject_driver.c,1393 :: 		Delay_us(10);
MOVW	R7, #558
MOVT	R7, #0
NOP
NOP
L_Init_MCU172:
SUBS	R7, R7, #1
BNE	L_Init_MCU172
NOP
NOP
NOP
;MyProject_driver.c,1394 :: 		GPIOB_ODR.B6 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;MyProject_driver.c,1395 :: 		Delay_us(10);
MOVW	R7, #558
MOVT	R7, #0
NOP
NOP
L_Init_MCU174:
SUBS	R7, R7, #1
BNE	L_Init_MCU174
NOP
NOP
NOP
;MyProject_driver.c,1396 :: 		}
IT	AL
BAL	L_Init_MCU170
L_Init_MCU171:
;MyProject_driver.c,1397 :: 		I2C1_Init_Advanced(400000, &_GPIO_MODULE_I2C1_PB67);
MOVW	R1, #lo_addr(__GPIO_MODULE_I2C1_PB67+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_I2C1_PB67+0)
MOVW	R0, #6784
MOVT	R0, #6
BL	_I2C1_Init_Advanced+0
;MyProject_driver.c,1398 :: 		}
L_end_Init_MCU:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_MCU
_FT5XX6_Config:
;MyProject_driver.c,1400 :: 		char FT5XX6_Config()  {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_driver.c,1401 :: 		FT5XX6_SetI2CAddress(0x38);
MOVS	R0, #56
BL	_FT5XX6_SetI2CAddress+0
;MyProject_driver.c,1402 :: 		if (FT5XX6_IsOperational() != FT5XX6_OK)
BL	_FT5XX6_IsOperational+0
CMP	R0, #0
IT	EQ
BEQ	L_FT5XX6_Config176
;MyProject_driver.c,1403 :: 		return  FT5XX6_FAILURE;
MOVS	R0, #1
IT	AL
BAL	L_end_FT5XX6_Config
L_FT5XX6_Config176:
;MyProject_driver.c,1404 :: 		FT5XX6_SetDefaultMode();
BL	_FT5XX6_SetDefaultMode+0
;MyProject_driver.c,1405 :: 		FT5XX6_SetController(_TC_FT5X16);
MOVS	R0, #2
BL	_FT5XX6_SetController+0
;MyProject_driver.c,1406 :: 		FT5XX6_SetSizeAndRotation(480,272,0);
MOVS	R2, #0
MOVW	R1, #272
MOVW	R0, #480
BL	_FT5XX6_SetSizeAndRotation+0
;MyProject_driver.c,1407 :: 		return FT5XX6_OK;
MOVS	R0, #0
;MyProject_driver.c,1408 :: 		}
L_end_FT5XX6_Config:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _FT5XX6_Config
_Start_TP:
;MyProject_driver.c,1410 :: 		void Start_TP() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_driver.c,1411 :: 		Init_MCU();
BL	_Init_MCU+0
;MyProject_driver.c,1413 :: 		InitializeTouchPanel();
BL	MyProject_driver_InitializeTouchPanel+0
;MyProject_driver.c,1414 :: 		if (FT5XX6_Config() == FT5XX6_OK) {
BL	_FT5XX6_Config+0
CMP	R0, #0
IT	NE
BNE	L_Start_TP177
;MyProject_driver.c,1415 :: 		} else {
IT	AL
BAL	L_Start_TP178
L_Start_TP177:
;MyProject_driver.c,1416 :: 		while(1);
L_Start_TP179:
IT	AL
BAL	L_Start_TP179
;MyProject_driver.c,1417 :: 		}
L_Start_TP178:
;MyProject_driver.c,1420 :: 		InitializeObjects();
BL	MyProject_driver_InitializeObjects+0
;MyProject_driver.c,1421 :: 		display_width = Screen1.Width;
MOVW	R0, #lo_addr(_Screen1+2)
MOVT	R0, #hi_addr(_Screen1+2)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_display_width+0)
MOVT	R0, #hi_addr(_display_width+0)
STRH	R1, [R0, #0]
;MyProject_driver.c,1422 :: 		display_height = Screen1.Height;
MOVW	R0, #lo_addr(_Screen1+4)
MOVT	R0, #hi_addr(_Screen1+4)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_display_height+0)
MOVT	R0, #hi_addr(_display_height+0)
STRH	R1, [R0, #0]
;MyProject_driver.c,1423 :: 		DrawScreen(&Screen1);
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
BL	_DrawScreen+0
;MyProject_driver.c,1424 :: 		}
L_end_Start_TP:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Start_TP
MyProject_driver____?ag:
L_end_MyProject_driver___?ag:
BX	LR
; end of MyProject_driver____?ag

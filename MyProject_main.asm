_main:
;MyProject_main.c,22 :: 		void main() {
;MyProject_main.c,24 :: 		Start_TP();
BL	_Start_TP+0
;MyProject_main.c,25 :: 		InitTimer2();
BL	_InitTimer2+0
;MyProject_main.c,26 :: 		systemInit();
BL	_systemInit+0
;MyProject_main.c,27 :: 		applicationInit();
BL	_applicationInit+0
;MyProject_main.c,29 :: 		while (1) {
L_main0:
;MyProject_main.c,30 :: 		Check_TP();
BL	_Check_TP+0
;MyProject_main.c,31 :: 		}
IT	AL
BAL	L_main0
;MyProject_main.c,32 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main

_filter:
;qrsdetection.h,9 :: 		void filter(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;qrsdetection.h,10 :: 		jumlahdata = 799;
MOVW	R1, #799
MOVW	R0, #lo_addr(_jumlahdata+0)
MOVT	R0, #hi_addr(_jumlahdata+0)
STRH	R1, [R0, #0]
;qrsdetection.h,11 :: 		readADC = ADC1_Get_Sample(4);
MOVS	R0, #4
BL	_ADC1_Get_Sample+0
MOVW	R1, #lo_addr(_readADC+0)
MOVT	R1, #hi_addr(_readADC+0)
STRH	R0, [R1, #0]
;qrsdetection.h,19 :: 		for(i=0;i<=jumlahdata;i++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_filter0:
MOVW	R0, #lo_addr(_jumlahdata+0)
MOVT	R0, #hi_addr(_jumlahdata+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	HI
BHI	L_filter1
;qrsdetection.h,21 :: 		y1[i] = 0;
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRH	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
ADDS	R1, R0, R1
MOV	R0, #0
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
;qrsdetection.h,19 :: 		for(i=0;i<=jumlahdata;i++)
MOV	R0, R2
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R2, #0]
;qrsdetection.h,22 :: 		}
IT	AL
BAL	L_filter0
L_filter1:
;qrsdetection.h,23 :: 		for (i=12;i<=jumlahdata;i++){
MOVS	R1, #12
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_filter3:
MOVW	R0, #lo_addr(_jumlahdata+0)
MOVT	R0, #hi_addr(_jumlahdata+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	HI
BHI	L_filter4
;qrsdetection.h,24 :: 		y1[i] = (2*y1[i-1])-y1[i-2]+yy[i]-(2*yy[i-6])+yy[i-12];
MOVW	R4, #lo_addr(_i+0)
MOVT	R4, #hi_addr(_i+0)
LDRH	R0, [R4, #0]
LSLS	R3, R0, #2
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
ADDS	R2, R0, R3
MOV	R0, R4
LDRH	R0, [R0, #0]
SUBS	R0, R0, #1
UXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #2
VMUL.F32	S1, S0, S1
MOV	R0, R4
LDRH	R0, [R0, #0]
SUBS	R0, R0, #2
UXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VSUB.F32	S1, S1, S0
MOVW	R0, #lo_addr(_yy+0)
MOVT	R0, #hi_addr(_yy+0)
ADDS	R0, R0, R3
VLDR	#1, S0, [R0, #0]
VADD.F32	S2, S1, S0
MOV	R0, R4
LDRH	R0, [R0, #0]
SUBS	R0, R0, #6
UXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_yy+0)
MOVT	R0, #hi_addr(_yy+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #2
VMUL.F32	S0, S0, S1
VSUB.F32	S1, S2, S0
MOV	R0, R4
LDRH	R0, [R0, #0]
SUBS	R0, #12
UXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_yy+0)
MOVT	R0, #hi_addr(_yy+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;qrsdetection.h,23 :: 		for (i=12;i<=jumlahdata;i++){
MOV	R0, R4
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R4, #0]
;qrsdetection.h,25 :: 		}
IT	AL
BAL	L_filter3
L_filter4:
;qrsdetection.h,31 :: 		for(i=0;i<=jumlahdata;i++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_filter6:
MOVW	R0, #lo_addr(_jumlahdata+0)
MOVT	R0, #hi_addr(_jumlahdata+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	HI
BHI	L_filter7
;qrsdetection.h,33 :: 		y2[i] = 0;
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRH	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y2+0)
MOVT	R0, #hi_addr(_y2+0)
ADDS	R1, R0, R1
MOV	R0, #0
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
;qrsdetection.h,31 :: 		for(i=0;i<=jumlahdata;i++)
MOV	R0, R2
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R2, #0]
;qrsdetection.h,34 :: 		}
IT	AL
BAL	L_filter6
L_filter7:
;qrsdetection.h,35 :: 		for (i=32;i<=jumlahdata;i++){
MOVS	R1, #32
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_filter9:
MOVW	R0, #lo_addr(_jumlahdata+0)
MOVT	R0, #hi_addr(_jumlahdata+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	HI
BHI	L_filter10
;qrsdetection.h,36 :: 		y2[i] = 32*y1[i-16] - (y2[i-1]+y1[i]-y1[i-32]);         }
MOVW	R4, #lo_addr(_i+0)
MOVT	R4, #hi_addr(_i+0)
LDRH	R0, [R4, #0]
LSLS	R2, R0, #2
MOVW	R0, #lo_addr(_y2+0)
MOVT	R0, #hi_addr(_y2+0)
ADDS	R3, R0, R2
MOV	R0, R4
LDRH	R0, [R0, #0]
SUBS	R0, #16
UXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOV	R0, #1107296256
VMOV	S0, R0
VMUL.F32	S2, S0, S1
MOV	R0, R4
LDRH	R0, [R0, #0]
SUBS	R0, R0, #1
UXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y2+0)
MOVT	R0, #hi_addr(_y2+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
ADDS	R0, R0, R2
VLDR	#1, S0, [R0, #0]
VADD.F32	S1, S1, S0
MOV	R0, R4
LDRH	R0, [R0, #0]
SUBS	R0, #32
UXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y1+0)
MOVT	R0, #hi_addr(_y1+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VSUB.F32	S0, S1, S0
VSUB.F32	S0, S2, S0
VSTR	#1, S0, [R3, #0]
;qrsdetection.h,35 :: 		for (i=32;i<=jumlahdata;i++){
MOV	R0, R4
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R4, #0]
;qrsdetection.h,36 :: 		y2[i] = 32*y1[i-16] - (y2[i-1]+y1[i]-y1[i-32]);         }
IT	AL
BAL	L_filter9
L_filter10:
;qrsdetection.h,39 :: 		for(i=0;i<=jumlahdata-1;i++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_filter12:
MOVW	R0, #lo_addr(_jumlahdata+0)
MOVT	R0, #hi_addr(_jumlahdata+0)
LDRH	R0, [R0, #0]
SUBS	R1, R0, #1
UXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	HI
BHI	L_filter13
;qrsdetection.h,41 :: 		y3[i] = 0;
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRH	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y3+0)
MOVT	R0, #hi_addr(_y3+0)
ADDS	R1, R0, R1
MOV	R0, #0
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
;qrsdetection.h,39 :: 		for(i=0;i<=jumlahdata-1;i++)
MOV	R0, R2
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R2, #0]
;qrsdetection.h,42 :: 		}
IT	AL
BAL	L_filter12
L_filter13:
;qrsdetection.h,44 :: 		for (n=2;n<=jumlahdata;n++){
MOVS	R1, #2
MOVW	R0, #lo_addr(_n+0)
MOVT	R0, #hi_addr(_n+0)
STRH	R1, [R0, #0]
L_filter15:
MOVW	R0, #lo_addr(_jumlahdata+0)
MOVT	R0, #hi_addr(_jumlahdata+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_n+0)
MOVT	R0, #hi_addr(_n+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	HI
BHI	L_filter16
;qrsdetection.h,45 :: 		y31[n] = (-y2[n-2]-2*y2[n-1])/8;}
MOVW	R3, #lo_addr(_n+0)
MOVT	R3, #hi_addr(_n+0)
LDRH	R0, [R3, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y31+0)
MOVT	R0, #hi_addr(_y31+0)
ADDS	R2, R0, R1
MOV	R0, R3
LDRH	R0, [R0, #0]
SUBS	R0, R0, #2
UXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y2+0)
MOVT	R0, #hi_addr(_y2+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VNEG.F32	S2, S0
MOV	R0, R3
LDRH	R0, [R0, #0]
SUBS	R0, R0, #1
UXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y2+0)
MOVT	R0, #hi_addr(_y2+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #2
VMUL.F32	S0, S0, S1
VSUB.F32	S1, S2, S0
VMOV.F32	S0, #8
VDIV.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;qrsdetection.h,44 :: 		for (n=2;n<=jumlahdata;n++){
MOV	R0, R3
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R3, #0]
;qrsdetection.h,45 :: 		y31[n] = (-y2[n-2]-2*y2[n-1])/8;}
IT	AL
BAL	L_filter15
L_filter16:
;qrsdetection.h,47 :: 		for (n=0;n<=jumlahdata-2;n++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_n+0)
MOVT	R0, #hi_addr(_n+0)
STRH	R1, [R0, #0]
L_filter18:
MOVW	R0, #lo_addr(_jumlahdata+0)
MOVT	R0, #hi_addr(_jumlahdata+0)
LDRH	R0, [R0, #0]
SUBS	R1, R0, #2
UXTH	R1, R1
MOVW	R0, #lo_addr(_n+0)
MOVT	R0, #hi_addr(_n+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	HI
BHI	L_filter19
;qrsdetection.h,48 :: 		y32[n] = (2*y2[n+1]+y2[n+2])/8;}
MOVW	R3, #lo_addr(_n+0)
MOVT	R3, #hi_addr(_n+0)
LDRH	R0, [R3, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y32+0)
MOVT	R0, #hi_addr(_y32+0)
ADDS	R2, R0, R1
MOV	R0, R3
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
UXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y2+0)
MOVT	R0, #hi_addr(_y2+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #2
VMUL.F32	S1, S0, S1
MOV	R0, R3
LDRH	R0, [R0, #0]
ADDS	R0, R0, #2
UXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y2+0)
MOVT	R0, #hi_addr(_y2+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VADD.F32	S1, S1, S0
VMOV.F32	S0, #8
VDIV.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;qrsdetection.h,47 :: 		for (n=0;n<=jumlahdata-2;n++){
MOV	R0, R3
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R3, #0]
;qrsdetection.h,48 :: 		y32[n] = (2*y2[n+1]+y2[n+2])/8;}
IT	AL
BAL	L_filter18
L_filter19:
;qrsdetection.h,50 :: 		for (n=2;n<=jumlahdata-2;n++){
MOVS	R1, #2
MOVW	R0, #lo_addr(_n+0)
MOVT	R0, #hi_addr(_n+0)
STRH	R1, [R0, #0]
L_filter21:
MOVW	R0, #lo_addr(_jumlahdata+0)
MOVT	R0, #hi_addr(_jumlahdata+0)
LDRH	R0, [R0, #0]
SUBS	R1, R0, #2
UXTH	R1, R1
MOVW	R0, #lo_addr(_n+0)
MOVT	R0, #hi_addr(_n+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	HI
BHI	L_filter22
;qrsdetection.h,51 :: 		y3[n] = y31[n]+y32[n];}
MOVW	R3, #lo_addr(_n+0)
MOVT	R3, #hi_addr(_n+0)
LDRH	R0, [R3, #0]
LSLS	R2, R0, #2
MOVW	R0, #lo_addr(_y3+0)
MOVT	R0, #hi_addr(_y3+0)
ADDS	R1, R0, R2
MOVW	R0, #lo_addr(_y31+0)
MOVT	R0, #hi_addr(_y31+0)
ADDS	R0, R0, R2
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_y32+0)
MOVT	R0, #hi_addr(_y32+0)
ADDS	R0, R0, R2
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S1, S0
VSTR	#1, S0, [R1, #0]
;qrsdetection.h,50 :: 		for (n=2;n<=jumlahdata-2;n++){
MOV	R0, R3
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R3, #0]
;qrsdetection.h,51 :: 		y3[n] = y31[n]+y32[n];}
IT	AL
BAL	L_filter21
L_filter22:
;qrsdetection.h,55 :: 		for (i=0;i<=jumlahdata;i++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_filter24:
MOVW	R0, #lo_addr(_jumlahdata+0)
MOVT	R0, #hi_addr(_jumlahdata+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	HI
BHI	L_filter25
;qrsdetection.h,56 :: 		y4[i] = 0;
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRH	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y4+0)
MOVT	R0, #hi_addr(_y4+0)
ADDS	R1, R0, R1
MOV	R0, #0
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
;qrsdetection.h,55 :: 		for (i=0;i<=jumlahdata;i++){
MOV	R0, R2
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R2, #0]
;qrsdetection.h,57 :: 		}
IT	AL
BAL	L_filter24
L_filter25:
;qrsdetection.h,58 :: 		for (i=0;i<=jumlahdata;i++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_filter27:
MOVW	R0, #lo_addr(_jumlahdata+0)
MOVT	R0, #hi_addr(_jumlahdata+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	HI
BHI	L_filter28
;qrsdetection.h,59 :: 		y4[i] = y3[i]*y3[i];
MOVW	R3, #lo_addr(_i+0)
MOVT	R3, #hi_addr(_i+0)
LDRH	R0, [R3, #0]
LSLS	R2, R0, #2
MOVW	R0, #lo_addr(_y4+0)
MOVT	R0, #hi_addr(_y4+0)
ADDS	R1, R0, R2
MOVW	R0, #lo_addr(_y3+0)
MOVT	R0, #hi_addr(_y3+0)
ADDS	R0, R0, R2
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S0
VSTR	#1, S0, [R1, #0]
;qrsdetection.h,58 :: 		for (i=0;i<=jumlahdata;i++){
MOV	R0, R3
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R3, #0]
;qrsdetection.h,60 :: 		}
IT	AL
BAL	L_filter27
L_filter28:
;qrsdetection.h,65 :: 		for (i=0;i<=jumlahdata;i++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_filter30:
MOVW	R0, #lo_addr(_jumlahdata+0)
MOVT	R0, #hi_addr(_jumlahdata+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	HI
BHI	L_filter31
;qrsdetection.h,66 :: 		y51[i] = 0;
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRH	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y51+0)
MOVT	R0, #hi_addr(_y51+0)
ADDS	R1, R0, R1
MOV	R0, #0
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
;qrsdetection.h,67 :: 		y52[i] = 0;
MOV	R0, R2
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y52+0)
MOVT	R0, #hi_addr(_y52+0)
ADDS	R1, R0, R1
MOV	R0, #0
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
;qrsdetection.h,65 :: 		for (i=0;i<=jumlahdata;i++){
MOV	R0, R2
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R2, #0]
;qrsdetection.h,68 :: 		}
IT	AL
BAL	L_filter30
L_filter31:
;qrsdetection.h,69 :: 		window = 14;
MOVS	R1, #14
SXTH	R1, R1
MOVW	R0, #lo_addr(_window+0)
MOVT	R0, #hi_addr(_window+0)
STRH	R1, [R0, #0]
;qrsdetection.h,70 :: 		for (i=window;i<=jumlahdata;i++){
MOVW	R1, #14
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_filter33:
MOVW	R0, #lo_addr(_jumlahdata+0)
MOVT	R0, #hi_addr(_jumlahdata+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	HI
BHI	L_filter34
;qrsdetection.h,71 :: 		for (n=0;n<=window;n++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_n+0)
MOVT	R0, #hi_addr(_n+0)
STRH	R1, [R0, #0]
L_filter36:
MOVW	R0, #lo_addr(_window+0)
MOVT	R0, #hi_addr(_window+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_n+0)
MOVT	R0, #hi_addr(_n+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	HI
BHI	L_filter37
;qrsdetection.h,72 :: 		y51[i] = y51[i]+(y4[i-n]);}
MOVW	R4, #lo_addr(_i+0)
MOVT	R4, #hi_addr(_i+0)
LDRH	R0, [R4, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y51+0)
MOVT	R0, #hi_addr(_y51+0)
ADDS	R3, R0, R1
VLDR	#1, S1, [R3, #0]
MOVW	R2, #lo_addr(_n+0)
MOVT	R2, #hi_addr(_n+0)
LDRH	R1, [R2, #0]
MOV	R0, R4
LDRH	R0, [R0, #0]
SUB	R0, R0, R1
UXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y4+0)
MOVT	R0, #hi_addr(_y4+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S1, S0
VSTR	#1, S0, [R3, #0]
;qrsdetection.h,71 :: 		for (n=0;n<=window;n++){
MOV	R0, R2
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R2, #0]
;qrsdetection.h,72 :: 		y51[i] = y51[i]+(y4[i-n]);}
IT	AL
BAL	L_filter36
L_filter37:
;qrsdetection.h,73 :: 		y52[i] = y51[i]/window;}
MOVW	R3, #lo_addr(_i+0)
MOVT	R3, #hi_addr(_i+0)
LDRH	R0, [R3, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y52+0)
MOVT	R0, #hi_addr(_y52+0)
ADDS	R2, R0, R1
MOVW	R0, #lo_addr(_y51+0)
MOVT	R0, #hi_addr(_y51+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_window+0)
MOVT	R0, #hi_addr(_window+0)
LDRSH	R0, [R0, #0]
VMOV	S0, R0
VCVT.F32	#1, S0, S0
VDIV.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;qrsdetection.h,70 :: 		for (i=window;i<=jumlahdata;i++){
MOV	R0, R3
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R3, #0]
;qrsdetection.h,73 :: 		y52[i] = y51[i]/window;}
IT	AL
BAL	L_filter33
L_filter34:
;qrsdetection.h,77 :: 		for (i=0;i<=jumlahdata;i++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_filter39:
MOVW	R0, #lo_addr(_jumlahdata+0)
MOVT	R0, #hi_addr(_jumlahdata+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	HI
BHI	L_filter40
;qrsdetection.h,78 :: 		peaki[i] = 0;}
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRH	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_peaki+0)
MOVT	R0, #hi_addr(_peaki+0)
ADDS	R1, R0, R1
MOV	R0, #0
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
;qrsdetection.h,77 :: 		for (i=0;i<=jumlahdata;i++){
MOV	R0, R2
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R2, #0]
;qrsdetection.h,78 :: 		peaki[i] = 0;}
IT	AL
BAL	L_filter39
L_filter40:
;qrsdetection.h,79 :: 		for (i=5;i<=jumlahdata+5;i++){
MOVS	R1, #5
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_filter42:
MOVW	R0, #lo_addr(_jumlahdata+0)
MOVT	R0, #hi_addr(_jumlahdata+0)
LDRH	R0, [R0, #0]
ADDS	R1, R0, #5
UXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	HI
BHI	L_filter43
;qrsdetection.h,80 :: 		if (y52[i] > y52[i-5]){
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRH	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y52+0)
MOVT	R0, #hi_addr(_y52+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOV	R0, R2
LDRH	R0, [R0, #0]
SUBS	R0, R0, #5
UXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y52+0)
MOVT	R0, #hi_addr(_y52+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LE
BLE	L_filter45
;qrsdetection.h,81 :: 		if (y52[i] > y52[i-4]){
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRH	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y52+0)
MOVT	R0, #hi_addr(_y52+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOV	R0, R2
LDRH	R0, [R0, #0]
SUBS	R0, R0, #4
UXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y52+0)
MOVT	R0, #hi_addr(_y52+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LE
BLE	L_filter46
;qrsdetection.h,82 :: 		if (y52[i] > y52[i-3]){
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRH	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y52+0)
MOVT	R0, #hi_addr(_y52+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOV	R0, R2
LDRH	R0, [R0, #0]
SUBS	R0, R0, #3
UXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y52+0)
MOVT	R0, #hi_addr(_y52+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LE
BLE	L_filter47
;qrsdetection.h,83 :: 		if (y52[i] > y52[i-2]){
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRH	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y52+0)
MOVT	R0, #hi_addr(_y52+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOV	R0, R2
LDRH	R0, [R0, #0]
SUBS	R0, R0, #2
UXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y52+0)
MOVT	R0, #hi_addr(_y52+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LE
BLE	L_filter48
;qrsdetection.h,84 :: 		if (y52[i] > y52[i-1]){
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRH	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y52+0)
MOVT	R0, #hi_addr(_y52+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOV	R0, R2
LDRH	R0, [R0, #0]
SUBS	R0, R0, #1
UXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y52+0)
MOVT	R0, #hi_addr(_y52+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LE
BLE	L_filter49
;qrsdetection.h,85 :: 		if (y52[i] > y52[i+1]){
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRH	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y52+0)
MOVT	R0, #hi_addr(_y52+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOV	R0, R2
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
UXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y52+0)
MOVT	R0, #hi_addr(_y52+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LE
BLE	L_filter50
;qrsdetection.h,86 :: 		if (y52[i] > y52[i+2]){
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRH	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y52+0)
MOVT	R0, #hi_addr(_y52+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOV	R0, R2
LDRH	R0, [R0, #0]
ADDS	R0, R0, #2
UXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y52+0)
MOVT	R0, #hi_addr(_y52+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LE
BLE	L_filter51
;qrsdetection.h,87 :: 		if (y52[i] > y52[i+3]){
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRH	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y52+0)
MOVT	R0, #hi_addr(_y52+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOV	R0, R2
LDRH	R0, [R0, #0]
ADDS	R0, R0, #3
UXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y52+0)
MOVT	R0, #hi_addr(_y52+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LE
BLE	L_filter52
;qrsdetection.h,88 :: 		if (y52[i] > y52[i+4]){
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRH	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y52+0)
MOVT	R0, #hi_addr(_y52+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOV	R0, R2
LDRH	R0, [R0, #0]
ADDS	R0, R0, #4
UXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y52+0)
MOVT	R0, #hi_addr(_y52+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LE
BLE	L_filter53
;qrsdetection.h,89 :: 		if (y52[i] > y52[i+5]){
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRH	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y52+0)
MOVT	R0, #hi_addr(_y52+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOV	R0, R2
LDRH	R0, [R0, #0]
ADDS	R0, R0, #5
UXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y52+0)
MOVT	R0, #hi_addr(_y52+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LE
BLE	L_filter54
;qrsdetection.h,90 :: 		peaki[i] = 1;}}}}}}}} }}
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_peaki+0)
MOVT	R0, #hi_addr(_peaki+0)
ADDS	R1, R0, R1
VMOV.F32	S0, #1
VSTR	#1, S0, [R1, #0]
L_filter54:
L_filter53:
L_filter52:
L_filter51:
L_filter50:
L_filter49:
L_filter48:
L_filter47:
L_filter46:
L_filter45:
;qrsdetection.h,79 :: 		for (i=5;i<=jumlahdata+5;i++){
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;qrsdetection.h,91 :: 		}
IT	AL
BAL	L_filter42
L_filter43:
;qrsdetection.h,94 :: 		for (i=0;i<=400;i++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_filter55:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
CMP	R0, #400
IT	HI
BHI	L_filter56
;qrsdetection.h,95 :: 		if (y52[i] > pp){
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y52+0)
MOVT	R0, #hi_addr(_y52+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_pp+0)
MOVT	R0, #hi_addr(_pp+0)
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LE
BLE	L_filter58
;qrsdetection.h,96 :: 		pp = y52[i];}
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y52+0)
MOVT	R0, #hi_addr(_y52+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_pp+0)
MOVT	R0, #hi_addr(_pp+0)
VSTR	#1, S0, [R0, #0]
L_filter58:
;qrsdetection.h,97 :: 		spki[0] = pp;
MOVW	R0, #lo_addr(_pp+0)
MOVT	R0, #hi_addr(_pp+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_spki+0)
MOVT	R0, #hi_addr(_spki+0)
VSTR	#1, S0, [R0, #0]
;qrsdetection.h,98 :: 		meann += y52[i]; }
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRH	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y52+0)
MOVT	R0, #hi_addr(_y52+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_meann+0)
MOVT	R0, #hi_addr(_meann+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;qrsdetection.h,94 :: 		for (i=0;i<=400;i++){
MOV	R0, R2
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R2, #0]
;qrsdetection.h,98 :: 		meann += y52[i]; }
IT	AL
BAL	L_filter55
L_filter56:
;qrsdetection.h,99 :: 		mean_npki = meann/400;
MOVW	R0, #lo_addr(_meann+0)
MOVT	R0, #hi_addr(_meann+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17352
VMOV	S0, R0
VDIV.F32	S2, S1, S0
MOVW	R0, #lo_addr(_mean_npki+0)
MOVT	R0, #hi_addr(_mean_npki+0)
VSTR	#1, S2, [R0, #0]
;qrsdetection.h,100 :: 		npki[0] = mean_npki;
MOVW	R0, #lo_addr(_npki+0)
MOVT	R0, #hi_addr(_npki+0)
VSTR	#1, S2, [R0, #0]
;qrsdetection.h,101 :: 		th1[0] = (npki[0] + 0.25 * (spki[0] - npki[0]));
MOVW	R0, #lo_addr(_spki+0)
MOVT	R0, #hi_addr(_spki+0)
VLDR	#1, S0, [R0, #0]
VSUB.F32	S1, S0, S2
VMOV.F32	S0, #0.25
VMUL.F32	S0, S0, S1
VADD.F32	S1, S2, S0
MOVW	R0, #lo_addr(_th1+0)
MOVT	R0, #hi_addr(_th1+0)
VSTR	#1, S1, [R0, #0]
;qrsdetection.h,102 :: 		th2[0] = 0.5*th1[0];
VMOV.F32	S0, #0.5
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_th2+0)
MOVT	R0, #hi_addr(_th2+0)
VSTR	#1, S0, [R0, #0]
;qrsdetection.h,103 :: 		previous_peaki = -10000;
MOVW	R0, #16384
MOVT	R0, #50716
VMOV	S0, R0
MOVW	R0, #lo_addr(_previous_peaki+0)
MOVT	R0, #hi_addr(_previous_peaki+0)
VSTR	#1, S0, [R0, #0]
;qrsdetection.h,104 :: 		peaki_interval = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_peaki_interval+0)
MOVT	R0, #hi_addr(_peaki_interval+0)
VSTR	#1, S0, [R0, #0]
;qrsdetection.h,105 :: 		tpeak =0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_tpeak+0)
MOVT	R0, #hi_addr(_tpeak+0)
VSTR	#1, S0, [R0, #0]
;qrsdetection.h,106 :: 		Tbaru = 0.005;
MOVW	R0, #55050
MOVT	R0, #15267
VMOV	S0, R0
MOVW	R0, #lo_addr(_Tbaru+0)
MOVT	R0, #hi_addr(_Tbaru+0)
VSTR	#1, S0, [R0, #0]
;qrsdetection.h,107 :: 		for (i=1;i<=jumlahdata;i++){
MOVS	R1, #1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_filter59:
MOVW	R0, #lo_addr(_jumlahdata+0)
MOVT	R0, #hi_addr(_jumlahdata+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	HI
BHI	L_filter60
;qrsdetection.h,108 :: 		spki[i] = spki[i-1];
MOVW	R3, #lo_addr(_i+0)
MOVT	R3, #hi_addr(_i+0)
LDRH	R0, [R3, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_spki+0)
MOVT	R0, #hi_addr(_spki+0)
ADDS	R2, R0, R1
MOV	R0, R3
LDRH	R0, [R0, #0]
SUBS	R0, R0, #1
UXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_spki+0)
MOVT	R0, #hi_addr(_spki+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R2, #0]
;qrsdetection.h,109 :: 		npki[i] = npki[i-1];
MOV	R0, R3
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_npki+0)
MOVT	R0, #hi_addr(_npki+0)
ADDS	R2, R0, R1
MOV	R0, R3
LDRH	R0, [R0, #0]
SUBS	R0, R0, #1
UXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_npki+0)
MOVT	R0, #hi_addr(_npki+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R2, #0]
;qrsdetection.h,110 :: 		th1[i] = th1[i-1];
MOV	R0, R3
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_th1+0)
MOVT	R0, #hi_addr(_th1+0)
ADDS	R2, R0, R1
MOV	R0, R3
LDRH	R0, [R0, #0]
SUBS	R0, R0, #1
UXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_th1+0)
MOVT	R0, #hi_addr(_th1+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R2, #0]
;qrsdetection.h,111 :: 		th2[i] = th2[i-1];
MOV	R0, R3
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_th2+0)
MOVT	R0, #hi_addr(_th2+0)
ADDS	R2, R0, R1
MOV	R0, R3
LDRH	R0, [R0, #0]
SUBS	R0, R0, #1
UXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_th2+0)
MOVT	R0, #hi_addr(_th2+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R2, #0]
;qrsdetection.h,112 :: 		if (peaki[i] == 1){
MOV	R0, R3
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_peaki+0)
MOVT	R0, #hi_addr(_peaki+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #1
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	NE
BNE	L_filter62
;qrsdetection.h,113 :: 		if (y52[i] > th1[i]){
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y52+0)
MOVT	R0, #hi_addr(_y52+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_th1+0)
MOVT	R0, #hi_addr(_th1+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LE
BLE	L_filter63
;qrsdetection.h,114 :: 		peaki_interval = i - previous_peaki;
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
VMOV	S2, R0
VCVT.F32	#0, S2, S2
MOVW	R1, #lo_addr(_previous_peaki+0)
MOVT	R1, #hi_addr(_previous_peaki+0)
VLDR	#1, S0, [R1, #0]
VSUB.F32	S1, S2, S0
MOVW	R0, #lo_addr(_peaki_interval+0)
MOVT	R0, #hi_addr(_peaki_interval+0)
VSTR	#1, S1, [R0, #0]
;qrsdetection.h,115 :: 		previous_peaki = i;
VSTR	#1, S2, [R1, #0]
;qrsdetection.h,116 :: 		tpeak = peaki_interval * Tbaru;
MOVW	R0, #lo_addr(_Tbaru+0)
MOVT	R0, #hi_addr(_Tbaru+0)
VLDR	#1, S0, [R0, #0]
VMUL.F32	S1, S1, S0
MOVW	R0, #lo_addr(_tpeak+0)
MOVT	R0, #hi_addr(_tpeak+0)
VSTR	#1, S1, [R0, #0]
;qrsdetection.h,117 :: 		if (tpeak > 0.2){
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LE
BLE	L_filter64
;qrsdetection.h,118 :: 		spki[i] = 0.875 * spki[i-1] + 0.125 * y52[i];
MOVW	R4, #lo_addr(_i+0)
MOVT	R4, #hi_addr(_i+0)
LDRH	R0, [R4, #0]
LSLS	R3, R0, #2
MOVW	R0, #lo_addr(_spki+0)
MOVT	R0, #hi_addr(_spki+0)
ADDS	R2, R0, R3
MOV	R0, R4
LDRH	R0, [R0, #0]
SUBS	R0, R0, #1
UXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_spki+0)
MOVT	R0, #hi_addr(_spki+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #0.875
VMUL.F32	S2, S0, S1
MOVW	R0, #lo_addr(_y52+0)
MOVT	R0, #hi_addr(_y52+0)
ADDS	R0, R0, R3
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #0.125
VMUL.F32	S0, S0, S1
VADD.F32	S0, S2, S0
VSTR	#1, S0, [R2, #0]
;qrsdetection.h,119 :: 		qrsi[i] = 1;}
MOV	R0, R4
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_qrsi+0)
MOVT	R0, #hi_addr(_qrsi+0)
ADDS	R1, R0, R1
VMOV.F32	S0, #1
VSTR	#1, S0, [R1, #0]
IT	AL
BAL	L_filter65
L_filter64:
;qrsdetection.h,120 :: 		else if (y52[i] >th2[i]){
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y52+0)
MOVT	R0, #hi_addr(_y52+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_th2+0)
MOVT	R0, #hi_addr(_th2+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LE
BLE	L_filter66
;qrsdetection.h,121 :: 		if (tpeak > 0.2){
MOVW	R0, #lo_addr(_tpeak+0)
MOVT	R0, #hi_addr(_tpeak+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LE
BLE	L_filter67
;qrsdetection.h,122 :: 		spki[i] = 0.75 * spki[i-1] + 0.25 * y52[i];
MOVW	R4, #lo_addr(_i+0)
MOVT	R4, #hi_addr(_i+0)
LDRH	R0, [R4, #0]
LSLS	R3, R0, #2
MOVW	R0, #lo_addr(_spki+0)
MOVT	R0, #hi_addr(_spki+0)
ADDS	R2, R0, R3
MOV	R0, R4
LDRH	R0, [R0, #0]
SUBS	R0, R0, #1
UXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_spki+0)
MOVT	R0, #hi_addr(_spki+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #0.75
VMUL.F32	S2, S0, S1
MOVW	R0, #lo_addr(_y52+0)
MOVT	R0, #hi_addr(_y52+0)
ADDS	R0, R0, R3
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #0.25
VMUL.F32	S0, S0, S1
VADD.F32	S0, S2, S0
VSTR	#1, S0, [R2, #0]
;qrsdetection.h,123 :: 		qrsi[i] = 1;}
MOV	R0, R4
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_qrsi+0)
MOVT	R0, #hi_addr(_qrsi+0)
ADDS	R1, R0, R1
VMOV.F32	S0, #1
VSTR	#1, S0, [R1, #0]
L_filter67:
;qrsdetection.h,125 :: 		}else{
IT	AL
BAL	L_filter68
L_filter66:
;qrsdetection.h,126 :: 		npki[i] = 0.875 * npki[i-1] + 0.125 * y52[i];
MOVW	R4, #lo_addr(_i+0)
MOVT	R4, #hi_addr(_i+0)
LDRH	R0, [R4, #0]
LSLS	R3, R0, #2
MOVW	R0, #lo_addr(_npki+0)
MOVT	R0, #hi_addr(_npki+0)
ADDS	R2, R0, R3
MOV	R0, R4
LDRH	R0, [R0, #0]
SUBS	R0, R0, #1
UXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_npki+0)
MOVT	R0, #hi_addr(_npki+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #0.875
VMUL.F32	S2, S0, S1
MOVW	R0, #lo_addr(_y52+0)
MOVT	R0, #hi_addr(_y52+0)
ADDS	R0, R0, R3
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #0.125
VMUL.F32	S0, S0, S1
VADD.F32	S0, S2, S0
VSTR	#1, S0, [R2, #0]
;qrsdetection.h,127 :: 		qrsi[i] = 0;    }
MOV	R0, R4
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_qrsi+0)
MOVT	R0, #hi_addr(_qrsi+0)
ADDS	R1, R0, R1
MOV	R0, #0
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
L_filter68:
L_filter65:
;qrsdetection.h,128 :: 		th1[i] = (npki[i] + 0.25 * (spki[i] - npki[i]));
MOVW	R3, #lo_addr(_i+0)
MOVT	R3, #hi_addr(_i+0)
LDRH	R0, [R3, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_th1+0)
MOVT	R0, #hi_addr(_th1+0)
ADDS	R2, R0, R1
MOVW	R0, #lo_addr(_npki+0)
MOVT	R0, #hi_addr(_npki+0)
ADDS	R0, R0, R1
VLDR	#1, S2, [R0, #0]
MOVW	R0, #lo_addr(_spki+0)
MOVT	R0, #hi_addr(_spki+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VSUB.F32	S1, S0, S2
VMOV.F32	S0, #0.25
VMUL.F32	S0, S0, S1
VADD.F32	S0, S2, S0
VSTR	#1, S0, [R2, #0]
;qrsdetection.h,129 :: 		th2[i] = 0.5*th1[i];}
MOV	R0, R3
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_th2+0)
MOVT	R0, #hi_addr(_th2+0)
ADDS	R2, R0, R1
MOVW	R0, #lo_addr(_th1+0)
MOVT	R0, #hi_addr(_th1+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #0.5
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [R2, #0]
L_filter63:
;qrsdetection.h,131 :: 		if (qrsi[i] == 0){
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_qrsi+0)
MOVT	R0, #hi_addr(_qrsi+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S0, #0
VMRS	#60, FPSCR
IT	NE
BNE	L_filter69
;qrsdetection.h,132 :: 		if (peaki[i] = 1){
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_peaki+0)
MOVT	R0, #hi_addr(_peaki+0)
ADDS	R1, R0, R1
VMOV.F32	S0, #1
VSTR	#1, S0, [R1, #0]
VLDR	#1, S0, [R1, #0]
VMOV	R0, S0
CMP	R0, #0
IT	EQ
BEQ	L_filter70
;qrsdetection.h,133 :: 		if(tpeak >0.15){
MOVW	R0, #lo_addr(_tpeak+0)
MOVT	R0, #hi_addr(_tpeak+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #39322
MOVT	R0, #15897
VMOV	S0, R0
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LE
BLE	L_filter71
;qrsdetection.h,134 :: 		if (y52[i] > th1[i]){
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y52+0)
MOVT	R0, #hi_addr(_y52+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_th1+0)
MOVT	R0, #hi_addr(_th1+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LE
BLE	L_filter72
;qrsdetection.h,135 :: 		qrsi[i] = 1;} }
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_qrsi+0)
MOVT	R0, #hi_addr(_qrsi+0)
ADDS	R1, R0, R1
VMOV.F32	S0, #1
VSTR	#1, S0, [R1, #0]
L_filter72:
L_filter71:
;qrsdetection.h,136 :: 		}
L_filter70:
;qrsdetection.h,137 :: 		}
L_filter69:
;qrsdetection.h,141 :: 		}}
L_filter62:
;qrsdetection.h,107 :: 		for (i=1;i<=jumlahdata;i++){
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;qrsdetection.h,141 :: 		}}
IT	AL
BAL	L_filter59
L_filter60:
;qrsdetection.h,142 :: 		max_slope = -10000;
MOVW	R1, #55536
SXTH	R1, R1
MOVW	R0, #lo_addr(_max_slope+0)
MOVT	R0, #hi_addr(_max_slope+0)
STRH	R1, [R0, #0]
;qrsdetection.h,143 :: 		previous_max_slope = -10000;
MOVW	R1, #55536
SXTH	R1, R1
MOVW	R0, #lo_addr(_previous_max_slope+0)
MOVT	R0, #hi_addr(_previous_max_slope+0)
STRH	R1, [R0, #0]
;qrsdetection.h,168 :: 		ppos = 27;
MOVS	R1, #27
SXTH	R1, R1
MOVW	R0, #lo_addr(_ppos+0)
MOVT	R0, #hi_addr(_ppos+0)
STRH	R1, [R0, #0]
;qrsdetection.h,169 :: 		while(ppos)
L_filter73:
MOVW	R0, #lo_addr(_ppos+0)
MOVT	R0, #hi_addr(_ppos+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_filter74
;qrsdetection.h,173 :: 		temp4 = qrsi[0];
MOVW	R0, #lo_addr(_qrsi+0)
MOVT	R0, #hi_addr(_qrsi+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_temp4+0)
MOVT	R0, #hi_addr(_temp4+0)
VSTR	#1, S0, [R0, #0]
;qrsdetection.h,174 :: 		for(i = 0; i < jumlahdata - 1; i++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_filter76:
MOVW	R0, #lo_addr(_jumlahdata+0)
MOVT	R0, #hi_addr(_jumlahdata+0)
LDRH	R0, [R0, #0]
SUBS	R1, R0, #1
UXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_filter77
;qrsdetection.h,175 :: 		qrsi[i] = qrsi[i + 1];
MOVW	R3, #lo_addr(_i+0)
MOVT	R3, #hi_addr(_i+0)
LDRH	R0, [R3, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_qrsi+0)
MOVT	R0, #hi_addr(_qrsi+0)
ADDS	R2, R0, R1
MOV	R0, R3
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
UXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_qrsi+0)
MOVT	R0, #hi_addr(_qrsi+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R2, #0]
;qrsdetection.h,174 :: 		for(i = 0; i < jumlahdata - 1; i++)
MOV	R0, R3
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R3, #0]
;qrsdetection.h,175 :: 		qrsi[i] = qrsi[i + 1];
IT	AL
BAL	L_filter76
L_filter77:
;qrsdetection.h,177 :: 		qrsi[jumlahdata - 1] = temp4;
MOVW	R0, #lo_addr(_jumlahdata+0)
MOVT	R0, #hi_addr(_jumlahdata+0)
LDRH	R0, [R0, #0]
SUBS	R0, R0, #1
UXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_qrsi+0)
MOVT	R0, #hi_addr(_qrsi+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_temp4+0)
MOVT	R0, #hi_addr(_temp4+0)
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;qrsdetection.h,186 :: 		}
L_filter79:
;qrsdetection.h,188 :: 		ppos--;
MOVW	R1, #lo_addr(_ppos+0)
MOVT	R1, #hi_addr(_ppos+0)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
STRH	R0, [R1, #0]
;qrsdetection.h,189 :: 		}
IT	AL
BAL	L_filter73
L_filter74:
;qrsdetection.h,192 :: 		for (i=2;i<=jumlahdata;i++)
MOVS	R1, #2
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_filter83:
MOVW	R0, #lo_addr(_jumlahdata+0)
MOVT	R0, #hi_addr(_jumlahdata+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	HI
BHI	L_filter84
;qrsdetection.h,195 :: 		TFT_Set_Pen(CL_RED, 1);
MOVS	R1, #1
MOVW	R0, #63488
BL	_TFT_Set_Pen+0
;qrsdetection.h,197 :: 		TFT_Line(105+((i-1)/2),185-2*(yy[i-1]*15),105+(i/2),185-2*(yy[i]*15));
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRH	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_yy+0)
MOVT	R0, #hi_addr(_yy+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #2
VMUL.F32	S1, S0, S1
MOVW	R0, #0
MOVT	R0, #17209
VMOV	S0, R0
VSUB.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R4, S0
SXTH	R4, R4
MOV	R0, R2
LDRH	R0, [R0, #0]
LSRS	R0, R0, #1
UXTH	R0, R0
ADDW	R3, R0, #105
MOV	R0, R2
LDRH	R0, [R0, #0]
SUBS	R2, R0, #1
UXTH	R2, R2
LSLS	R1, R2, #2
MOVW	R0, #lo_addr(_yy+0)
MOVT	R0, #hi_addr(_yy+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #2
VMUL.F32	S1, S0, S1
MOVW	R0, #0
MOVT	R0, #17209
VMOV	S0, R0
VSUB.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
LSRS	R0, R2, #1
UXTH	R0, R0
ADDS	R0, #105
SXTH	R2, R3
SXTH	R3, R4
SXTH	R0, R0
BL	_TFT_Line+0
;qrsdetection.h,198 :: 		TFT_Set_Pen(CL_GREEN, 1);
MOVS	R1, #1
MOVW	R0, #1024
BL	_TFT_Set_Pen+0
;qrsdetection.h,203 :: 		TFT_Line(105+((i-1)/2),160-(qrsi[i-1]*25),105+(i/2),160-(qrsi[i]*25));
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRH	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_qrsi+0)
MOVT	R0, #hi_addr(_qrsi+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #25
VMUL.F32	S1, S1, S0
MOVW	R0, #0
MOVT	R0, #17184
VMOV	S0, R0
VSUB.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R4, S0
SXTH	R4, R4
MOV	R0, R2
LDRH	R0, [R0, #0]
LSRS	R0, R0, #1
UXTH	R0, R0
ADDW	R3, R0, #105
MOV	R0, R2
LDRH	R0, [R0, #0]
SUBS	R2, R0, #1
UXTH	R2, R2
LSLS	R1, R2, #2
MOVW	R0, #lo_addr(_qrsi+0)
MOVT	R0, #hi_addr(_qrsi+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #25
VMUL.F32	S1, S1, S0
MOVW	R0, #0
MOVT	R0, #17184
VMOV	S0, R0
VSUB.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
LSRS	R0, R2, #1
UXTH	R0, R0
ADDS	R0, #105
SXTH	R2, R3
SXTH	R3, R4
SXTH	R0, R0
BL	_TFT_Line+0
;qrsdetection.h,205 :: 		Delay_ms(5);
MOVW	R7, #17854
MOVT	R7, #4
NOP
NOP
L_filter86:
SUBS	R7, R7, #1
BNE	L_filter86
NOP
NOP
NOP
;qrsdetection.h,192 :: 		for (i=2;i<=jumlahdata;i++)
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;qrsdetection.h,206 :: 		}
IT	AL
BAL	L_filter83
L_filter84:
;qrsdetection.h,209 :: 		}
L_end_filter:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _filter
_ekstraksi:
;qrsdetection.h,211 :: 		void ekstraksi(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;qrsdetection.h,212 :: 		jumlahdata =799;
MOVW	R1, #799
MOVW	R0, #lo_addr(_jumlahdata+0)
MOVT	R0, #hi_addr(_jumlahdata+0)
STRH	R1, [R0, #0]
;qrsdetection.h,213 :: 		for (i=2;i<=jumlahdata;i++){
MOVS	R1, #2
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_ekstraksi88:
MOVW	R0, #lo_addr(_jumlahdata+0)
MOVT	R0, #hi_addr(_jumlahdata+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	HI
BHI	L_ekstraksi89
;qrsdetection.h,214 :: 		bpf[i] = (28*bpf[i-1]-14*bpf[i-2]+yy[i]-yy[i-2])/16;
MOVW	R4, #lo_addr(_i+0)
MOVT	R4, #hi_addr(_i+0)
LDRH	R0, [R4, #0]
LSLS	R3, R0, #2
MOVW	R0, #lo_addr(_bpf+0)
MOVT	R0, #hi_addr(_bpf+0)
ADDS	R2, R0, R3
MOV	R0, R4
LDRH	R0, [R0, #0]
SUBS	R0, R0, #1
UXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_bpf+0)
MOVT	R0, #hi_addr(_bpf+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #28
VMUL.F32	S2, S0, S1
MOV	R0, R4
LDRH	R0, [R0, #0]
SUBS	R0, R0, #2
UXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_bpf+0)
MOVT	R0, #hi_addr(_bpf+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #14
VMUL.F32	S0, S0, S1
VSUB.F32	S1, S2, S0
MOVW	R0, #lo_addr(_yy+0)
MOVT	R0, #hi_addr(_yy+0)
ADDS	R0, R0, R3
VLDR	#1, S0, [R0, #0]
VADD.F32	S1, S1, S0
MOVW	R0, #lo_addr(_yy+0)
MOVT	R0, #hi_addr(_yy+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VSUB.F32	S1, S1, S0
VMOV.F32	S0, #16
VDIV.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;qrsdetection.h,215 :: 		r_bpf[i] = qrsi[i];
MOV	R0, R4
LDRH	R0, [R0, #0]
LSLS	R2, R0, #2
MOVW	R0, #lo_addr(_r_bpf+0)
MOVT	R0, #hi_addr(_r_bpf+0)
ADDS	R1, R0, R2
MOVW	R0, #lo_addr(_qrsi+0)
MOVT	R0, #hi_addr(_qrsi+0)
ADDS	R0, R0, R2
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;qrsdetection.h,213 :: 		for (i=2;i<=jumlahdata;i++){
MOV	R0, R4
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R4, #0]
;qrsdetection.h,216 :: 		}
IT	AL
BAL	L_ekstraksi88
L_ekstraksi89:
;qrsdetection.h,218 :: 		ppos = 2;
MOVS	R1, #2
SXTH	R1, R1
MOVW	R0, #lo_addr(_ppos+0)
MOVT	R0, #hi_addr(_ppos+0)
STRH	R1, [R0, #0]
;qrsdetection.h,219 :: 		while(ppos)
L_ekstraksi91:
MOVW	R0, #lo_addr(_ppos+0)
MOVT	R0, #hi_addr(_ppos+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_ekstraksi92
;qrsdetection.h,228 :: 		}
L_ekstraksi93:
;qrsdetection.h,231 :: 		temp4 = qrsi[jumlahdata - 1];
MOVW	R0, #lo_addr(_jumlahdata+0)
MOVT	R0, #hi_addr(_jumlahdata+0)
LDRH	R0, [R0, #0]
SUBS	R2, R0, #1
UXTH	R2, R2
LSLS	R1, R2, #2
MOVW	R0, #lo_addr(_qrsi+0)
MOVT	R0, #hi_addr(_qrsi+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_temp4+0)
MOVT	R0, #hi_addr(_temp4+0)
VSTR	#1, S0, [R0, #0]
;qrsdetection.h,232 :: 		for(i = jumlahdata - 1; i > 0; i--)
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R2, [R0, #0]
L_ekstraksi98:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	LS
BLS	L_ekstraksi99
;qrsdetection.h,233 :: 		r_bpf[i] = r_bpf[i - 1];
MOVW	R3, #lo_addr(_i+0)
MOVT	R3, #hi_addr(_i+0)
LDRH	R0, [R3, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_r_bpf+0)
MOVT	R0, #hi_addr(_r_bpf+0)
ADDS	R2, R0, R1
MOV	R0, R3
LDRH	R0, [R0, #0]
SUBS	R0, R0, #1
UXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_r_bpf+0)
MOVT	R0, #hi_addr(_r_bpf+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R2, #0]
;qrsdetection.h,232 :: 		for(i = jumlahdata - 1; i > 0; i--)
MOV	R0, R3
LDRH	R0, [R0, #0]
SUBS	R0, R0, #1
STRH	R0, [R3, #0]
;qrsdetection.h,233 :: 		r_bpf[i] = r_bpf[i - 1];
IT	AL
BAL	L_ekstraksi98
L_ekstraksi99:
;qrsdetection.h,235 :: 		r_bpf[0] = temp4;
MOVW	R0, #lo_addr(_temp4+0)
MOVT	R0, #hi_addr(_temp4+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_r_bpf+0)
MOVT	R0, #hi_addr(_r_bpf+0)
VSTR	#1, S0, [R0, #0]
;qrsdetection.h,238 :: 		ppos--;
MOVW	R1, #lo_addr(_ppos+0)
MOVT	R1, #hi_addr(_ppos+0)
LDRSH	R0, [R1, #0]
SUBS	R0, R0, #1
STRH	R0, [R1, #0]
;qrsdetection.h,239 :: 		}
IT	AL
BAL	L_ekstraksi91
L_ekstraksi92:
;qrsdetection.h,242 :: 		beat = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_beat+0)
MOVT	R0, #hi_addr(_beat+0)
STRH	R1, [R0, #0]
;qrsdetection.h,243 :: 		startt = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_startt+0)
MOVT	R0, #hi_addr(_startt+0)
STRH	R1, [R0, #0]
;qrsdetection.h,244 :: 		end = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_end+0)
MOVT	R0, #hi_addr(_end+0)
STRH	R1, [R0, #0]
;qrsdetection.h,245 :: 		for (i=0;i<=jumlahdata;i++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_ekstraksi101:
MOVW	R0, #lo_addr(_jumlahdata+0)
MOVT	R0, #hi_addr(_jumlahdata+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	HI
BHI	L_ekstraksi102
;qrsdetection.h,246 :: 		if (r_bpf[i] == 1){
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_r_bpf+0)
MOVT	R0, #hi_addr(_r_bpf+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #1
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	NE
BNE	L_ekstraksi104
;qrsdetection.h,247 :: 		beat++;
MOVW	R1, #lo_addr(_beat+0)
MOVT	R1, #hi_addr(_beat+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;qrsdetection.h,248 :: 		if (beat == 2){
CMP	R0, #2
IT	NE
BNE	L_ekstraksi105
;qrsdetection.h,249 :: 		startt = i; }
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_startt+0)
MOVT	R0, #hi_addr(_startt+0)
STRH	R1, [R0, #0]
L_ekstraksi105:
;qrsdetection.h,250 :: 		if (beat == 3){
MOVW	R0, #lo_addr(_beat+0)
MOVT	R0, #hi_addr(_beat+0)
LDRSH	R0, [R0, #0]
CMP	R0, #3
IT	NE
BNE	L_ekstraksi106
;qrsdetection.h,251 :: 		end = i;
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_end+0)
MOVT	R0, #hi_addr(_end+0)
STRH	R1, [R0, #0]
;qrsdetection.h,252 :: 		}}
L_ekstraksi106:
L_ekstraksi104:
;qrsdetection.h,253 :: 		length = end - startt;}
MOVW	R0, #lo_addr(_startt+0)
MOVT	R0, #hi_addr(_startt+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_end+0)
MOVT	R0, #hi_addr(_end+0)
LDRSH	R0, [R0, #0]
SUB	R1, R0, R1
MOVW	R0, #lo_addr(_length+0)
MOVT	R0, #hi_addr(_length+0)
STRH	R1, [R0, #0]
;qrsdetection.h,245 :: 		for (i=0;i<=jumlahdata;i++){
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;qrsdetection.h,253 :: 		length = end - startt;}
IT	AL
BAL	L_ekstraksi101
L_ekstraksi102:
;qrsdetection.h,263 :: 		sumbpf = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_sumbpf+0)
MOVT	R0, #hi_addr(_sumbpf+0)
VSTR	#1, S0, [R0, #0]
;qrsdetection.h,265 :: 		for (i=startt;i<=end;i++){
MOVW	R0, #lo_addr(_startt+0)
MOVT	R0, #hi_addr(_startt+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_ekstraksi107:
MOVW	R0, #lo_addr(_end+0)
MOVT	R0, #hi_addr(_end+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	HI
BHI	L_ekstraksi108
;qrsdetection.h,267 :: 		if (bpf[i] > maxbpf){
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_bpf+0)
MOVT	R0, #hi_addr(_bpf+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_maxbpf+0)
MOVT	R0, #hi_addr(_maxbpf+0)
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LE
BLE	L_ekstraksi110
;qrsdetection.h,268 :: 		maxbpf = bpf[i];}
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_bpf+0)
MOVT	R0, #hi_addr(_bpf+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_maxbpf+0)
MOVT	R0, #hi_addr(_maxbpf+0)
VSTR	#1, S0, [R0, #0]
L_ekstraksi110:
;qrsdetection.h,269 :: 		thress = 0.5*maxbpf;
MOVW	R0, #lo_addr(_maxbpf+0)
MOVT	R0, #hi_addr(_maxbpf+0)
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #0.5
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_thress+0)
MOVT	R0, #hi_addr(_thress+0)
VSTR	#1, S0, [R0, #0]
;qrsdetection.h,273 :: 		if (bpf[i] > 0){
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_bpf+0)
MOVT	R0, #hi_addr(_bpf+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S0, #0
VMRS	#60, FPSCR
IT	LE
BLE	L_ekstraksi111
;qrsdetection.h,274 :: 		absbpf = bpf[i];}
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_bpf+0)
MOVT	R0, #hi_addr(_bpf+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_absbpf+0)
MOVT	R0, #hi_addr(_absbpf+0)
VSTR	#1, S0, [R0, #0]
IT	AL
BAL	L_ekstraksi112
L_ekstraksi111:
;qrsdetection.h,276 :: 		{absbpf = -bpf[i];}
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_bpf+0)
MOVT	R0, #hi_addr(_bpf+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VNEG.F32	S0, S0
MOVW	R0, #lo_addr(_absbpf+0)
MOVT	R0, #hi_addr(_absbpf+0)
VSTR	#1, S0, [R0, #0]
L_ekstraksi112:
;qrsdetection.h,278 :: 		sumbpf = sumbpf + absbpf;}
MOVW	R0, #lo_addr(_absbpf+0)
MOVT	R0, #hi_addr(_absbpf+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_sumbpf+0)
MOVT	R0, #hi_addr(_sumbpf+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;qrsdetection.h,265 :: 		for (i=startt;i<=end;i++){
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;qrsdetection.h,278 :: 		sumbpf = sumbpf + absbpf;}
IT	AL
BAL	L_ekstraksi107
L_ekstraksi108:
;qrsdetection.h,280 :: 		thres = sumbpf/length;
MOVW	R0, #lo_addr(_length+0)
MOVT	R0, #hi_addr(_length+0)
LDRSH	R0, [R0, #0]
VMOV	S1, R0
VCVT.F32	#1, S1, S1
MOVW	R0, #lo_addr(_sumbpf+0)
MOVT	R0, #hi_addr(_sumbpf+0)
VLDR	#1, S0, [R0, #0]
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_thres+0)
MOVT	R0, #hi_addr(_thres+0)
VSTR	#1, S0, [R0, #0]
;qrsdetection.h,281 :: 		hasilcount1 = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_hasilcount1+0)
MOVT	R0, #hi_addr(_hasilcount1+0)
STRH	R1, [R0, #0]
;qrsdetection.h,282 :: 		hasilcount2 = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_hasilcount2+0)
MOVT	R0, #hi_addr(_hasilcount2+0)
STRH	R1, [R0, #0]
;qrsdetection.h,283 :: 		for (i=startt;i<=end;i++){
MOVW	R0, #lo_addr(_startt+0)
MOVT	R0, #hi_addr(_startt+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_ekstraksi113:
MOVW	R0, #lo_addr(_end+0)
MOVT	R0, #hi_addr(_end+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	HI
BHI	L_ekstraksi114
;qrsdetection.h,284 :: 		if (bpf[i] >= thress){  //range 0.5*max - max, bpf pasti nyentuh maxnya soalnya diatasnya
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_bpf+0)
MOVT	R0, #hi_addr(_bpf+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_thress+0)
MOVT	R0, #hi_addr(_thress+0)
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LT
BLT	L_ekstraksi116
;qrsdetection.h,285 :: 		hasilcount1+=1;}}
MOVW	R1, #lo_addr(_hasilcount1+0)
MOVT	R1, #hi_addr(_hasilcount1+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
L_ekstraksi116:
;qrsdetection.h,283 :: 		for (i=startt;i<=end;i++){
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;qrsdetection.h,285 :: 		hasilcount1+=1;}}
IT	AL
BAL	L_ekstraksi113
L_ekstraksi114:
;qrsdetection.h,287 :: 		for (i=startt;i<=end;i++){
MOVW	R0, #lo_addr(_startt+0)
MOVT	R0, #hi_addr(_startt+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_ekstraksi117:
MOVW	R0, #lo_addr(_end+0)
MOVT	R0, #hi_addr(_end+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	HI
BHI	L_ekstraksi118
;qrsdetection.h,288 :: 		if (bpf[i] >= thres){       //range mean - max
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_bpf+0)
MOVT	R0, #hi_addr(_bpf+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_thres+0)
MOVT	R0, #hi_addr(_thres+0)
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LT
BLT	L_ekstraksi120
;qrsdetection.h,289 :: 		hasilcount2+=1;}}
MOVW	R1, #lo_addr(_hasilcount2+0)
MOVT	R1, #hi_addr(_hasilcount2+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
L_ekstraksi120:
;qrsdetection.h,287 :: 		for (i=startt;i<=end;i++){
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;qrsdetection.h,289 :: 		hasilcount2+=1;}}
IT	AL
BAL	L_ekstraksi117
L_ekstraksi118:
;qrsdetection.h,290 :: 		input[0] = hasilcount1;
MOVW	R0, #lo_addr(_hasilcount1+0)
MOVT	R0, #hi_addr(_hasilcount1+0)
LDRSH	R0, [R0, #0]
VMOV	S0, R0
VCVT.F32	#1, S0, S0
MOVW	R0, #lo_addr(_input+0)
MOVT	R0, #hi_addr(_input+0)
VSTR	#1, S0, [R0, #0]
;qrsdetection.h,291 :: 		input[1] = hasilcount2;
MOVW	R0, #lo_addr(_hasilcount2+0)
MOVT	R0, #hi_addr(_hasilcount2+0)
LDRSH	R0, [R0, #0]
VMOV	S0, R0
VCVT.F32	#1, S0, S0
MOVW	R0, #lo_addr(_input+4)
MOVT	R0, #hi_addr(_input+4)
VSTR	#1, S0, [R0, #0]
;qrsdetection.h,295 :: 		num = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_num+0)
MOVT	R0, #hi_addr(_num+0)
VSTR	#1, S0, [R0, #0]
;qrsdetection.h,296 :: 		den2 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_den2+0)
MOVT	R0, #hi_addr(_den2+0)
VSTR	#1, S0, [R0, #0]
;qrsdetection.h,297 :: 		NN = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_NN+0)
MOVT	R0, #hi_addr(_NN+0)
STRH	R1, [R0, #0]
;qrsdetection.h,298 :: 		num2 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_num2+0)
MOVT	R0, #hi_addr(_num2+0)
VSTR	#1, S0, [R0, #0]
;qrsdetection.h,299 :: 		for (i=startt;i<=end;i++){
MOVW	R0, #lo_addr(_startt+0)
MOVT	R0, #hi_addr(_startt+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_ekstraksi121:
MOVW	R0, #lo_addr(_end+0)
MOVT	R0, #hi_addr(_end+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	HI
BHI	L_ekstraksi122
;qrsdetection.h,300 :: 		for (ll=startt+i+1;ll<=end;ll++){
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_startt+0)
MOVT	R0, #hi_addr(_startt+0)
LDRSH	R0, [R0, #0]
ADDS	R0, R0, R1
UXTH	R0, R0
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_ll+0)
MOVT	R0, #hi_addr(_ll+0)
STRH	R1, [R0, #0]
L_ekstraksi124:
MOVW	R0, #lo_addr(_end+0)
MOVT	R0, #hi_addr(_end+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_ll+0)
MOVT	R0, #hi_addr(_ll+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	HI
BHI	L_ekstraksi125
;qrsdetection.h,301 :: 		if (yy[i] > 0){
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_yy+0)
MOVT	R0, #hi_addr(_yy+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S0, #0
VMRS	#60, FPSCR
IT	LE
BLE	L_ekstraksi127
;qrsdetection.h,302 :: 		absnum = yy[i];}
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_yy+0)
MOVT	R0, #hi_addr(_yy+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_absnum+0)
MOVT	R0, #hi_addr(_absnum+0)
VSTR	#1, S0, [R0, #0]
IT	AL
BAL	L_ekstraksi128
L_ekstraksi127:
;qrsdetection.h,304 :: 		{absnum = -(yy[i]);}
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_yy+0)
MOVT	R0, #hi_addr(_yy+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VNEG.F32	S0, S0
MOVW	R0, #lo_addr(_absnum+0)
MOVT	R0, #hi_addr(_absnum+0)
VSTR	#1, S0, [R0, #0]
L_ekstraksi128:
;qrsdetection.h,305 :: 		num += absnum;
MOVW	R0, #lo_addr(_absnum+0)
MOVT	R0, #hi_addr(_absnum+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_num+0)
MOVT	R0, #hi_addr(_num+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;qrsdetection.h,307 :: 		if (den1[ll-i] > 0){
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_ll+0)
MOVT	R0, #hi_addr(_ll+0)
LDRH	R0, [R0, #0]
SUB	R0, R0, R1
UXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_den1+0)
MOVT	R0, #hi_addr(_den1+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S0, #0
VMRS	#60, FPSCR
IT	LE
BLE	L_ekstraksi129
;qrsdetection.h,308 :: 		absden = (yy[i] - yy[ll-1]);}
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_yy+0)
MOVT	R0, #hi_addr(_yy+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_ll+0)
MOVT	R0, #hi_addr(_ll+0)
LDRH	R0, [R0, #0]
SUBS	R0, R0, #1
UXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_yy+0)
MOVT	R0, #hi_addr(_yy+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VSUB.F32	S0, S1, S0
MOVW	R0, #lo_addr(_absden+0)
MOVT	R0, #hi_addr(_absden+0)
VSTR	#1, S0, [R0, #0]
IT	AL
BAL	L_ekstraksi130
L_ekstraksi129:
;qrsdetection.h,310 :: 		{absden = -(yy[i] - yy[ll-1]);}  }
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_yy+0)
MOVT	R0, #hi_addr(_yy+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_ll+0)
MOVT	R0, #hi_addr(_ll+0)
LDRH	R0, [R0, #0]
SUBS	R0, R0, #1
UXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_yy+0)
MOVT	R0, #hi_addr(_yy+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VSUB.F32	S0, S1, S0
VNEG.F32	S0, S0
MOVW	R0, #lo_addr(_absden+0)
MOVT	R0, #hi_addr(_absden+0)
VSTR	#1, S0, [R0, #0]
L_ekstraksi130:
;qrsdetection.h,300 :: 		for (ll=startt+i+1;ll<=end;ll++){
MOVW	R1, #lo_addr(_ll+0)
MOVT	R1, #hi_addr(_ll+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;qrsdetection.h,310 :: 		{absden = -(yy[i] - yy[ll-1]);}  }
IT	AL
BAL	L_ekstraksi124
L_ekstraksi125:
;qrsdetection.h,311 :: 		den2 += absden;  }
MOVW	R0, #lo_addr(_absden+0)
MOVT	R0, #hi_addr(_absden+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_den2+0)
MOVT	R0, #hi_addr(_den2+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;qrsdetection.h,299 :: 		for (i=startt;i<=end;i++){
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;qrsdetection.h,311 :: 		den2 += absden;  }
IT	AL
BAL	L_ekstraksi121
L_ekstraksi122:
;qrsdetection.h,312 :: 		NN = floor(((3.1415*(num))/(den2))+0.5);
MOVW	R0, #lo_addr(_num+0)
MOVT	R0, #hi_addr(_num+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #3670
MOVT	R0, #16457
VMOV	S0, R0
VMUL.F32	S1, S0, S1
MOVW	R0, #lo_addr(_den2+0)
MOVT	R0, #hi_addr(_den2+0)
VLDR	#1, S0, [R0, #0]
VDIV.F32	S1, S1, S0
VMOV.F32	S0, #0.5
VADD.F32	S0, S1, S0
BL	_floor+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
MOVW	R0, #lo_addr(_NN+0)
MOVT	R0, #hi_addr(_NN+0)
STRH	R1, [R0, #0]
;qrsdetection.h,314 :: 		num22 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_num22+0)
MOVT	R0, #hi_addr(_num22+0)
VSTR	#1, S0, [R0, #0]
;qrsdetection.h,315 :: 		den22=0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_den22+0)
MOVT	R0, #hi_addr(_den22+0)
VSTR	#1, S0, [R0, #0]
;qrsdetection.h,316 :: 		for (i=startt;i<=end;i++){
MOVW	R0, #lo_addr(_startt+0)
MOVT	R0, #hi_addr(_startt+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_ekstraksi131:
MOVW	R0, #lo_addr(_end+0)
MOVT	R0, #hi_addr(_end+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	HI
BHI	L_ekstraksi132
;qrsdetection.h,317 :: 		for (j=startt+NN;j<=end;j++){
MOVW	R0, #lo_addr(_NN+0)
MOVT	R0, #hi_addr(_NN+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_startt+0)
MOVT	R0, #hi_addr(_startt+0)
LDRSH	R0, [R0, #0]
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_j+0)
MOVT	R0, #hi_addr(_j+0)
STRH	R1, [R0, #0]
L_ekstraksi134:
MOVW	R0, #lo_addr(_end+0)
MOVT	R0, #hi_addr(_end+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_j+0)
MOVT	R0, #hi_addr(_j+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	GT
BGT	L_ekstraksi135
;qrsdetection.h,319 :: 		if (yy[i] > 0){
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_yy+0)
MOVT	R0, #hi_addr(_yy+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S0, #0
VMRS	#60, FPSCR
IT	LE
BLE	L_ekstraksi137
;qrsdetection.h,320 :: 		absnum22 = yy[i];}
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_yy+0)
MOVT	R0, #hi_addr(_yy+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_absnum22+0)
MOVT	R0, #hi_addr(_absnum22+0)
VSTR	#1, S0, [R0, #0]
IT	AL
BAL	L_ekstraksi138
L_ekstraksi137:
;qrsdetection.h,322 :: 		{absnum22 = -(yy[i]);}
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_yy+0)
MOVT	R0, #hi_addr(_yy+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VNEG.F32	S0, S0
MOVW	R0, #lo_addr(_absnum22+0)
MOVT	R0, #hi_addr(_absnum22+0)
VSTR	#1, S0, [R0, #0]
L_ekstraksi138:
;qrsdetection.h,323 :: 		num2 += absnum22;
MOVW	R0, #lo_addr(_absnum22+0)
MOVT	R0, #hi_addr(_absnum22+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_num2+0)
MOVT	R0, #hi_addr(_num2+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;qrsdetection.h,324 :: 		if ((yy[i] + yy[j-NN]) > 0){
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_yy+0)
MOVT	R0, #hi_addr(_yy+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_NN+0)
MOVT	R0, #hi_addr(_NN+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_j+0)
MOVT	R0, #hi_addr(_j+0)
LDRSH	R0, [R0, #0]
SUB	R0, R0, R1
SXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_yy+0)
MOVT	R0, #hi_addr(_yy+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S1, S0
VCMPE.F32	S0, #0
VMRS	#60, FPSCR
IT	LE
BLE	L_ekstraksi139
;qrsdetection.h,325 :: 		absnum2 = (yy[i] + yy[j-NN]);}
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_yy+0)
MOVT	R0, #hi_addr(_yy+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_NN+0)
MOVT	R0, #hi_addr(_NN+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_j+0)
MOVT	R0, #hi_addr(_j+0)
LDRSH	R0, [R0, #0]
SUB	R0, R0, R1
SXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_yy+0)
MOVT	R0, #hi_addr(_yy+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S1, S0
MOVW	R0, #lo_addr(_absnum2+0)
MOVT	R0, #hi_addr(_absnum2+0)
VSTR	#1, S0, [R0, #0]
IT	AL
BAL	L_ekstraksi140
L_ekstraksi139:
;qrsdetection.h,327 :: 		{absnum2 = -(yy[i] + yy[j-NN]);}
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_yy+0)
MOVT	R0, #hi_addr(_yy+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_NN+0)
MOVT	R0, #hi_addr(_NN+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_j+0)
MOVT	R0, #hi_addr(_j+0)
LDRSH	R0, [R0, #0]
SUB	R0, R0, R1
SXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_yy+0)
MOVT	R0, #hi_addr(_yy+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S1, S0
VNEG.F32	S0, S0
MOVW	R0, #lo_addr(_absnum2+0)
MOVT	R0, #hi_addr(_absnum2+0)
VSTR	#1, S0, [R0, #0]
L_ekstraksi140:
;qrsdetection.h,328 :: 		num22 += absnum2;
MOVW	R0, #lo_addr(_absnum2+0)
MOVT	R0, #hi_addr(_absnum2+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_num22+0)
MOVT	R0, #hi_addr(_num22+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;qrsdetection.h,329 :: 		if (yy[j-NN] > 0){
MOVW	R0, #lo_addr(_NN+0)
MOVT	R0, #hi_addr(_NN+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_j+0)
MOVT	R0, #hi_addr(_j+0)
LDRSH	R0, [R0, #0]
SUB	R0, R0, R1
SXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_yy+0)
MOVT	R0, #hi_addr(_yy+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VCMPE.F32	S0, #0
VMRS	#60, FPSCR
IT	LE
BLE	L_ekstraksi141
;qrsdetection.h,330 :: 		absden2 = yy[j-NN];}
MOVW	R0, #lo_addr(_NN+0)
MOVT	R0, #hi_addr(_NN+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_j+0)
MOVT	R0, #hi_addr(_j+0)
LDRSH	R0, [R0, #0]
SUB	R0, R0, R1
SXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_yy+0)
MOVT	R0, #hi_addr(_yy+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_absden2+0)
MOVT	R0, #hi_addr(_absden2+0)
VSTR	#1, S0, [R0, #0]
IT	AL
BAL	L_ekstraksi142
L_ekstraksi141:
;qrsdetection.h,332 :: 		{absden2 = -(yy[j-NN]);}
MOVW	R0, #lo_addr(_NN+0)
MOVT	R0, #hi_addr(_NN+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_j+0)
MOVT	R0, #hi_addr(_j+0)
LDRSH	R0, [R0, #0]
SUB	R0, R0, R1
SXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_yy+0)
MOVT	R0, #hi_addr(_yy+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VNEG.F32	S0, S0
MOVW	R0, #lo_addr(_absden2+0)
MOVT	R0, #hi_addr(_absden2+0)
VSTR	#1, S0, [R0, #0]
L_ekstraksi142:
;qrsdetection.h,333 :: 		temptemp = absnum22+absden2;
MOVW	R0, #lo_addr(_absden2+0)
MOVT	R0, #hi_addr(_absden2+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_absnum22+0)
MOVT	R0, #hi_addr(_absnum22+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S1, S0, S1
MOVW	R0, #lo_addr(_temptemp+0)
MOVT	R0, #hi_addr(_temptemp+0)
VSTR	#1, S1, [R0, #0]
;qrsdetection.h,334 :: 		den22 += (temptemp);  }
MOVW	R0, #lo_addr(_den22+0)
MOVT	R0, #hi_addr(_den22+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;qrsdetection.h,317 :: 		for (j=startt+NN;j<=end;j++){
MOVW	R1, #lo_addr(_j+0)
MOVT	R1, #hi_addr(_j+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;qrsdetection.h,334 :: 		den22 += (temptemp);  }
IT	AL
BAL	L_ekstraksi134
L_ekstraksi135:
;qrsdetection.h,335 :: 		hasilvfleak = num22/den22; }
MOVW	R0, #lo_addr(_den22+0)
MOVT	R0, #hi_addr(_den22+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_num22+0)
MOVT	R0, #hi_addr(_num22+0)
VLDR	#1, S0, [R0, #0]
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_hasilvfleak+0)
MOVT	R0, #hi_addr(_hasilvfleak+0)
VSTR	#1, S0, [R0, #0]
;qrsdetection.h,316 :: 		for (i=startt;i<=end;i++){
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;qrsdetection.h,335 :: 		hasilvfleak = num22/den22; }
IT	AL
BAL	L_ekstraksi131
L_ekstraksi132:
;qrsdetection.h,336 :: 		input[2] = hasilvfleak;
MOVW	R0, #lo_addr(_hasilvfleak+0)
MOVT	R0, #hi_addr(_hasilvfleak+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_input+8)
MOVT	R0, #hi_addr(_input+8)
VSTR	#1, S0, [R0, #0]
;qrsdetection.h,338 :: 		Delay_ms(100);
MOVW	R7, #29438
MOVT	R7, #85
NOP
NOP
L_ekstraksi143:
SUBS	R7, R7, #1
BNE	L_ekstraksi143
NOP
NOP
NOP
;qrsdetection.h,339 :: 		IntToStr(hasilcount2, Label3_Caption);
MOVW	R0, #lo_addr(_hasilcount2+0)
MOVT	R0, #hi_addr(_hasilcount2+0)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_Label3_Caption+0)
MOVT	R1, #hi_addr(_Label3_Caption+0)
BL	_IntToStr+0
;qrsdetection.h,340 :: 		TFT_Write_Text(Label3_Caption,78,96);
MOVS	R2, #96
MOVS	R1, #78
MOVW	R0, #lo_addr(_Label3_Caption+0)
MOVT	R0, #hi_addr(_Label3_Caption+0)
BL	_TFT_Write_Text+0
;qrsdetection.h,341 :: 		IntToStr(hasilcount1, Label4_Caption);
MOVW	R0, #lo_addr(_hasilcount1+0)
MOVT	R0, #hi_addr(_hasilcount1+0)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_Label4_Caption+0)
MOVT	R1, #hi_addr(_Label4_Caption+0)
BL	_IntToStr+0
;qrsdetection.h,342 :: 		TFT_Write_Text(Label4_Caption,83,52);
MOVS	R2, #52
MOVS	R1, #83
MOVW	R0, #lo_addr(_Label4_Caption+0)
MOVT	R0, #hi_addr(_Label4_Caption+0)
BL	_TFT_Write_Text+0
;qrsdetection.h,343 :: 		FloatToStr(hasilvfleak, Label5_Caption);
MOVW	R0, #lo_addr(_hasilvfleak+0)
MOVT	R0, #hi_addr(_hasilvfleak+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_Label5_Caption+0)
MOVT	R0, #hi_addr(_Label5_Caption+0)
BL	_FloatToStr+0
;qrsdetection.h,344 :: 		TFT_Write_Text(Label5_Caption,321,96);
MOVS	R2, #96
MOVW	R1, #321
MOVW	R0, #lo_addr(_Label5_Caption+0)
MOVT	R0, #hi_addr(_Label5_Caption+0)
BL	_TFT_Write_Text+0
;qrsdetection.h,347 :: 		}
L_end_ekstraksi:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ekstraksi
_tan_h:
;variabel_ann.h,1236 :: 		double tan_h(double x){
SUB	SP, SP, #8
STR	LR, [SP, #0]
; x start address is: 0 (R0)
VMOV.F32	S4, S0
; x end address is: 0 (R0)
; x start address is: 16 (R4)
;variabel_ann.h,1237 :: 		double ttan = (exp(x)-exp(-x));
VMOV.F32	S0, S4
BL	_exp+0
VSTR	#1, S0, [SP, #4]
VNEG.F32	S0, S4
BL	_exp+0
VLDR	#1, S1, [SP, #4]
VSUB.F32	S0, S1, S0
; ttan start address is: 20 (R5)
VMOV.F32	S5, S0
;variabel_ann.h,1238 :: 		double ttan2 = (exp(x)+exp(-x));
VMOV.F32	S0, S4
BL	_exp+0
VSTR	#1, S0, [SP, #4]
VNEG.F32	S0, S4
; x end address is: 16 (R4)
BL	_exp+0
VLDR	#1, S1, [SP, #4]
VADD.F32	S0, S1, S0
;variabel_ann.h,1239 :: 		return (ttan/ttan2);
VDIV.F32	S0, S5, S0
; ttan end address is: 20 (R5)
;variabel_ann.h,1240 :: 		}
L_end_tan_h:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _tan_h
_sigmoid:
;variabel_ann.h,1242 :: 		double sigmoid(double x){
SUB	SP, SP, #4
STR	LR, [SP, #0]
; x start address is: 0 (R0)
VMOV.F32	S1, S0
; x end address is: 0 (R0)
; x start address is: 4 (R1)
;variabel_ann.h,1243 :: 		double sig = exp(-x);
VNEG.F32	S0, S1
; x end address is: 4 (R1)
BL	_exp+0
;variabel_ann.h,1244 :: 		double ssig = 1/(1+sig);
VMOV.F32	S1, #1
VADD.F32	S1, S1, S0
VMOV.F32	S0, #1
VDIV.F32	S0, S0, S1
;variabel_ann.h,1245 :: 		return ssig;
;variabel_ann.h,1246 :: 		}
L_end_sigmoid:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _sigmoid
_relu:
;variabel_ann.h,1247 :: 		double relu(double x){
; x start address is: 0 (R0)
; x end address is: 0 (R0)
; x start address is: 0 (R0)
;variabel_ann.h,1248 :: 		if (x<0){
VCMPE.F32	S0, #0
VMRS	#60, FPSCR
IT	GE
BGE	L_relu145
; x end address is: 0 (R0)
;variabel_ann.h,1249 :: 		return 0;
MOV	R1, #0
VMOV	S0, R1
IT	AL
BAL	L_end_relu
;variabel_ann.h,1250 :: 		}
L_relu145:
;variabel_ann.h,1252 :: 		return x;
; x start address is: 0 (R0)
; x end address is: 0 (R0)
;variabel_ann.h,1254 :: 		}
L_end_relu:
BX	LR
; end of _relu
_inputtohidden1:
;ann.h,3 :: 		void inputtohidden1(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ann.h,7 :: 		for (i = 0; i<=59; i++){  //loop banyak neuron di hidden layer 1 (40)
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_inputtohidden1147:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
CMP	R0, #59
IT	HI
BHI	L_inputtohidden1148
;ann.h,8 :: 		temp1=0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;ann.h,9 :: 		temp2=0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp2+0)
MOVT	R0, #hi_addr(_temp2+0)
VSTR	#1, S0, [R0, #0]
;ann.h,10 :: 		for (j = 0; j<=2; j++){   //loop input layer
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_j+0)
MOVT	R0, #hi_addr(_j+0)
STRH	R1, [R0, #0]
L_inputtohidden1150:
MOVW	R0, #lo_addr(_j+0)
MOVT	R0, #hi_addr(_j+0)
LDRSH	R0, [R0, #0]
CMP	R0, #2
IT	GT
BGT	L_inputtohidden1151
;ann.h,11 :: 		temp1 = temp1 + input[j]*weight1[j][i];
MOVW	R3, #lo_addr(_j+0)
MOVT	R3, #hi_addr(_j+0)
LDRSH	R0, [R3, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_input+0)
MOVT	R0, #hi_addr(_input+0)
ADDS	R2, R0, R1
MOV	R0, R3
LDRSH	R1, [R0, #0]
MOVS	R0, #240
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_weight1+0)
MOVT	R0, #hi_addr(_weight1+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S1, [R0, #0]
VLDR	#1, S0, [R2, #0]
VMUL.F32	S1, S0, S1
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;ann.h,10 :: 		for (j = 0; j<=2; j++){   //loop input layer
MOV	R0, R3
LDRSH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R3, #0]
;ann.h,13 :: 		}
IT	AL
BAL	L_inputtohidden1150
L_inputtohidden1151:
;ann.h,14 :: 		temp1 = temp1 + bias1[i];
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_bias1+0)
MOVT	R0, #hi_addr(_bias1+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;ann.h,15 :: 		temp2 = relu(temp1);
BL	_relu+0
MOVW	R0, #lo_addr(_temp2+0)
MOVT	R0, #hi_addr(_temp2+0)
VSTR	#1, S0, [R0, #0]
;ann.h,16 :: 		hidden1[i] = temp2;
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRH	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_hidden1+0)
MOVT	R0, #hi_addr(_hidden1+0)
ADDS	R0, R0, R1
VSTR	#1, S0, [R0, #0]
;ann.h,7 :: 		for (i = 0; i<=59; i++){  //loop banyak neuron di hidden layer 1 (40)
MOV	R0, R2
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R2, #0]
;ann.h,17 :: 		}
IT	AL
BAL	L_inputtohidden1147
L_inputtohidden1148:
;ann.h,20 :: 		}
L_end_inputtohidden1:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _inputtohidden1
_hidden1tohidden2:
;ann.h,22 :: 		void hidden1tohidden2(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ann.h,23 :: 		for (i = 0; i<=39; i++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_hidden1tohidden2153:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
CMP	R0, #39
IT	HI
BHI	L_hidden1tohidden2154
;ann.h,24 :: 		temp1 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;ann.h,25 :: 		temp2 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp2+0)
MOVT	R0, #hi_addr(_temp2+0)
VSTR	#1, S0, [R0, #0]
;ann.h,26 :: 		for (j = 0; j<=59; j++){
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_j+0)
MOVT	R0, #hi_addr(_j+0)
STRH	R1, [R0, #0]
L_hidden1tohidden2156:
MOVW	R0, #lo_addr(_j+0)
MOVT	R0, #hi_addr(_j+0)
LDRSH	R0, [R0, #0]
CMP	R0, #59
IT	GT
BGT	L_hidden1tohidden2157
;ann.h,27 :: 		temp1 = temp1 + hidden1[j]*weight2[j][i];
MOVW	R3, #lo_addr(_j+0)
MOVT	R3, #hi_addr(_j+0)
LDRSH	R0, [R3, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_hidden1+0)
MOVT	R0, #hi_addr(_hidden1+0)
ADDS	R2, R0, R1
MOV	R0, R3
LDRSH	R1, [R0, #0]
MOVS	R0, #160
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_weight2+0)
MOVT	R0, #hi_addr(_weight2+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S1, [R0, #0]
VLDR	#1, S0, [R2, #0]
VMUL.F32	S1, S0, S1
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;ann.h,26 :: 		for (j = 0; j<=59; j++){
MOV	R0, R3
LDRSH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R3, #0]
;ann.h,28 :: 		}
IT	AL
BAL	L_hidden1tohidden2156
L_hidden1tohidden2157:
;ann.h,29 :: 		temp1 = temp1+ bias2[i];
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_bias2+0)
MOVT	R0, #hi_addr(_bias2+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;ann.h,30 :: 		temp2 = relu(temp1);
BL	_relu+0
MOVW	R0, #lo_addr(_temp2+0)
MOVT	R0, #hi_addr(_temp2+0)
VSTR	#1, S0, [R0, #0]
;ann.h,31 :: 		hidden2[i] = temp2;
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRH	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_hidden2+0)
MOVT	R0, #hi_addr(_hidden2+0)
ADDS	R0, R0, R1
VSTR	#1, S0, [R0, #0]
;ann.h,23 :: 		for (i = 0; i<=39; i++){
MOV	R0, R2
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R2, #0]
;ann.h,32 :: 		}
IT	AL
BAL	L_hidden1tohidden2153
L_hidden1tohidden2154:
;ann.h,35 :: 		}
L_end_hidden1tohidden2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _hidden1tohidden2
_hidden2tohidden3:
;ann.h,37 :: 		void hidden2tohidden3(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ann.h,38 :: 		for (i = 0; i<=19; i++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_hidden2tohidden3159:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
CMP	R0, #19
IT	HI
BHI	L_hidden2tohidden3160
;ann.h,39 :: 		temp1 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;ann.h,40 :: 		temp2 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp2+0)
MOVT	R0, #hi_addr(_temp2+0)
VSTR	#1, S0, [R0, #0]
;ann.h,41 :: 		for (j = 0; j<=39; j++){
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_j+0)
MOVT	R0, #hi_addr(_j+0)
STRH	R1, [R0, #0]
L_hidden2tohidden3162:
MOVW	R0, #lo_addr(_j+0)
MOVT	R0, #hi_addr(_j+0)
LDRSH	R0, [R0, #0]
CMP	R0, #39
IT	GT
BGT	L_hidden2tohidden3163
;ann.h,42 :: 		temp1 = temp1 + hidden2[j]*weight3[j][i];
MOVW	R3, #lo_addr(_j+0)
MOVT	R3, #hi_addr(_j+0)
LDRSH	R0, [R3, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_hidden2+0)
MOVT	R0, #hi_addr(_hidden2+0)
ADDS	R2, R0, R1
MOV	R0, R3
LDRSH	R1, [R0, #0]
MOVS	R0, #80
MULS	R1, R0, R1
MOVW	R0, #lo_addr(_weight3+0)
MOVT	R0, #hi_addr(_weight3+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S1, [R0, #0]
VLDR	#1, S0, [R2, #0]
VMUL.F32	S1, S0, S1
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;ann.h,41 :: 		for (j = 0; j<=39; j++){
MOV	R0, R3
LDRSH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R3, #0]
;ann.h,43 :: 		}
IT	AL
BAL	L_hidden2tohidden3162
L_hidden2tohidden3163:
;ann.h,44 :: 		temp1 = temp1 + bias3[i];
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_bias3+0)
MOVT	R0, #hi_addr(_bias3+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;ann.h,45 :: 		temp2 = relu(temp1);
BL	_relu+0
MOVW	R0, #lo_addr(_temp2+0)
MOVT	R0, #hi_addr(_temp2+0)
VSTR	#1, S0, [R0, #0]
;ann.h,46 :: 		hidden3[i] = temp2;
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRH	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_hidden3+0)
MOVT	R0, #hi_addr(_hidden3+0)
ADDS	R0, R0, R1
VSTR	#1, S0, [R0, #0]
;ann.h,38 :: 		for (i = 0; i<=19; i++){
MOV	R0, R2
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R2, #0]
;ann.h,47 :: 		}
IT	AL
BAL	L_hidden2tohidden3159
L_hidden2tohidden3160:
;ann.h,51 :: 		}
L_end_hidden2tohidden3:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _hidden2tohidden3
_hidden3toout:
;ann.h,53 :: 		void hidden3toout(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ann.h,54 :: 		for (i = 0; i<1; i++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_hidden3toout165:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
CMP	R0, #1
IT	CS
BCS	L_hidden3toout166
;ann.h,55 :: 		temp1 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VSTR	#1, S0, [R0, #0]
;ann.h,56 :: 		temp2 = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_temp2+0)
MOVT	R0, #hi_addr(_temp2+0)
VSTR	#1, S0, [R0, #0]
;ann.h,57 :: 		for (j = 0; j<=19; j++){
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_j+0)
MOVT	R0, #hi_addr(_j+0)
STRH	R1, [R0, #0]
L_hidden3toout168:
MOVW	R0, #lo_addr(_j+0)
MOVT	R0, #hi_addr(_j+0)
LDRSH	R0, [R0, #0]
CMP	R0, #19
IT	GT
BGT	L_hidden3toout169
;ann.h,58 :: 		temp1 = temp1 + hidden3[j]*output_weight[j][i];
MOVW	R3, #lo_addr(_j+0)
MOVT	R3, #hi_addr(_j+0)
LDRSH	R0, [R3, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_hidden3+0)
MOVT	R0, #hi_addr(_hidden3+0)
ADDS	R2, R0, R1
MOVW	R0, #lo_addr(_output_weight+0)
MOVT	R0, #hi_addr(_output_weight+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
VLDR	#1, S1, [R0, #0]
VLDR	#1, S0, [R2, #0]
VMUL.F32	S1, S0, S1
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;ann.h,57 :: 		for (j = 0; j<=19; j++){
MOV	R0, R3
LDRSH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R3, #0]
;ann.h,59 :: 		}
IT	AL
BAL	L_hidden3toout168
L_hidden3toout169:
;ann.h,60 :: 		temp1 = temp1+ output_bias[i];
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_output_bias+0)
MOVT	R0, #hi_addr(_output_bias+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_temp1+0)
MOVT	R0, #hi_addr(_temp1+0)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [R0, #0]
;ann.h,61 :: 		temp2 = sigmoid(temp1);
BL	_sigmoid+0
MOVW	R0, #lo_addr(_temp2+0)
MOVT	R0, #hi_addr(_temp2+0)
VSTR	#1, S0, [R0, #0]
;ann.h,62 :: 		hidden4[i] = temp2;}
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRH	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_hidden4+0)
MOVT	R0, #hi_addr(_hidden4+0)
ADDS	R0, R0, R1
VSTR	#1, S0, [R0, #0]
;ann.h,54 :: 		for (i = 0; i<1; i++){
MOV	R0, R2
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R2, #0]
;ann.h,62 :: 		hidden4[i] = temp2;}
IT	AL
BAL	L_hidden3toout165
L_hidden3toout166:
;ann.h,63 :: 		if (temp2 >= 0.1){
MOVW	R0, #lo_addr(_temp2+0)
MOVT	R0, #hi_addr(_temp2+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LT
BLT	L_hidden3toout171
;ann.h,64 :: 		detection = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_detection+0)
MOVT	R0, #hi_addr(_detection+0)
STRH	R1, [R0, #0]
;ann.h,65 :: 		}
IT	AL
BAL	L_hidden3toout172
L_hidden3toout171:
;ann.h,66 :: 		else {detection = 0;}
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_detection+0)
MOVT	R0, #hi_addr(_detection+0)
STRH	R1, [R0, #0]
L_hidden3toout172:
;ann.h,67 :: 		Delay_ms(100);
MOVW	R7, #29438
MOVT	R7, #85
NOP
NOP
L_hidden3toout173:
SUBS	R7, R7, #1
BNE	L_hidden3toout173
NOP
NOP
NOP
;ann.h,68 :: 		FloatToStr(hidden4[0], Label6_Caption);
MOVW	R0, #lo_addr(_hidden4+0)
MOVT	R0, #hi_addr(_hidden4+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_Label6_Caption+0)
MOVT	R0, #hi_addr(_Label6_Caption+0)
BL	_FloatToStr+0
;ann.h,69 :: 		TFT_Write_Text(Label6_Caption,182,203);
MOVS	R2, #203
MOVS	R1, #182
MOVW	R0, #lo_addr(_Label6_Caption+0)
MOVT	R0, #hi_addr(_Label6_Caption+0)
BL	_TFT_Write_Text+0
;ann.h,70 :: 		IntToStr(detection, Label7_Caption);
MOVW	R0, #lo_addr(_detection+0)
MOVT	R0, #hi_addr(_detection+0)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_Label7_Caption+0)
MOVT	R1, #hi_addr(_Label7_Caption+0)
BL	_IntToStr+0
;ann.h,71 :: 		TFT_Write_Text(Label7_Caption,375,203);
MOVS	R2, #203
MOVW	R1, #375
MOVW	R0, #lo_addr(_Label7_Caption+0)
MOVT	R0, #hi_addr(_Label7_Caption+0)
BL	_TFT_Write_Text+0
;ann.h,73 :: 		}
L_end_hidden3toout:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _hidden3toout
_InitTimer2:
;MyProject_events_code.c,62 :: 		void InitTimer2(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_events_code.c,63 :: 		RCC_APB1ENR.TIM2EN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
_SX	[R0, ByteOffset(RCC_APB1ENR+0)]
;MyProject_events_code.c,64 :: 		TIM2_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
_SX	[R0, ByteOffset(TIM2_CR1+0)]
;MyProject_events_code.c,65 :: 		TIM2_PSC = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;MyProject_events_code.c,66 :: 		TIM2_ARR = 39999;
MOVW	R1, #39999
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;MyProject_events_code.c,67 :: 		NVIC_IntEnable(IVT_INT_TIM2);
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;MyProject_events_code.c,68 :: 		TIM2_DIER.UIE = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
_SX	[R0, ByteOffset(TIM2_DIER+0)]
;MyProject_events_code.c,69 :: 		TIM2_CR1.CEN = 1;
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
_SX	[R0, ByteOffset(TIM2_CR1+0)]
;MyProject_events_code.c,70 :: 		}
L_end_InitTimer2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitTimer2
_plotRes:
;MyProject_events_code.c,73 :: 		void plotRes( float plotData, uint32_t plotTime ) //uint16_t plotData
; plotData start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
STR	R0, [SP, #4]
; plotData end address is: 0 (R0)
; plotData start address is: 0 (R0)
;MyProject_events_code.c,75 :: 		FloatToStr( plotData, text );
MOVW	R0, #lo_addr(_text+0)
MOVT	R0, #hi_addr(_text+0)
; plotData end address is: 0 (R0)
BL	_FloatToStr+0
;MyProject_events_code.c,76 :: 		mikrobus_logWrite( text, _LOG_TEXT );
MOVS	R1, #1
MOVW	R0, #lo_addr(_text+0)
MOVT	R0, #hi_addr(_text+0)
BL	_mikrobus_logWrite+0
;MyProject_events_code.c,77 :: 		mikrobus_logWrite( ",", _LOG_TEXT );
MOVW	R1, #lo_addr(?lstr1_MyProject_events_code+0)
MOVT	R1, #hi_addr(?lstr1_MyProject_events_code+0)
MOV	R0, R1
MOVS	R1, #1
BL	_mikrobus_logWrite+0
;MyProject_events_code.c,78 :: 		LongWordToStr( plotTime, text );
MOVW	R1, #lo_addr(_text+0)
MOVT	R1, #hi_addr(_text+0)
LDR	R0, [SP, #4]
BL	_LongWordToStr+0
;MyProject_events_code.c,79 :: 		mikrobus_logWrite( text, _LOG_LINE );
MOVS	R1, #2
MOVW	R0, #lo_addr(_text+0)
MOVT	R0, #hi_addr(_text+0)
BL	_mikrobus_logWrite+0
;MyProject_events_code.c,80 :: 		}
L_end_plotRes:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _plotRes
_systemInit:
;MyProject_events_code.c,83 :: 		void systemInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_events_code.c,85 :: 		mikrobus_gpioInit( _MIKROBUS2, _MIKROBUS_AN_PIN, _GPIO_INPUT );
MOVS	R2, #1
MOVS	R1, #0
MOVS	R0, #1
BL	_mikrobus_gpioInit+0
;MyProject_events_code.c,87 :: 		mikrobus_logInit( _LOG_USBUART, 115200 );
MOV	R1, #115200
MOVS	R0, #16
BL	_mikrobus_logInit+0
;MyProject_events_code.c,89 :: 		Delay_ms( 200 );
MOVW	R7, #58878
MOVT	R7, #170
NOP
NOP
L_systemInit175:
SUBS	R7, R7, #1
BNE	L_systemInit175
NOP
NOP
NOP
;MyProject_events_code.c,91 :: 		mikrobus_uartInit( _MIKROBUS1, &_USB_UART_UART_CFG[0] );
MOVW	R0, #lo_addr(__USB_UART_UART_CFG+0)
MOVT	R0, #hi_addr(__USB_UART_UART_CFG+0)
MOV	R1, R0
MOVS	R0, #0
BL	_mikrobus_uartInit+0
;MyProject_events_code.c,92 :: 		mikrobus_logInit( _MIKROBUS1, 115200 );
MOV	R1, #115200
MOVS	R0, #0
BL	_mikrobus_logInit+0
;MyProject_events_code.c,94 :: 		Delay_ms( 100 );
MOVW	R7, #29438
MOVT	R7, #85
NOP
NOP
L_systemInit177:
SUBS	R7, R7, #1
BNE	L_systemInit177
NOP
NOP
NOP
;MyProject_events_code.c,96 :: 		}
L_end_systemInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _systemInit
_bingkai:
;MyProject_events_code.c,98 :: 		void bingkai(int X1,int Y1, int X2, int Y2)
; Y2 start address is: 12 (R3)
; X2 start address is: 8 (R2)
; Y1 start address is: 4 (R1)
; X1 start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
SXTH	R7, R0
SXTH	R8, R1
SXTH	R9, R2
SXTH	R10, R3
; Y2 end address is: 12 (R3)
; X2 end address is: 8 (R2)
; Y1 end address is: 4 (R1)
; X1 end address is: 0 (R0)
; X1 start address is: 28 (R7)
; Y1 start address is: 32 (R8)
; X2 start address is: 36 (R9)
; Y2 start address is: 40 (R10)
;MyProject_events_code.c,100 :: 		TFT_Set_Pen(CL_WHITE, 1);
MOVS	R1, #1
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;MyProject_events_code.c,101 :: 		TFT_Set_Brush(1, CL_WHITE, 0, TOP_TO_BOTTOM, CL_GREEN, CL_GREEN);
MOVW	R5, #1024
MOVW	R4, #1024
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #65535
MOVS	R0, #1
PUSH	(R5)
PUSH	(R4)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;MyProject_events_code.c,102 :: 		TFT_Rectangle(X1,Y1,X2,Y2);
SXTH	R3, R10
; Y2 end address is: 40 (R10)
SXTH	R2, R9
; X2 end address is: 36 (R9)
SXTH	R1, R8
; Y1 end address is: 32 (R8)
SXTH	R0, R7
; X1 end address is: 28 (R7)
BL	_TFT_Rectangle+0
;MyProject_events_code.c,103 :: 		}
L_end_bingkai:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _bingkai
_applicationInit:
;MyProject_events_code.c,107 :: 		void applicationInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_events_code.c,109 :: 		usb_uart_uartDriverInit( (T_USB_UART_P)&_MIKROBUS4_GPIO, (T_USB_UART_P)&_MIKROBUS4_UART );
MOVW	R1, #lo_addr(__MIKROBUS4_UART+0)
MOVT	R1, #hi_addr(__MIKROBUS4_UART+0)
MOVW	R0, #lo_addr(__MIKROBUS4_GPIO+0)
MOVT	R0, #hi_addr(__MIKROBUS4_GPIO+0)
BL	_usb_uart_uartDriverInit+0
;MyProject_events_code.c,110 :: 		mikrobus_logWrite( "Initialized", _LOG_LINE );
MOVW	R0, #lo_addr(?lstr2_MyProject_events_code+0)
MOVT	R0, #hi_addr(?lstr2_MyProject_events_code+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;MyProject_events_code.c,111 :: 		Delay_ms( 100 );
MOVW	R7, #29438
MOVT	R7, #85
NOP
NOP
L_applicationInit179:
SUBS	R7, R7, #1
BNE	L_applicationInit179
NOP
NOP
NOP
;MyProject_events_code.c,113 :: 		ecg_gpioDriverInit( (T_ECG_P)&_MIKROBUS1_GPIO );
MOVW	R0, #lo_addr(__MIKROBUS1_GPIO+0)
MOVT	R0, #hi_addr(__MIKROBUS1_GPIO+0)
BL	_ecg_gpioDriverInit+0
;MyProject_events_code.c,114 :: 		Delay_ms( 200 );
MOVW	R7, #58878
MOVT	R7, #170
NOP
NOP
L_applicationInit181:
SUBS	R7, R7, #1
BNE	L_applicationInit181
NOP
NOP
NOP
;MyProject_events_code.c,116 :: 		ADC1_Init();
BL	_ADC1_Init+0
;MyProject_events_code.c,117 :: 		ADC_Set_Input_Channel( _ADC_CHANNEL_8 );
MOVW	R0, #256
BL	_ADC_Set_Input_Channel+0
;MyProject_events_code.c,118 :: 		Delay_ms( 200 );
MOVW	R7, #58878
MOVT	R7, #170
NOP
NOP
L_applicationInit183:
SUBS	R7, R7, #1
BNE	L_applicationInit183
NOP
NOP
NOP
;MyProject_events_code.c,120 :: 		initTimer2();
BL	_InitTimer2+0
;MyProject_events_code.c,121 :: 		interrFlag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_interrFlag+0)
MOVT	R0, #hi_addr(_interrFlag+0)
STRB	R1, [R0, #0]
;MyProject_events_code.c,122 :: 		interrCnt = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_interrCnt+0)
MOVT	R0, #hi_addr(_interrCnt+0)
STR	R1, [R0, #0]
;MyProject_events_code.c,123 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;MyProject_events_code.c,124 :: 		}
L_end_applicationInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _applicationInit
_applicationTask:
;MyProject_events_code.c,126 :: 		void applicationTask()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_events_code.c,130 :: 		n = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_n+0)
MOVT	R0, #hi_addr(_n+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,132 :: 		while( n != 0 )
L_applicationTask185:
MOVW	R0, #lo_addr(_n+0)
MOVT	R0, #hi_addr(_n+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_applicationTask186
;MyProject_events_code.c,134 :: 		bingkai(100,50,477,271);
MOVW	R3, #271
SXTH	R3, R3
MOVW	R2, #477
SXTH	R2, R2
MOVS	R1, #50
SXTH	R1, R1
MOVS	R0, #100
SXTH	R0, R0
BL	_bingkai+0
;MyProject_events_code.c,135 :: 		readADC = ADC1_Get_Sample(8);
MOVS	R0, #8
BL	_ADC1_Get_Sample+0
MOVW	R1, #lo_addr(_readADC+0)
MOVT	R1, #hi_addr(_readADC+0)
STRH	R0, [R1, #0]
;MyProject_events_code.c,136 :: 		sign[0] = (float) (readADC * 3.3)/4095;
VMOV	S1, R0
VCVT.F32	#0, S1, S1
MOVW	R0, #13107
MOVT	R0, #16467
VMOV	S0, R0
VMUL.F32	S1, S1, S0
MOVW	R0, #61440
MOVT	R0, #17791
VMOV	S0, R0
VDIV.F32	S0, S1, S0
MOVW	R0, #lo_addr(_sign+0)
MOVT	R0, #hi_addr(_sign+0)
VSTR	#1, S0, [R0, #0]
;MyProject_events_code.c,137 :: 		for (i=1;i<=800;i++)
MOVS	R1, #1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_applicationTask187:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
CMP	R0, #800
IT	HI
BHI	L_applicationTask188
;MyProject_events_code.c,139 :: 		readADC = ADC1_Get_Sample(8);
MOVS	R0, #8
BL	_ADC1_Get_Sample+0
MOVW	R1, #lo_addr(_readADC+0)
MOVT	R1, #hi_addr(_readADC+0)
STRH	R0, [R1, #0]
;MyProject_events_code.c,140 :: 		sign[i] = (float) readADC * (3.3/4095);
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRH	R1, [R1, #0]
LSLS	R2, R1, #2
MOVW	R1, #lo_addr(_sign+0)
MOVT	R1, #hi_addr(_sign+0)
ADDS	R2, R1, R2
VMOV	S1, R0
VCVT.F32	#0, S1, S1
MOVW	R0, #16487
MOVT	R0, #14931
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;MyProject_events_code.c,145 :: 		TFT_Set_Pen(CL_RED, 1);
MOVS	R1, #1
MOVW	R0, #63488
BL	_TFT_Set_Pen+0
;MyProject_events_code.c,148 :: 		TFT_Line(((i-1)/2+97), 310-(sign[i-1]*50), (i/2)+97, 310-(sign[i]*50));
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRH	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_sign+0)
MOVT	R0, #hi_addr(_sign+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #16968
VMOV	S0, R0
VMUL.F32	S1, S1, S0
MOVW	R0, #0
MOVT	R0, #17307
VMOV	S0, R0
VSUB.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R4, S0
SXTH	R4, R4
MOV	R0, R2
LDRH	R0, [R0, #0]
LSRS	R0, R0, #1
UXTH	R0, R0
ADDW	R3, R0, #97
MOV	R0, R2
LDRH	R0, [R0, #0]
SUBS	R2, R0, #1
UXTH	R2, R2
LSLS	R1, R2, #2
MOVW	R0, #lo_addr(_sign+0)
MOVT	R0, #hi_addr(_sign+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #16968
VMOV	S0, R0
VMUL.F32	S1, S1, S0
MOVW	R0, #0
MOVT	R0, #17307
VMOV	S0, R0
VSUB.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
LSRS	R0, R2, #1
UXTH	R0, R0
ADDS	R0, #97
SXTH	R2, R3
SXTH	R3, R4
SXTH	R0, R0
BL	_TFT_Line+0
;MyProject_events_code.c,149 :: 		FloatToStr(sign[i], text);
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_sign+0)
MOVT	R0, #hi_addr(_sign+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_text+0)
MOVT	R0, #hi_addr(_text+0)
BL	_FloatToStr+0
;MyProject_events_code.c,150 :: 		mikrobus_logWrite(text, _LOG_LINE);
MOVS	R1, #2
MOVW	R0, #lo_addr(_text+0)
MOVT	R0, #hi_addr(_text+0)
BL	_mikrobus_logWrite+0
;MyProject_events_code.c,151 :: 		Delay_ms(10);
MOVW	R7, #35710
MOVT	R7, #8
NOP
NOP
L_applicationTask190:
SUBS	R7, R7, #1
BNE	L_applicationTask190
NOP
NOP
NOP
;MyProject_events_code.c,137 :: 		for (i=1;i<=800;i++)
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;MyProject_events_code.c,152 :: 		}
IT	AL
BAL	L_applicationTask187
L_applicationTask188:
;MyProject_events_code.c,153 :: 		n = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_n+0)
MOVT	R0, #hi_addr(_n+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,154 :: 		}
IT	AL
BAL	L_applicationTask185
L_applicationTask186:
;MyProject_events_code.c,156 :: 		if (interrFlag == 1)
MOVW	R0, #lo_addr(_interrFlag+0)
MOVT	R0, #hi_addr(_interrFlag+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_applicationTask192
;MyProject_events_code.c,158 :: 		interrFlag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_interrFlag+0)
MOVT	R0, #hi_addr(_interrFlag+0)
STRB	R1, [R0, #0]
;MyProject_events_code.c,159 :: 		DisableInterrupts();
BL	_DisableInterrupts+0
;MyProject_events_code.c,161 :: 		readADC = ADC1_Get_Sample( 8 );
MOVS	R0, #8
BL	_ADC1_Get_Sample+0
MOVW	R1, #lo_addr(_readADC+0)
MOVT	R1, #hi_addr(_readADC+0)
STRH	R0, [R1, #0]
;MyProject_events_code.c,162 :: 		timeRead = interrCnt * time_ms;
MOVW	R1, #lo_addr(_interrCnt+0)
MOVT	R1, #hi_addr(_interrCnt+0)
LDR	R2, [R1, #0]
MOVW	R1, #5
MULS	R2, R1, R2
MOVW	R1, #lo_addr(_timeRead+0)
MOVT	R1, #hi_addr(_timeRead+0)
STR	R2, [R1, #0]
;MyProject_events_code.c,163 :: 		plotRes( readADC, timeRead );
MOV	R1, R2
VMOV	S0, R0
VCVT.F32	#0, S0, S0
MOV	R0, R1
BL	_plotRes+0
;MyProject_events_code.c,164 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;MyProject_events_code.c,165 :: 		}
L_applicationTask192:
;MyProject_events_code.c,166 :: 		}
L_end_applicationTask:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _applicationTask
_Timer2_interrupt:
;MyProject_events_code.c,181 :: 		void Timer2_interrupt() iv IVT_INT_TIM2
;MyProject_events_code.c,183 :: 		TIM2_SR.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
_SX	[R0, ByteOffset(TIM2_SR+0)]
;MyProject_events_code.c,184 :: 		interrFlag = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_interrFlag+0)
MOVT	R0, #hi_addr(_interrFlag+0)
STRB	R1, [R0, #0]
;MyProject_events_code.c,186 :: 		if (interrCnt == 0x33333333)
MOVW	R0, #lo_addr(_interrCnt+0)
MOVT	R0, #hi_addr(_interrCnt+0)
LDR	R0, [R0, #0]
CMP	R0, #858993459
IT	NE
BNE	L_Timer2_interrupt193
;MyProject_events_code.c,188 :: 		interrCnt = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_interrCnt+0)
MOVT	R0, #hi_addr(_interrCnt+0)
STR	R1, [R0, #0]
;MyProject_events_code.c,189 :: 		}
IT	AL
BAL	L_Timer2_interrupt194
L_Timer2_interrupt193:
;MyProject_events_code.c,192 :: 		interrCnt++;
MOVW	R1, #lo_addr(_interrCnt+0)
MOVT	R1, #hi_addr(_interrCnt+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;MyProject_events_code.c,193 :: 		}
L_Timer2_interrupt194:
;MyProject_events_code.c,194 :: 		}
L_end_Timer2_interrupt:
BX	LR
; end of _Timer2_interrupt
_Button1OnClick:
;MyProject_events_code.c,196 :: 		void Button1OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_events_code.c,197 :: 		DrawScreen(&Screen2);
MOVW	R0, #lo_addr(_Screen2+0)
MOVT	R0, #hi_addr(_Screen2+0)
BL	_DrawScreen+0
;MyProject_events_code.c,198 :: 		}
L_end_Button1OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Button1OnClick
_Button2OnClick:
;MyProject_events_code.c,200 :: 		void Button2OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_events_code.c,201 :: 		applicationTask();
BL	_applicationTask+0
;MyProject_events_code.c,206 :: 		}
L_end_Button2OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Button2OnClick
_Button3OnClick:
;MyProject_events_code.c,207 :: 		void Button3OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_events_code.c,208 :: 		bingkai(100,55,477,271);
MOVW	R3, #271
SXTH	R3, R3
MOVW	R2, #477
SXTH	R2, R2
MOVS	R1, #55
SXTH	R1, R1
MOVS	R0, #100
SXTH	R0, R0
BL	_bingkai+0
;MyProject_events_code.c,209 :: 		jumlahdata = 799;
MOVW	R1, #799
MOVW	R0, #lo_addr(_jumlahdata+0)
MOVT	R0, #hi_addr(_jumlahdata+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,210 :: 		for(i=0;i<=jumlahdata;i++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_Button3OnClick195:
MOVW	R0, #lo_addr(_jumlahdata+0)
MOVT	R0, #hi_addr(_jumlahdata+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	HI
BHI	L_Button3OnClick196
;MyProject_events_code.c,211 :: 		yy[i] = 0;
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRH	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_yy+0)
MOVT	R0, #hi_addr(_yy+0)
ADDS	R1, R0, R1
MOV	R0, #0
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
;MyProject_events_code.c,210 :: 		for(i=0;i<=jumlahdata;i++){
MOV	R0, R2
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R2, #0]
;MyProject_events_code.c,212 :: 		}  //non2 r kebalik, non3 cudb 7, non4 asystole
IT	AL
BAL	L_Button3OnClick195
L_Button3OnClick196:
;MyProject_events_code.c,213 :: 		for (i=0;i<=jumlahdata;i++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_Button3OnClick198:
MOVW	R0, #lo_addr(_jumlahdata+0)
MOVT	R0, #hi_addr(_jumlahdata+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	HI
BHI	L_Button3OnClick199
;MyProject_events_code.c,214 :: 		yy[i] = nonshockable4[i];
MOVW	R3, #lo_addr(_i+0)
MOVT	R3, #hi_addr(_i+0)
LDRH	R0, [R3, #0]
LSLS	R2, R0, #2
MOVW	R0, #lo_addr(_yy+0)
MOVT	R0, #hi_addr(_yy+0)
ADDS	R1, R0, R2
MOVW	R0, #lo_addr(_nonshockable4+0)
MOVT	R0, #hi_addr(_nonshockable4+0)
ADDS	R0, R0, R2
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;MyProject_events_code.c,213 :: 		for (i=0;i<=jumlahdata;i++){
MOV	R0, R3
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R3, #0]
;MyProject_events_code.c,215 :: 		}
IT	AL
BAL	L_Button3OnClick198
L_Button3OnClick199:
;MyProject_events_code.c,216 :: 		filter();
BL	_filter+0
;MyProject_events_code.c,218 :: 		}
L_end_Button3OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Button3OnClick
_Button4OnClick:
;MyProject_events_code.c,219 :: 		void Button4OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_events_code.c,222 :: 		DrawScreen(&Screen3);
MOVW	R0, #lo_addr(_Screen3+0)
MOVT	R0, #hi_addr(_Screen3+0)
BL	_DrawScreen+0
;MyProject_events_code.c,223 :: 		}
L_end_Button4OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Button4OnClick
_Button5OnClick:
;MyProject_events_code.c,224 :: 		void Button5OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_events_code.c,225 :: 		DrawScreen(&Screen4);
MOVW	R0, #lo_addr(_Screen4+0)
MOVT	R0, #hi_addr(_Screen4+0)
BL	_DrawScreen+0
;MyProject_events_code.c,226 :: 		ekstraksi();
BL	_ekstraksi+0
;MyProject_events_code.c,227 :: 		inputtohidden1();
BL	_inputtohidden1+0
;MyProject_events_code.c,228 :: 		hidden1tohidden2();
BL	_hidden1tohidden2+0
;MyProject_events_code.c,229 :: 		hidden2tohidden3();
BL	_hidden2tohidden3+0
;MyProject_events_code.c,230 :: 		hidden3toout();
BL	_hidden3toout+0
;MyProject_events_code.c,231 :: 		}
L_end_Button5OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Button5OnClick
_Button6OnClick:
;MyProject_events_code.c,232 :: 		void Button6OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_events_code.c,233 :: 		DrawScreen(&Screen3);
MOVW	R0, #lo_addr(_Screen3+0)
MOVT	R0, #hi_addr(_Screen3+0)
BL	_DrawScreen+0
;MyProject_events_code.c,234 :: 		}
L_end_Button6OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Button6OnClick
_Button7OnClick:
;MyProject_events_code.c,235 :: 		void Button7OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_events_code.c,236 :: 		bingkai(100,55,477,271);
MOVW	R3, #271
SXTH	R3, R3
MOVW	R2, #477
SXTH	R2, R2
MOVS	R1, #55
SXTH	R1, R1
MOVS	R0, #100
SXTH	R0, R0
BL	_bingkai+0
;MyProject_events_code.c,237 :: 		jumlahdata = 799;
MOVW	R1, #799
MOVW	R0, #lo_addr(_jumlahdata+0)
MOVT	R0, #hi_addr(_jumlahdata+0)
STRH	R1, [R0, #0]
;MyProject_events_code.c,238 :: 		for(i=0;i<=jumlahdata;i++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_Button7OnClick201:
MOVW	R0, #lo_addr(_jumlahdata+0)
MOVT	R0, #hi_addr(_jumlahdata+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	HI
BHI	L_Button7OnClick202
;MyProject_events_code.c,239 :: 		yy[i] = 0;
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRH	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_yy+0)
MOVT	R0, #hi_addr(_yy+0)
ADDS	R1, R0, R1
MOV	R0, #0
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
;MyProject_events_code.c,238 :: 		for(i=0;i<=jumlahdata;i++){
MOV	R0, R2
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R2, #0]
;MyProject_events_code.c,240 :: 		}
IT	AL
BAL	L_Button7OnClick201
L_Button7OnClick202:
;MyProject_events_code.c,241 :: 		for (i=0;i<=jumlahdata;i++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_Button7OnClick204:
MOVW	R0, #lo_addr(_jumlahdata+0)
MOVT	R0, #hi_addr(_jumlahdata+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	HI
BHI	L_Button7OnClick205
;MyProject_events_code.c,242 :: 		yy[i] = shockable3[i];
MOVW	R3, #lo_addr(_i+0)
MOVT	R3, #hi_addr(_i+0)
LDRH	R0, [R3, #0]
LSLS	R2, R0, #2
MOVW	R0, #lo_addr(_yy+0)
MOVT	R0, #hi_addr(_yy+0)
ADDS	R1, R0, R2
MOVW	R0, #lo_addr(_shockable3+0)
MOVT	R0, #hi_addr(_shockable3+0)
ADDS	R0, R0, R2
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [R1, #0]
;MyProject_events_code.c,241 :: 		for (i=0;i<=jumlahdata;i++){
MOV	R0, R3
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R3, #0]
;MyProject_events_code.c,243 :: 		}
IT	AL
BAL	L_Button7OnClick204
L_Button7OnClick205:
;MyProject_events_code.c,244 :: 		filter();
BL	_filter+0
;MyProject_events_code.c,246 :: 		}
L_end_Button7OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Button7OnClick
_ButtonRound2OnClick:
;MyProject_events_code.c,247 :: 		void ButtonRound2OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_events_code.c,248 :: 		DrawScreen(&Screen1);
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
BL	_DrawScreen+0
;MyProject_events_code.c,249 :: 		}
L_end_ButtonRound2OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ButtonRound2OnClick
_ButtonRound1OnClick:
;MyProject_events_code.c,250 :: 		void ButtonRound1OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_events_code.c,251 :: 		DrawScreen(&Screen1);
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
BL	_DrawScreen+0
;MyProject_events_code.c,252 :: 		}
L_end_ButtonRound1OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ButtonRound1OnClick

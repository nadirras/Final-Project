extern uint16_t readADC;
extern uint32_t interrCnt;
float T = 0.005;
float w = 11;
float wHPF = 5;
//float aa0,aa1,aa2,aa3,aa4,aa5,bb0,bb1,bb2,bb3,bb4,bb5;
int window;

void filter(){
     jumlahdata = 799;
     readADC = ADC1_Get_Sample(4);

//    for(i=0;i<=jumlahdata;i++){
//      of[i] = (yyy[i]/jumlahdata);
//      offset += of[i];
//      yy[i] = yyy[i]-offset;}

     //LPF orde 2
     for(i=0;i<=jumlahdata;i++)
     {
      y1[i] = 0;
     }
    for (i=12;i<=jumlahdata;i++){
       y1[i] = (2*y1[i-1])-y1[i-2]+yy[i]-(2*yy[i-6])+yy[i-12];
     }



     //HPF  orde 1

      for(i=0;i<=jumlahdata;i++)
     {
      y2[i] = 0;
     }
      for (i=32;i<=jumlahdata;i++){
          y2[i] = 32*y1[i-16] - (y2[i-1]+y1[i]-y1[i-32]);         }

     //Derivative
     for(i=0;i<=jumlahdata-1;i++)
     {
      y3[i] = 0;
     }

     for (n=2;n<=jumlahdata;n++){
         y31[n] = (-y2[n-2]-2*y2[n-1])/8;}

    for (n=0;n<=jumlahdata-2;n++){
        y32[n] = (2*y2[n+1]+y2[n+2])/8;}

    for (n=2;n<=jumlahdata-2;n++){
        y3[n] = y31[n]+y32[n];}


     //Squaring
     for (i=0;i<=jumlahdata;i++){
         y4[i] = 0;
         }
     for (i=0;i<=jumlahdata;i++){
         y4[i] = y3[i]*y3[i];
     }



     //Moving Window Integration
    for (i=0;i<=jumlahdata;i++){
        y51[i] = 0;
        y52[i] = 0;
        }
    window = 14;
    for (i=window;i<=jumlahdata;i++){
        for (n=0;n<=window;n++){
            y51[i] = y51[i]+(y4[i-n]);}
        y52[i] = y51[i]/window;}


     //Fiducial Marks
     for (i=0;i<=jumlahdata;i++){
         peaki[i] = 0;}
     for (i=5;i<=jumlahdata+5;i++){
            if (y52[i] > y52[i-5]){
            if (y52[i] > y52[i-4]){
           if (y52[i] > y52[i-3]){
              if (y52[i] > y52[i-2]){
                 if (y52[i] > y52[i-1]){
                     if (y52[i] > y52[i+1]){
                       if (y52[i] > y52[i+2]){
                          if (y52[i] > y52[i+3]){
                             if (y52[i] > y52[i+4]){
                                if (y52[i] > y52[i+5]){
                                  peaki[i] = 1;}}}}}}}} }}
 }

//Thresholding
   for (i=0;i<=400;i++){
       if (y52[i] > pp){
         pp = y52[i];}
       spki[0] = pp;
       meann += y52[i]; }
       mean_npki = meann/400;
       npki[0] = mean_npki;
       th1[0] = (npki[0] + 0.25 * (spki[0] - npki[0]));
       th2[0] = 0.5*th1[0];
       previous_peaki = -10000;
       peaki_interval = 0;
       tpeak =0;
       Tbaru = 0.005;
       for (i=1;i<=jumlahdata;i++){
          spki[i] = spki[i-1];
          npki[i] = npki[i-1];
          th1[i] = th1[i-1];
          th2[i] = th2[i-1];
          if (peaki[i] == 1){
            if (y52[i] > th1[i]){
              peaki_interval = i - previous_peaki;
              previous_peaki = i;
              tpeak = peaki_interval * Tbaru;
              if (tpeak > 0.2){
                spki[i] = 0.875 * spki[i-1] + 0.125 * y52[i];
                qrsi[i] = 1;}
              else if (y52[i] >th2[i]){
               if (tpeak > 0.2){
               spki[i] = 0.75 * spki[i-1] + 0.25 * y52[i];
               qrsi[i] = 1;}

               }else{
                npki[i] = 0.875 * npki[i-1] + 0.125 * y52[i];
                qrsi[i] = 0;    }
               th1[i] = (npki[i] + 0.25 * (spki[i] - npki[i]));
               th2[i] = 0.5*th1[i];}
        //Deteksi fibrillation waves
        if (qrsi[i] == 0){
           if (peaki[i] = 1){
              if(tpeak >0.15){
              if (y52[i] > th1[i]){
                 qrsi[i] = 1;} }
                 }
        }



}}
max_slope = -10000;
previous_max_slope = -10000;
//T-wave identification
/*for (i=17;i<=jumlahdata-23;i++){
     if (qrsi[i]==1){
        i_shift = i+3;
//        max_slope = -10000;
        for (j=i_shift-20;j<=i_shift+20;i++){
            if (j>=0 && j<jumlahdata){
                if (y4[j] > max_slope){
                   max_slope = y4[j];}
                }
        }
        if (max_slope < previous_max_slope*0.5){
           qrsi[i] = 0;
        } else {
          previous_max_slope = max_slope;}


        } }       */


// kk = 35 ;
// for (i=0;i<=jumlahdata-kk;i++){
//      temp4 = temp4+qrsi[i+kk];
//      qrsnd[i] = temp4;}
  ppos = 27;
while(ppos)
    {
        if(1)
        {
            temp4 = qrsi[0];
            for(i = 0; i < jumlahdata - 1; i++)
                qrsi[i] = qrsi[i + 1];

            qrsi[jumlahdata - 1] = temp4;
        }
        else
        {
            temp4 = qrsi[jumlahdata - 1];
            for(i = jumlahdata - 1; i > 0; i--)
                qrsi[i] = qrsi[i - 1];

            qrsi[0] = temp4;
        }

        ppos--;
    }


         for (i=2;i<=jumlahdata;i++)
     {
//         TFT_Line(105+((i-1)/2),68-(ecg2[i-1]*15),105+(i/2),68-(ecg2[i]*15));
         TFT_Set_Pen(CL_RED, 1);
//          TFT_Line(105+((i-1)/2),90-(y1[i-1]/100*15),105+(i/2),90-(y1[i]/100*15));
       TFT_Line(105+((i-1)/2),185-2*(yy[i-1]*15),105+(i/2),185-2*(yy[i]*15));
        TFT_Set_Pen(CL_GREEN, 1);

//        TFT_Line(105+((i-1)/2),185-0.0005*(y52[i-1]*15),105+(i/2),185-0.0005*(y52[i]*15));


        TFT_Line(105+((i-1)/2),160-(qrsi[i-1]*25),105+(i/2),160-(qrsi[i]*25));

       Delay_ms(5);
     }


}

void ekstraksi(){
     jumlahdata =799;
     for (i=2;i<=jumlahdata;i++){
         bpf[i] = (28*bpf[i-1]-14*bpf[i-2]+yy[i]-yy[i-2])/16;
         r_bpf[i] = qrsi[i];
         }

         ppos = 2;
while(ppos)
    {
        if(0)
        {
            temp4 = qrsi[0];
            for(i = 0; i < jumlahdata - 1; i++)
                r_bpf[i] = r_bpf[i + 1];

            r_bpf[jumlahdata - 1] = temp4;
        }
        else
        {
            temp4 = qrsi[jumlahdata - 1];
            for(i = jumlahdata - 1; i > 0; i--)
                r_bpf[i] = r_bpf[i - 1];

            r_bpf[0] = temp4;
        }

        ppos--;
    }

     // Find Segment
     beat = 0;
     startt = 0;
     end = 0;
     for (i=0;i<=jumlahdata;i++){
        if (r_bpf[i] == 1){
          beat++;
          if (beat == 2){
            startt = i; }
          if (beat == 3){
            end = i;
     }}
     length = end - startt;}

     // Segment Length

    //sebenernya yang belom nambahin protokol nilai bakal 0 kalau si jarak beat kejauhan but susah
    // Check if length more than threshold
//    threshold = 500;
//    if (length > threshold){
//       beat = 0;}

     sumbpf = 0;

     for (i=startt;i<=end;i++){
        //count1
        if (bpf[i] > maxbpf){
          maxbpf = bpf[i];}
          thress = 0.5*maxbpf;
        //count2
//        absbpf = 0;

        if (bpf[i] > 0){
          absbpf = bpf[i];}
        else
          {absbpf = -bpf[i];}

        sumbpf = sumbpf + absbpf;}

      thres = sumbpf/length;
      hasilcount1 = 0;
      hasilcount2 = 0;
      for (i=startt;i<=end;i++){
        if (bpf[i] >= thress){  //range 0.5*max - max, bpf pasti nyentuh maxnya soalnya diatasnya
          hasilcount1+=1;}}

      for (i=startt;i<=end;i++){
        if (bpf[i] >= thres){       //range mean - max
          hasilcount2+=1;}}
      input[0] = hasilcount1;
      input[1] = hasilcount2;


        //Vf-Leak (Lk)
        num = 0;
        den2 = 0;
        NN = 0;
        num2 = 0;
          for (i=startt;i<=end;i++){
            for (ll=startt+i+1;ll<=end;ll++){
              if (yy[i] > 0){
                absnum = yy[i];}
              else
                {absnum = -(yy[i]);}
              num += absnum;
//              den1[ll-i] = yy[i] - yy[ll-1];
              if (den1[ll-i] > 0){
                absden = (yy[i] - yy[ll-1]);}
              else
                {absden = -(yy[i] - yy[ll-1]);}  }
              den2 += absden;  }
          NN = floor(((3.1415*(num))/(den2))+0.5);

          num22 = 0;
          den22=0;
          for (i=startt;i<=end;i++){
            for (j=startt+NN;j<=end;j++){
//              den22 = 0;
                if (yy[i] > 0){
                absnum22 = yy[i];}
              else
                {absnum22 = -(yy[i]);}
              num2 += absnum22;
              if ((yy[i] + yy[j-NN]) > 0){
                absnum2 = (yy[i] + yy[j-NN]);}
              else
                {absnum2 = -(yy[i] + yy[j-NN]);}
              num22 += absnum2;
              if (yy[j-NN] > 0){
                absden2 = yy[j-NN];}
              else
                {absden2 = -(yy[j-NN]);}
                temptemp = absnum22+absden2;
              den22 += (temptemp);  }
              hasilvfleak = num22/den22; }
              input[2] = hasilvfleak;

       Delay_ms(100);
        IntToStr(hasilcount2, Label3_Caption);
        TFT_Write_Text(Label3_Caption,78,96);
        IntToStr(hasilcount1, Label4_Caption);
        TFT_Write_Text(Label4_Caption,83,52);
        FloatToStr(hasilvfleak, Label5_Caption);
        TFT_Write_Text(Label5_Caption,321,96);


}

 /*
int segmentlength(int searchstart,int searchend){
  beat = 0;
  startt, end = 0, 0;
  jj = 0;

  // Find Segment
  for (i=searchstart;i<=searchend;i++){
    if (r_bpf[i] == 1){
      beat++;
      if (beat == 1){
        startt = i; }
      if (beat == 2){
        end = i;}           }  }

  // Segment Length
  length = end - startt;

  // Check if length more than threshold
  threshold = 500;
  if (length > threshold){
     return(0, end);}
  else
    {return(startt, end);}

//  kk = 1;
//  while(kk!=0){
//  if (length > threshold){
//     temp = tempt[0, end];}
//  else{
//    temp = tempt[startt, end];}
//    kk = 0;
//    jj+=1;
//    }
//    return temp;
}

void hasil_ekstraksi(){

  s_searchstart = 0;
  jumlahdata = 799;
  vari = 1;
//  j = 0;
  num = 0;
  den2 = 0;
  num22=0;
  den22=0;
  segmen_n = 0;
  kk = 0;
  while (vari!=0){

    *(segmentpoints) = Segmentlength(s_searchstart, jumlahdata);
    startt = segmentpoints[0];
    end = segmentpoints[1];

    if (startt != 0){       //kalau segmen = 0 belom ganemu apa apa, jadi bakal jalan terus
      if (end = 0){
        vari = 0;}
      else
        { for (column=1;column<=2;column++){
            segment[segmen_n][column] = segmentpoints[column];
         length = end - startt;
        segmen_n+=1;}
        //cek


        sumbpf = 0;
        maxbpf = 0;

//        Delay_ms(100);
//        FloatToStr(segmen_n, Label3_Caption);

        for (i=startt;i<=end;i++){
          //count1
          if (bpf[i] > maxbpf){
            maxbpf = bpf[i];}
          //count2
          absbpf = 0;
          if (bpf[i] > 0){
            absbpf = bpf[i];}
          else
            {absbpf = -bpf[i];}
          sumbpf = sumbpf + absbpf;
        thres = sumbpf/length;}


          //Vf-Leak (Lk)
          for (i=startt+1;i<=end;i++){
            for (ll=startt+i;ll<=end;ll++){
              if (ecg2[i] > 0){
                absnum = ecg2[i];}
              else
                {absnum = -ecg2[i];}
              num += absnum;
              den1[ll-i] = ecg2[i] - ecg2[ll-1];
              if (den1[ll-i] > 0){
                absden = den1[ll-i];}
              else
                {absden = -den1[ll-i];}
              den2 += absden;  }}
          NN = ((3.14*(num)/(den2))+1/2);

          for (i=startt;i<=end;i++){
            for (j=startt+NN;j<=end;j++){
              if ((ecg2[i] + ecg2[j-NN]) > 0){
                absnum2 = (ecg2[i] + ecg2[j-NN]);}
              else
                {absnum2 = -(ecg2[i] + ecg2[j-NN]);}
              num22 += absnum2;
              if (ecg2[j-NN] > 0){
                absden2 = ecg2[j-NN];}
              else
                {absden2 = -ecg2[j-NN];}
              den22 += (absnum+absden2);}}
              vf = num22/den22;
              hasil_lk[kk] += (vf);
//          count1_segment = 0;
//          count2_segment = 0;
          for (i=startt;i<=end;i++){
            if (bpf[i] >= 0.5*maxbpf){  //range 0.5*max - max, bpf pasti nyentuh maxnya soalnya diatasnya
              count1[kk] += 1;}
            if (bpf[i] >= thres){       //range mean - max
              count2[kk] += 1;}}}  //setiap ada yang diatas threshold dihitung ada berapa data poin

          }else{
            count1[kk] = 0;
            count2[kk] = 0;
            hasil_lk[kk] = 0;}


            Delay_ms(100);
        FloatToStr(count1[1], Label3_Caption);
        TFT_Write_Text(Label3_Caption,78,96);
        FloatToStr(count2[1], Label4_Caption);
        TFT_Write_Text(Label4_Caption,321,96);

           kk++;

//            Delay_ms(100);
//           FloatToStr(count1[2], Label3_Caption);
//           TFT_Write_Text(Label3_Caption,78,96);
//           FloatToStr(count2[2], Label4_Caption);
//           TFT_Write_Text(Label4_Caption,78,96);
//           count2_segment+= count2[kk]/kk;
//           count1_segment += count1[kk]/kk;


      s_searchstart = end;


//     FloatToStr(hasil_lk[2], Label5_Caption);
//     TFT_Write_Text(Label5_Caption,321,96);
    }




}                                               */
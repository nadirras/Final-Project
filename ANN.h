//y = wx + b

void inputtohidden1(){
//  input[0] = hasilcount1;
//  input[1] = hasilcount2;
//  input[2] = hasilvfleak;
  for (i = 0; i<=59; i++){  //loop banyak neuron di hidden layer 1 (40)
      temp1=0;
      temp2=0;
    for (j = 0; j<=2; j++){   //loop input layer
      temp1 = temp1 + input[j]*weight1[j][i];

    }
    temp1 = temp1 + bias1[i];
    temp2 = relu(temp1);
    hidden1[i] = temp2;
   }


}

void hidden1tohidden2(){
  for (i = 0; i<=39; i++){
      temp1 = 0;
      temp2 = 0;
    for (j = 0; j<=59; j++){
      temp1 = temp1 + hidden1[j]*weight2[j][i];
    }
    temp1 = temp1+ bias2[i];
    temp2 = relu(temp1);
    hidden2[i] = temp2;
   }


}

void hidden2tohidden3(){
  for (i = 0; i<=19; i++){
      temp1 = 0;
      temp2 = 0;
    for (j = 0; j<=39; j++){
      temp1 = temp1 + hidden2[j]*weight3[j][i];
    }
    temp1 = temp1 + bias3[i];
    temp2 = relu(temp1);
    hidden3[i] = temp2;
    }



}

void hidden3toout(){
for (i = 0; i<1; i++){
      temp1 = 0;
      temp2 = 0;
    for (j = 0; j<=19; j++){
      temp1 = temp1 + hidden3[j]*output_weight[j][i];
    }
    temp1 = temp1+ output_bias[i];
    temp2 = sigmoid(temp1);
    hidden4[i] = temp2;}
    if (temp2 >= 0.1){
     detection = 1;
  }
   else {detection = 0;}
   Delay_ms(100);
   FloatToStr(hidden4[0], Label6_Caption);
   TFT_Write_Text(Label6_Caption,182,203);
   IntToStr(detection, Label7_Caption);
   TFT_Write_Text(Label7_Caption,375,203);
    
    }
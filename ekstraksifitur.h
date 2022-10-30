void count1(){
     for (i=0;i<=jumlahdata;i++){
         if (qrsnd[i] =1){
            beat += 1;
            if (beat = 1){
               segmentstart = i;}
            if (beat = 2){
               segmentend = i;}}
         segmentlength = segmentend - segmentstart;
     for (i=segmentstart+2;i<=segmentend;i++){
        icount2 = i - segmentstart;
        bpf[icount2] = (28*bpf[icount2-1]-14*bpf[icount2-2]+signal[i]-signal[i-2])/16; }
        
        
        

}
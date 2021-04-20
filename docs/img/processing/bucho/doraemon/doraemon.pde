float angle1a ; //  媒介変数
float angle1b ;
float angle1c ;
float angle2 ;
float angle3 ;
float angle4 ;
float angle5 ;
float angle6 ;
float kazu7 ;
float kazu8 ;
float kazu9 ;
float kazu10 ;
float angle11 ;
float angle12 ;
float angle13 ;
float angle14 ;
float angle15 ;
float angle16 ;//未使用

float angletime ;
float angleheart ;
float angleheart2 ;
float angleheart3 ;//未使用
float angle17 ;

float angle18 ;
float angle19 ;
float angle20 ;


float a ; //  円の半径
float b = 80*2;// 角速度の基準値
float dotX = 7;//点のサイズ
float dotY = 7;
//color backcolor = color(255,254,155);
color backcolor = color(255);


void setup(){
  size(690,617);
  background(backcolor);
  smooth();
}



void draw(){ 
  
  color linecolor = color(30,random(60),30,100);
  color heartcolor = color(random(250),0,0);
  color nosecolor = color(170,0,0);
//lineたち
  noStroke();
  fill(linecolor);

  //line1~2
  float line1aX =0;
  float line1aY =0;  
  float line1bX =0;
  float line1bY =0;
  float line1cX =0;
  float line1cY =0; 
  float line2X =0;
  float line2Y =0; 
  
  if(angle1a <=76){
    a=307;
    angle1a += b/2/a;
    line1aX = a * cos(radians(270 + angle1a)) + 0;
    line1aY = a * sin(radians(270 + angle1a)) + 426;
    ellipse(line1aX,line1aY,dotX,dotY);
  }else if(angle1b<=180){
    a=28;
    angle1b += b/2/a;
    line1bX = a * cos(radians(220 + angle1b)) + 316;
    line1bY = a * sin(radians(220 + angle1b)) + 382;
    ellipse(line1bX,line1bY,dotX,dotY);
  }else if(angle1c<=95){
    a=169;
    angle1c += b/2/a;
    line1cX = a * cos(radians(40 + angle1c)) + 209;
    line1cY = a * sin(radians(40 + angle1c)) + 289;
    ellipse(line1cX,line1cY,dotX,dotY);
  }else if(angle2<=37){
    a=190;
    angle2 += b/2/a;
    line2X = a * cos(radians(0 + angle2)) + 113;
    line2Y = a * sin(radians(0 + angle2)) + 428;
    ellipse(line2X,line2Y,dotX,dotY);
  }
  
//line3~9
  float line3X =0;
  float line3Y =0;
  float line4X =0;
  float line4Y =0;
  float line5X =0;
  float line5Y =0;
  float line6X =0;
  float line6Y =0;
  float line7X =0;
  float line7Y =0;
  float line8X =0;
  float line8Y =0;
  float line9X =0;
  float line9Y =0;  
  
  if(angle3 <=82){
    a=231;
    angle3 += b/2/a;
    line3X = a * cos(radians(165 + angle3)) + 266;
    line3Y = a * sin(radians(165 + angle3)) + 485;
    ellipse(line3X,line3Y,dotX,dotY);
  //白目
  }else if(angle4 <=360){
    a=33;
    angle4 += b/2/a;
    line4X = a * cos(radians(240 - angle4))
              * cos(radians(330))
             - a *(52/a)* sin(radians(240 - angle4))
              * sin(radians(330))
             + 216;
    line4Y = a * cos(radians(240 - angle4)) 
              * sin(radians(330))
             + a *(52/a)* sin(radians(240 - angle4))
              * cos(radians(330))
             + 262;
    ellipse(line4X,line4Y,dotX,dotY);
  }else if(angle5<=360){
    a=21;
    angle5 += b/2/a;
    line5X = a * cos(radians(90 + angle5)) + 284;
    line5Y = a * sin(radians(90 + angle5)) + 265;
    ellipse(line5X,line5Y,dotX,dotY);
  //黒目外
  }else if(angle6 <=360){
    a=13;
    int c = 16/13;
    angle6 += b/2/a;
    line6X = a * cos(radians(240 - angle6))
              * cos(radians(330))
             - a *(c)* sin(radians(240 - angle6))
              * sin(radians(330))
             + 218;
    line6Y = a * cos(radians(240 - angle6)) 
              * sin(radians(330))
             + a *(c)* sin(radians(240 - angle6))
              * cos(radians(330))
             + 237;
    ellipse(line6X,line6Y,dotX,dotY);
  //黒目中
  }else if(angle6 <=720){
    a=8;
    int c = 16/13;
    angle6 += b/2/a;
    line6X = a * cos(radians(240 - angle6))
              * cos(radians(330))
             - a *(c)* sin(radians(240 - angle6))
              * sin(radians(330))
             + 218;
    line6Y = a * cos(radians(240 - angle6)) 
              * sin(radians(330))
             + a *(c)* sin(radians(240 - angle6))
              * cos(radians(330))
             + 237;
    ellipse(line6X,line6Y,dotX,dotY);
 
  }else if(kazu7 <= 82){
    println("1");
    kazu7 += 1;
    line7X = -kazu7
             + 165;
    line7Y = -kazu7*16/96 + 322;
    //line7Y-=30;
    ellipse(line7X,line7Y,dotX,dotY);
  }else if(kazu8 <= 85){
    println("2");
    kazu8 += 1;
    line8X = -kazu8
             + 162;
    line8Y = (-kazu8)*5/87
             + 347;
    ellipse(line8X,line8Y,dotX,dotY);
  }else if(kazu9 <= 83){
    kazu9 += 1;
    line9X = -kazu9
             + 162;
    line9Y = (-kazu9)*1/86 
             + 373;
    ellipse(line9X,line9Y,dotX,dotY);
  }else{
    noStroke();
  }

//line10~16
  float line10X =0;
  float line10Y =0;
  float line11X =0;
  float line11Y =0;
  float line12X =0;
  float line12Y =0;
  float line13X =0;
  float line13Y =0;
  float line14X =0;
  float line14Y =0;
  float line15X =0;
  float line15Y =0;
  float line16X =0;//未使用
  float line16Y =0;//未使用

 if(kazu10 <= 263){
   kazu10 += 1;
   line10X = kazu10
            + 0;
   line10Y = 542;
   ellipse(line10X,line10Y,dotX,dotY);
 }else if(kazu10 <=500){
   kazu10 += 1;
   line10X = -(kazu10-263) +242;
   line10Y = 542 + 45;
   ellipse(line10X,line10Y,dotX,dotY);
 }else if(angle11 <=360){
    a=36;
    angle11 += b/2/a;
    line11X = a * cos(radians(260 + angle11)) + 279;
    line11Y = a * sin(radians(260 + angle11)) + 580;
    ellipse(line11X,line11Y,dotX,dotY);
  }else if(angle12 <=50){
    a=80;
    angle12 += b/2/a;
    line12X = a * cos(radians(200 + angle12)) + 327;
    line12Y = a * sin(radians(200 + angle12)) + 634;
    ellipse(line12X,line12Y,dotX,dotY);
  }else if(angle13 <=360){
    a=8;
    angle13 += b/2/a;
    line13X = a * cos(radians(45 + angle13)) + 288;
    line13Y = a * sin(radians(45 + angle13)) + 588;
    ellipse(line13X,line13Y,dotX,dotY);
  }else if(angle14 <=60){
    a=135;
    angle14 += b/2/a;
    line14X = a * cos(radians(335 + angle14)) + 239;
    line14Y = a * sin(radians(335 + angle14)) + 554;
    ellipse(line14X,line14Y,dotX,dotY);
  }else if(angle15 <=360){
    a=40;
    angle15 += b/2/a;
    line15X = a * cos(radians(0 + angle15)) + 337;
    line15Y = a * sin(radians(0 + angle15)) + 465;
    ellipse(line15X,line15Y,dotX,dotY);
  }     

//ハートの軌道２つ、鼻赤、軌道３つめ、青
frameRate(200);
noStroke();
float heartX ;
float heartY ;
float line17X ;
float line17Y ;


  if(angletime <=3100){
    a=60;
    angletime += b/2/a; 
    
  //線１つめ
  }else if(angleheart <= 76){
    a=150;
    angleheart += 200/2/a;
    heartX = a *cos(radians(340 - angleheart))+573;
    heartY = a *sin(radians(340 - angleheart))+464;    
    rectMode(CENTER);
    fill(backcolor);
    rect(heartX,heartY,120,170);
      fill(heartcolor);
      arc(heartX-10,heartY,20,20,radians(150),radians(360));
      arc(heartX+10,heartY,20,20,radians(180),radians(390));
      rect(heartX,heartY+1,35,7);
      triangle(heartX-19,heartY+4,heartX+19,heartY+4,
                heartX,heartY+24); 
    //線２つめ
   }else if(angleheart2 <= 103 ){
    a=150;
    angleheart2 += 200/2/a;
    heartX = a *cos(radians(340 - angleheart2))+415;
    heartY = a *sin(radians(340 - angleheart2))+366;    
    rectMode(CENTER);
    fill(backcolor);
    rect(heartX,heartY,45,60);
      fill(heartcolor);
      arc(heartX-10,heartY,20,20,radians(150),radians(360));
      arc(heartX+10,heartY,20,20,radians(180),radians(390));
      rect(heartX,heartY+1,35,7);
      triangle(heartX-19,heartY+4,heartX+19,heartY+4,
                heartX,heartY+24);  
   //鼻赤
   }else if(angle17 <=360){
    a=8;
    angle17 += 80/2/a;
    line17X = a * cos(radians(330+ angle17)) + 284;
    line17Y = a * sin(radians(330 + angle17)) + 265;
    fill(nosecolor);
    ellipse(line17X,line17Y,17,17);
    
  }else if(angletime <=3600){
    a=60;
    angletime += b/2/a; 
      println(angletime);   
    //線３つめ
  }else if(angleheart3 <= 110 ){
    a=305;
    angleheart3 += 160/2/a;
    heartX = a *cos(radians(190 + angleheart3))+630;
    heartY = a *sin(radians(190 + angleheart3))+300;    
    rectMode(CENTER);
    fill(backcolor);
    rect(heartX,heartY,45,60);
      fill(linecolor);
      arc(heartX-10,heartY,20,20,radians(150),radians(360));
      arc(heartX+10,heartY,20,20,radians(180),radians(390));
      rect(heartX,heartY+1,35,7);
      triangle(heartX-19,heartY+4,heartX+19,heartY+4,
                heartX,heartY+24); 
    }


//目の中白塗り、にこ目 
  float line18X ;
  float line18Y ;
  float line19X ;
  float line19Y ;
  float line20X ;
  float line20Y ;



  if(angletime <=4300){
    a=60;
    angletime += b/2/a; 
      //println(angletime);   
  //白目塗りつぶし  
  }else if(angle18 <=360){
    a=14;
    float d= 52/33;
    angle18 += b/2/a;
    line18X = a * cos(radians(240 - angle18))
              * cos(radians(330))
             - a *(d)* sin(radians(240 - angle18))
              * sin(radians(330))
             + 210;
    line18Y = a * cos(radians(240 - angle18)) 
              * sin(radians(330))
             + a *(d)* sin(radians(240 - angle18))
              * cos(radians(330))
             + 248;
    fill(255);
    ellipse(line18X,line18Y,dotX+21,dotY+21);
    
  //黒目にこ
  }else if(angle20 <=170){
    a=15;
    int c = 16/13;
    angle20 += 50/2/a;
    line20X = a * cos(radians(360 - angle20))
              * cos(radians(330))
             - a *(c)* sin(radians(360 - angle20))
              * sin(radians(340))
             + 221;
    line20Y = a * cos(radians(360 - angle20)) 
              * sin(radians(330))
             + a *(c)* sin(radians(360 - angle20))
              * cos(radians(330))
             + 262;
    fill(linecolor);
    ellipse(line20X,line20Y,dotX,dotY);
  }
  
//println(heartX);
//println(heartY);

}

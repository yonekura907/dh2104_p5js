//半径の変化 r=r0+rspeed;
float r;//大きさ　
float r0;//はじめの大きさ
float rspeed;//大きくなる速度

//角度の変化 a=a0+aspeed;
float a;//角度 
float a0;//はじめの角度   a0 = -60*maisu[n]
float astop;//終えるまで角度　astop = 360 + a0
float aspeed;//加速度
int maisu [] = new int [18];//花びらの枚数。１〜１５までの数字

//座標　t:topは花びら先端,l:leftは先端左の変曲点,r:rightは先端右の変曲点、bはベジェ曲線のハンドル点
float tx,ty,lx,ly,rx,ry,  tlbx,tlby,trbx,trby,  llbx,llby,lrbx,lrby,  rlbx,rlby,rrbx,rrby;

//先端の半径に対する◯◯の半径の割合
float rateb;//左右の変曲点
float ratec;//先端のベジェ曲線のハンドル点
float rated;//左右の変曲点のベジェ曲線のハンドル点

//先端の角度に対する◯◯のずれ角度
float ah;//左右の変曲点
float atb;//先端のベジェ曲線のハンドル点
float ahb;//左右の変曲点のベジェ曲線のハンドル点

//速度調整
float mita;

float reddens=0;

void setup(){
  size(700,700);
  background(255,255,255); 
  r=0;
  r0=0;
  rspeed=0;
  
  a=0;
  a0=0;
  aspeed=0;
}

void draw(){  
   
  background(0);  
  float red = map (noise(reddens),0,1,200,255);
   
  for(int n = maisu.length-1; n>=15; n--){                               
      rspeed = 1 * frameCount;        
      a0 = -120 * n;
      reddens = 0.1 *frameCount;
      drawMaisu(red);
   }   
  for(int n = 14; n>=12; n--){  
      rspeed = 0.9 * frameCount;
      a0 = -120 * n -60; 
      reddens = 0.2 *frameCount;
      drawMaisu(red); 
   }
  for(int n = 11; n>=9; n--){   
      rspeed = 0.7 * frameCount;
      a0 = -120 * n -60-15;      
      reddens = 0.4 *frameCount;
      drawMaisu(red); 
   }
   for(int n = 8; n>=6; n--){   
      rspeed = 0.6 * frameCount;
      a0 = -120 * n -60-15-45;      
      reddens = 0.7 *frameCount;
      drawMaisu(red); 
   }
   for(int n = 5; n>=3; n--){  
      rspeed = 0.4 * frameCount;
      a0 = -120 * n -60-15-60;   
      drawMaisu(red); 
   }
   for(int n = 2; n>=0; n--){ 
      rspeed = 0.2 * frameCount;;
      a0 = -120 * n -60-15-60-45;     
      drawMaisu(red); 
   }
}


void drawMaisu(float red){
            
      fill(200,200,red,15);
      
      r0 = 5;
      r = r0 + 3*rspeed;
     
      astop = 180 + a0;
      aspeed +=0.02;
      a = a0 + aspeed;
      a = a0+(90*sin(radians(mita-90))+90);
      mita+=0.05;
      
      println(a);
  
  
      rateb = 0.8; 
      ratec = 0.9;
      rated = 0.85;
      
      ah = 20;
      atb = 2;
      ahb = 10;
      
      tx = r*cos(radians(a));
      ty = r*sin(radians(a));
      
      lx = r*cos(radians(a - ah))* rateb;
      ly = r*sin(radians(a - ah))* rateb;
      
      rx = r*cos(radians(a + ah))* rateb;
      ry = r*sin(radians(a + ah))* rateb;
      
      tlbx = r*cos(radians(a - atb))* ratec;
      tlby = r*sin(radians(a - atb))* ratec;
      
      trbx = r*cos(radians(a + atb))* ratec;
      trby = r*sin(radians(a + atb))* ratec;
      
      llbx = r*cos(radians(a - ah - 30))* rated;
      llby = r*sin(radians(a - ah - 30))* rated;
      
      lrbx = r*cos(radians(a - ah + ahb))* rated;
      lrby = r*sin(radians(a - ah + ahb))* rated;
      
      rlbx = r*cos(radians(a + ah - ahb))* rated;
      rlby = r*sin(radians(a + ah - ahb))* rated;
      
      rrbx = r*cos(radians(a + ah + 30))* ratec;
      rrby = r*sin(radians(a + ah + 30))* rated;
      
        
          //if (mita < 180){  
          if (a < astop){            
            blendMode(ADD);
            noFill(); 
            for (int i = 1; i < 4; ++i) {
               strokeWeight(i);
               stroke(
                    map(i, 1, 50, 180, 360),
                    80,
                    map(i, 1, 50, 15, 1),
                    100
                    ); 
            
                pushMatrix(); 
                translate(width/2, height/2);                  
                      beginShape();
                        vertex(0, 0);
                        bezierVertex(0, 0, llbx,llby,lx,ly);
                        bezierVertex(lrbx,lrby,tlbx,tlby,tx,ty);
                        bezierVertex(trbx,trby,rlbx,rlby,rx,ry);
                        bezierVertex(rrbx,rrby,0,0,0,0);              
                      endShape(CLOSE);        
                popMatrix();                
            }                   
         //}else if(mita >= 180){
         //rspeed-=10;
         }     
}

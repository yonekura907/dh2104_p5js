import processing.sound.*;

Hana2 dendro1,dendro2,dendro3;
Line line1;
Hana3 lave1,lave2,lave3,lave4,lave5,lave6,lave7,lave8;
Walker w, w2, w3;

PShader sd;

//音データ用の変数
SoundFile sd1,sd2,sd3;

//シーン用の変数
int scene;

//座標
float posX,posY;

void setup(){
  surface. setResizable(true);
  
  size(1280,1080);
  background(0);
  
  sd1 = new SoundFile(this,"ufo.mp3");
  sd2 = new SoundFile(this,"clay.mp3");
  sd3 = new SoundFile(this,"prism-1.mp3");
  
    dendro1 = new Hana2(-210,0,1.3);
    dendro2 = new Hana2(180,170,1.05);
    dendro3 = new Hana2(100,-180,1.15);
    line1 = new Line(-width/2,-350);
    
    lave1 = new Hana3(-150,400,1500,0);
    lave2 = new Hana3(-200,-300,1000,50);
    lave3 = new Hana3(200,100,1100,100);
    lave4 = new Hana3(-100,250,900,350);
    lave5 = new Hana3(-200,100,1000,280);
    lave6 = new Hana3(100,-100,700,420);
    lave7 = new Hana3(150,150,800,500);
    lave8 = new Hana3(200,-50,1300,550);
    
    w= new Walker();  
    w2= new Walker();
    w3= new Walker();
  
  scene=0;
}

void draw(){
     
   if(scene==1){
     pushMatrix();      
      translate(width/2,height/2);         
        //lave1.drawhana();
        //lave2.drawhana();
        //lave3.drawhana();
        lave4.drawhana();
        lave5.drawhana();
        lave6.drawhana();
        lave7.drawhana();
        lave8.drawhana();
     popMatrix(); 
   }
   if(scene==2){
     pushMatrix();      
      translate(width/2,height/2);         
        line1.drawLine();
        dendro1.drawhana();
        dendro2.drawhana();
        dendro3.drawhana();
     popMatrix();   
   }
   if(scene==3){
     pushMatrix();
      translate(width/2,height/2);  
        w.displey(100);
        w.step(0,0,90,-200,150,80,150,-260,20);
        w2.displey(80);
        w2.step(0,300,90,200,210,-260,200,-360,30);
        //w3.displey();
        //w3.step(90,-200); 
     popMatrix(); 
   }
   //if(scene==4){
   //  pushMatrix();
   //   translate(width/2,height/2);  
        
   //  popMatrix(); 
   //}
   
   
}

//キーボードを押した時、１回しか呼ばれない。setupの代わりにここに入れる
void keyPressed(){
    if(key == 'l'){
    sd1.play();
    scene=1;
    }
    if(key == 'd'){
    sd2.play();
    scene=2;
    }
    if(key == 'w'){
    sd3.play();
    scene=3;
    }  
}

class Walker{
  float x1,x2,x3,x4;
  float y1,y2,y3,y4;  
  float r;
  float tx,ty,tr,tx2,ty2,tr2;
  float a;
  float xspeed,xspeed2;
  float spx,spy,spr,spx2,spy2,spr2;
  
  Walker(){
    tx= 0;
    ty= 10000;
    tr=20000;
    
    x1= -width/2;
    y1= 0;
    x2= -width/2;
    y2= 0;
    x3= width/2;
    y3= 0;
    x4= width/2;
    y4= 0;
   
    tx2= 0;
    ty2= 20000;
    tr2= 40000;
   
  }

  void displey(float coloryellow){
    if(a <= 600){
    //ドット
    noStroke();    
    blendMode(ADD);             
    for (int i = 1; i < 100; ++i) {                 
       ellipse(x1,y1,i*0.02,i*0.02);
       ellipse(x2,y2,i*0.02,i*0.02);
       ellipse(x3,y3,i*0.02,i*0.02);
       ellipse(x4,y4,i*0.02,i*0.02);
       
       fill(
            map(i, 1, 50, 15, 1),
            coloryellow,
            map(i, 1, 50, 100, 200),
            20
            ); 
    }
    //線 
    for (int i = 1; i < 100; ++i) {                        
      strokeWeight(i*0.04); 
      stroke(
            map(i, 1, 50, 150, 100),
            coloryellow,
            map(i, 1, 50, 80, 150),
            20
            ); 
    }
    line(x1,y1,x2,y2);
    line(x3,y3,x4,y4);
    }else{
    noStroke();
    }
  }
  
  void step(float posx1, float posy1,float posx2, float posy2,float posx3, float posy3,float posx4,float posy4,float r0){
    if(a <= 600){
    r=r0+spr;
    spr=map(noise(tx),0,1,20,60);
    
    tr+=0.01;
    tx+=0.01;
    ty+=0.01;
    
    //x
    r=r0+spr;
    spx=map(noise(tx),0,1,0,width); 
    spx2=map(noise(tx2),0,1,0,width); 
    xspeed =0.01+ spx*0.005;
    xspeed2 =0.01+ spx2*0.01;

    x1+=xspeed;
    x1+=xspeed;///////////
    
    x3-=xspeed2;
    x3-=xspeed2;///////////
    
    //y
    spy=map(noise(ty),0,1,0,height);
    a+=3;  

    y1=r*sin(radians(a+270+posx1))+posy1 +spy*0.01; 
    y2=r*sin(radians(a+270+posx2))+posy2 +spy*0.01; 
    y3=r*sin(radians(a+270+posx3))+posy3 +spy*0.01; 
    y4=r*sin(radians(a+270+posx4))+posy4 +spy*0.01;             
    }  
  }
}

class Hana3{
  float hana_x,hana_y;
  float hana_x1,hana_y1;
  float hana_x2,hana_y2;   
  float hana_r,center_r;
  float center_x,center_y;
  float a;
  float ta;
   
  Hana3(float temp_x, float temp_y, float hanana_r,float a0){
    hana_x = temp_x;
    hana_y = temp_y;
    hana_r = hanana_r;
    a= a0 +ta;
    ta=0;
    
  }

  void drawhana(){     
    
    //if(frameCount<=300){
  
      a += ta ;
      ta = 10;    
      center_r = 500;
      
      center_x = center_r*cos(radians(a+180));
      center_y = center_r*sin(radians(a+180));
     
      //茎輪っかになるところ
      hana_x1 = hana_r*cos(radians(a))+center_x;
      hana_y1 = hana_r*sin(radians(a))+center_y;
      //茎先端
      hana_x2 = hana_r*cos(radians(a+30))+center_x;
      hana_y2 = hana_r*sin(radians(a+30))+center_y;
      
      if(a<=350+350){            
                noFill();
                blendMode(ADD);             
                for (int i = 1; i < 50; ++i) {
                   strokeWeight(i*0.04);
                   stroke(
                        map(i, 1, 50, 180, 360),
                        200,
                        map(i, 1, 50, 15, 1),
                        90
                        ); 
                }
                pushMatrix();      
                  translate(hana_x,hana_y);   
                    //茎
                    arc(center_x,center_y,2*hana_r,2*hana_r,radians(a-29),radians(a+29));
                    //花　：未使用
                        //ellipse(hana_x2,hana_y2,7,7);
                    //ここからは葉っぱ
                    float hatukene_x,hatukene_y,hatop_x,hatop_y;
                    float hatukene_lbx,hatukene_lby,hatukene_rbx,hatukene_rby,hatop_lbx,hatop_lby,hatop_rbx,hatop_rby;
                    float rateb =1.1;
                    float ratec =1.05;
                    float rated =1.0;
                    float ratee =1.08;
                    float ratef =1.08;
                    int ah = 11;
                    int atb = 3;
                    int atc = 3;
                    int atd= 10;
                    int ate = 7;
                    
                    hatukene_x = hana_x1;
                    hatukene_y = hana_y1;                             
                  
                    hatop_x = hana_r*cos(radians(a+ ah))* rateb +center_x;
                    hatop_y = hana_r*sin(radians(a+ ah))* rateb +center_y;               
                    
                    hatukene_lbx = hana_r*cos(radians(a + atb))* ratec +center_x;
                    hatukene_lby = hana_r*sin(radians(a + atb))* ratec +center_y;
                    
                    hatukene_rbx = hana_r*cos(radians(a + atc))* rated +center_x;
                    hatukene_rby = hana_r*sin(radians(a + atc))* rated +center_y;
                    
                    hatop_lbx = hana_r*cos(radians(a + atd))* ratee +center_x;
                    hatop_lby = hana_r*sin(radians(a + atd))* ratee +center_y;
                    
                    hatop_rbx = hana_r*cos(radians(a + ate))* ratef +center_x;
                    hatop_rby = hana_r*sin(radians(a + ate))* ratef +center_y;
                                          
                    beginShape();
                      vertex(hatukene_x, hatukene_y);
                      bezierVertex(hatukene_lbx,hatukene_lby,hatop_lbx,hatop_lby,hatop_x,hatop_y);
                      bezierVertex(hatop_rbx,hatop_rby,hatukene_rbx,hatukene_rby,hatukene_x, hatukene_y);              
                    endShape(CLOSE);
                    
              popMatrix();
        }
    //}else{
    //a = 0;
    //} 
  }
  
}

class Line{
  float hana_x;
  float hana_y;
  float line_r;
  float line_a; 
  float xspeed;
  
  Line(float temp_x, float temp_y){
    hana_x = temp_x;//0 
    hana_y = temp_y;//-350
    line_r = 230;
    line_a = 0;
  }
        
  void drawLine(){
    
      hana_x = line_r * cos(radians(line_a)+180);
      hana_y = line_r * sin(radians(line_a)+180);
      line_a +=2;
      for (int i = 1; i < 20; ++i) {
         ellipse (hana_x,hana_y,i*0.05,i*0.05);
         fill(
              map(i, 1, 50, 180, 360),
              100,
              map(i, 1, 50, 15, 1),
              20
              ); 
      }       
  }
}

class Hana2{

  float hana_x;
  float hana_y;
  float hana_rnosa;
  
  //半径の変化 　r=r0+◯*rspeed;
  float r;//大きさ　
  float r0;//はじめの大きさ
  float rspeed;//大きくなる速度
  
  //角度の変化 　a = a0+(90*sin(radians(mita-90))+90);
  float a;//角度 
  float a0;//はじめの角度   a0 = -60*maisu[n]
  float mita;//大きくなる速度を制御する三角関数の角度
  float astop;//終えるまで角度　astop = 360 + a0
  
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
  
  
  
  Hana2(float temp_x, float temp_y,float rnosa){
   hana_x = temp_x; 
   hana_y = temp_y;
   hana_rnosa = rnosa;
  }

  void drawhana(){
    drawhanabira(  1,   0);    
    drawhanabira(0.9, -60);
    drawhanabira(0.7, -75);
    drawhanabira(0.6, -120);
    drawhanabira(0.4, -135);
    drawhanabira(0.2, -180); 
  }
  
  
  void drawhanabira(float rsc, float a0c){
    //if(frameCount<=300){ 
      for(int n = 0; n<=2; n++){                               
              //rspeed += rsc;  //これだとrspeedは1frameで(1*3)+(0.9*3)+(0.7*3)+...になってしまうので花びら大きくなってしまう。
              rspeed = rsc * frameCount; 
              a0 = (-120 * n ) + a0c; 
        
        r0 = 5;       
        r = r0 + hana_rnosa *rspeed;// rnosa追加
        a = a0;
        //a = a0+(90*sin(radians(mita-90))+90);
        //mita += 0.05;     
        //astop = 180 + a0;
    
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
        
            if(r<180){       
              blendMode(MULTIPLY);
              fill (20,50,250,10);
              blendMode(SCREEN);             
              for (int i = 1; i < 50; ++i) {
                 strokeWeight(i*0.02);
                 stroke(
                      map(i, 1, 50, 180, 360),
                      200,
                      map(i, 1, 50, 15, 1),
                      20
                      ); 
              }
                  pushMatrix(); 
                  translate(hana_x, hana_y);                  
                        beginShape();
                          vertex(0, 0);
                          bezierVertex(0, 0, llbx,llby,lx,ly);
                          bezierVertex(lrbx,lrby,tlbx,tlby,tx,ty);
                          bezierVertex(trbx,trby,rlbx,rlby,rx,ry);
                          bezierVertex(rrbx,rrby,0,0,0,0);              
                        endShape(CLOSE);        
                  popMatrix();
            }
           
        }
     //}else{ 
     //}
  }
}
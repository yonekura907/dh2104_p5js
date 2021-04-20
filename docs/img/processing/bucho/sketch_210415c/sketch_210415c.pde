  //グローバル関数
  //正三角形の１辺の半分
  float a;
  //背景の角度
  float back;
  
  //色
  color circleColor =color(random(150,255),0,0,200);
  color daiyaColor =color(255,148,122,200);
  color hexaColor =color(100,200,random(200,255),200);
  color hexa2Color =color(random(230,255),random(50,150),random(50,150),200);
  //角度
  float circlesita;
  float daiyasita;
  float hexasita;
  float hexa2sita;
  //角度の配列
  float []sita={circlesita,daiyasita,hexasita,hexa2sita};

  //軌道円の中心座標
  float XCirclecenter,YCirclecenter;
  float XDaiyacenter,YDaiyacenter;
  float XHexacenter,YHexacenter;
  float XHexa2center,YHexa2center;
  //軌道円の中心座標の配列
  float []Xcenter={XCirclecenter,XDaiyacenter,XHexacenter,XHexa2center};
  float []Ycenter={YCirclecenter,YDaiyacenter,YHexacenter,YHexa2center};
  
  //丸のオブジェクトの座標 あとで整理する！！
  float CircleX=0,CircleY=0,leftX=0,leftY=0,rightX=0, rightY=0,
        CircleupX=0,CircleupY=0,leftupX=0,leftupY=0,rightupX=0,rightupY=0;
  //ダイヤのオブジェクトの座標
  float daiyaX=0,daiyaleftX=0,daiyarightX=0,daiyaupX=0,daiyaleftupX=0,daiyarightupX=0;
  float daiyaY=0,daiyaleftY=0,daiyarightY=0,daiyaupY=0,daiyaleftupY=0,daiyarightupY=0;  
  //六角形のオブジェクトの座標
  float hexaX=0,hexaleftX=0,hexarightX=0,hexaupX=0,hexaleftupX=0,hexarightupX=0;
  float hexaY=0,hexaleftY=0,hexarightY=0,hexaupY=0,hexaleftupY=0,hexarightupY=0;
  //六角形２のオブジェクトの座標
  float hexa2X=0,hexaleft2X=0,hexaright2X=0,hexaup2X=0,hexaleftup2X=0,hexarightup2X=0;
  float hexa2Y=0,hexaleft2Y=0,hexaright2Y=0,hexaup2Y=0,hexaleftup2Y=0,hexarightup2Y=0;

  
void setup(){
  size(800,600);
  background(255);
  frameRate(100);
}

void draw(){
  background(255);
  a=50;
  
  //六角格子
  for( int j=-5; j<=5; j++){
    for(int i=-5; i<=5; i++){
    pushMatrix();
      translate(width/2+(2*a*i)+(a*j),height/2+(a*sqrt(3)*j));     
      
        fill(150+mouseX/4,100+mouseY/2,random(50,200),20);
        noStroke();
        back -= 0.0001;
        rotate(back);
        int b= 50;
              beginShape();                     
                    vertex(0, b*sqrt(3));
                    vertex(b*sqrt(3),  b);
                    vertex(b*sqrt(3), -b);
                    vertex(0, -b*sqrt(3));
                    vertex(-b*sqrt(3), -b);
                    vertex(-b*sqrt(3),  b);
              endShape(CLOSE);
    popMatrix();
    }
  }
   
  
  //三角格子
  for( int j=-5; j<=5; j++){
    for(int i=-5; i<=5; i++){
    pushMatrix();
      translate(width/2+(2*a*i)+(a*j),height/2+(a*sqrt(3)*j));
        noFill();
        stroke(230);
        triangle(-a, a*sqrt(3), a, a*sqrt(3), 0, 0);
    popMatrix();
    }
  }
   
  //図形の軌道、色、回転
  noStroke();
  pushMatrix();
    translate(width/2,height/2); 

        //円
        drawCircle(1.4,circleColor); 
        //ダイヤ
        drawDaiya(1.1,daiyaColor);
        //六角形
        drawHexa(0.7,hexaColor);
        //六角形2
        drawHexa2(0.2,hexa2Color);
        
  popMatrix();
}


//細かいdraw関数
//丸のオブジェクト
void drawCircle(float rr,int colorObject){  
         
      fill(colorObject);  
      //【先生のめも】mouseのY座標（0~500）をspeed(0~10)に変換して保存
      //【先生のめも】speedX = map(mouseX,0,600,0,0,100);
      sita[0] += mouseX*0.005;//これどうにかしたい。
      

      float [] x = {CircleX,leftX,rightX,CircleupX,leftupX,rightupX};
      float [] y = {CircleY,leftY,rightY,CircleupY,leftupY,rightupY};
                   
      x[0] = rr *a * cos(radians(60 + sita[0])) + Xcenter[0];
      y[0] = rr *a * sin(radians(60 + sita[0])) + Ycenter[0];
      
        if(y[0]< -sqrt(3)* x[0] || y[0]> a*sqrt(3) || y[0]<sqrt(3)* x[0] ){
          Xcenter[0] = Xcenter[0]+(x[0]-Xcenter[0])*2;
          Ycenter[0] = Ycenter[0]+(y[0]-Ycenter[0])*2;
          sita[0] = sita[0] -180;               
        }
            
          //CircleY=-sqrt(3)*CircleXの線対称
          x[1] = x[0]-((x[0]-((y[0])/-sqrt(3)))/2*3);
          y[1] = y[0]-((x[0]-((y[0])/-sqrt(3)))/2*sqrt(3));
          
          //leftY=sqrt(3)*leftXの線対称
          x[2] = x[0]-((x[0]-((y[0])/sqrt(3)))/2*3);
          y[2] = y[0]-((x[0]-((y[0])/sqrt(3)))/2*-sqrt(3));
          
          //CircleY=a*sqrt(3)の線対称
          x[3] = x[0];
          y[3] = -y[0];
          
          //CircleY=a*sqrt(3)の線対称
          x[4] = x[1];
          y[4] = -y[1];
          
          //CircleY=a*sqrt(3)の線対称
          x[5] = x[2];
          y[5] = -y[2];        
         
          for(int e=-5; e<=5; e++){
            for(int d=-5; d<=5; d++){
              pushMatrix();
              translate(0+(3*2*a*d)+(3*a*e),0-(a*sqrt(3)*e));
                for(int i=0; i<=5; i++){
                ellipse(x[i],y[i],15,5);
                ellipse(x[i],y[i],5,15);
                }
              popMatrix();
            }
          }
}

void drawDaiya(float rr,int colorObject){  
         
      fill(colorObject);  
      sita[1] += 1;//これどうにかしたい。

      float [] x = {daiyaX,daiyaleftX,daiyarightX,daiyaupX,daiyaleftupX,daiyarightupX};
      float [] y = {daiyaY,daiyaleftY,daiyarightY,daiyaupY,daiyaleftupY,daiyarightupY};
            
      x[0] = rr *a * cos(radians(60 + sita[1])) + Xcenter[1];
      y[0] = rr *a * sin(radians(60 + sita[1])) + Ycenter[1];
      
        if(y[0]< -sqrt(3)* x[0] || y[0]> a*sqrt(3) || y[0]<sqrt(3)* x[0] ){
          Xcenter[1] = Xcenter[1]+(x[0]-Xcenter[1])*2;
          Ycenter[1] = Ycenter[1]+(y[0]-Ycenter[1])*2;
          sita[1] = sita[1] -180;               
        }
            
          //CircleY=-sqrt(3)*CircleXの線対称
          x[1] = x[0]-((x[0]-((y[0])/-sqrt(3)))/2*3);
          y[1] = y[0]-((x[0]-((y[0])/-sqrt(3)))/2*sqrt(3));
          
          //leftY=sqrt(3)*leftXの線対称
          x[2] = x[0]-((x[0]-((y[0])/sqrt(3)))/2*3);
          y[2] = y[0]-((x[0]-((y[0])/sqrt(3)))/2*-sqrt(3));
          
          //CircleY=a*sqrt(3)の線対称
          x[3] = x[0];
          y[3] = -y[0];
          
          //CircleY=a*sqrt(3)の線対称
          x[4] = x[1];
          y[4] = -y[1];
          
          //CircleY=a*sqrt(3)の線対称
          x[5] = x[2];
          y[5] = -y[2];      
         
          for(int e=-5; e<=5; e++){
            for(int d=-5; d<=5; d++){
              pushMatrix();
              translate(0+(3*2*a*d)+(3*a*e),0-(a*sqrt(3)*e));
                for(int i=0; i<=5; i++){
                    beginShape();                     
                          vertex(x[i]+ 0, y[i]+ 12);
                          vertex(x[i]+ 7, y[i]+ 0);
                          vertex(x[i]+ 0, y[i] -12);
                          vertex(x[i] -7, y[i]+ 0);
                    endShape(CLOSE); 
                    //rotate(daiyasita);//ここにおいてみたけど意味がない                    
                }
              popMatrix();
            }
          }           
}


void drawHexa(float rr,int colorObject){  
         
      fill(colorObject);  
      sita[2] += 3;//これどうにかしたい。

      float [] x = {hexaX,hexaleftX,hexarightX,hexaupX,hexaleftupX,hexarightupX};
      float [] y = {hexaY,hexaleftY,hexarightY,hexaupY,hexaleftupY,hexarightupY};
           
      x[0] = rr *a * cos(radians(60 + sita[2])) + Xcenter[2];
      y[0] = rr *a * sin(radians(60 + sita[2])) + Ycenter[2];
      
        if(y[0]< -sqrt(3)* x[0] || y[0]> a*sqrt(3) || y[0]<sqrt(3)* x[0] ){
          Xcenter[2] = Xcenter[2]+(x[0]-Xcenter[2])*2;
          Ycenter[2] = Ycenter[2]+(y[0]-Ycenter[2])*2;
          sita[2] = sita[2] -180;               
        }
            
          //CircleY=-sqrt(3)*CircleXの線対称
          x[1] = x[0]-((x[0]-((y[0])/-sqrt(3)))/2*3);
          y[1] = y[0]-((x[0]-((y[0])/-sqrt(3)))/2*sqrt(3));
          
          //leftY=sqrt(3)*leftXの線対称
          x[2] = x[0]-((x[0]-((y[0])/sqrt(3)))/2*3);
          y[2] = y[0]-((x[0]-((y[0])/sqrt(3)))/2*-sqrt(3));
          
          //CircleY=a*sqrt(3)の線対称
          x[3] = x[0];
          y[3] = -y[0];
          
          //CircleY=a*sqrt(3)の線対称
          x[4] = x[1];
          y[4] = -y[1];
          
          //CircleY=a*sqrt(3)の線対称
          x[5] = x[2];
          y[5] = -y[2];      
         
          for(int e=-5; e<=5; e++){
            for(int d=-5; d<=5; d++){
              pushMatrix();
              translate(0+(3*2*a*d)+(3*a*e),0-(a*sqrt(3)*e));
                for(int i=0; i<=5; i++){
                    //rotate(sita[2]/100);
                    beginShape();                     
                          vertex(x[i]+ 0, y[i]+ 8);
                          vertex(x[i]+ 12, y[i]+ 0);
                          vertex(x[i]+ 0, y[i] -8);
                          vertex(x[i] -12, y[i]+ 0);
                    endShape(CLOSE);    
                    //rotate(0);                
                }
              popMatrix();
            }
          } 
          
}

void drawHexa2(float rr,int colorObject){  
         
      fill(colorObject);  
      sita[3] += 3;//これどうにかしたい。

      float [] x = {hexa2X,hexaleft2X,hexaright2X,hexaup2X,hexaleftup2X,hexarightup2X};
      float [] y = {hexa2Y,hexaleft2Y,hexaright2Y,hexaup2Y,hexaleftup2Y,hexarightup2Y};
           
      x[0] = rr *a * cos(radians(60 + sita[3])) + Xcenter[3];
      y[0] = rr *a * sin(radians(60 + sita[3])) + Ycenter[3];
      
        if(y[0]< -sqrt(3)* x[0] || y[0]> a*sqrt(3) || y[0]<sqrt(3)* x[0] ){
          Xcenter[3] = Xcenter[3]+(x[0]-Xcenter[3])*2;
          Ycenter[3] = Ycenter[3]+(y[0]-Ycenter[3])*2;
          sita[3] = sita[3] -180;               
        }
            
          //CircleY=-sqrt(3)*CircleXの線対称
          x[1] = x[0]-((x[0]-((y[0])/-sqrt(3)))/2*3);
          y[1] = y[0]-((x[0]-((y[0])/-sqrt(3)))/2*sqrt(3));
          
          //leftY=sqrt(3)*leftXの線対称
          x[2] = x[0]-((x[0]-((y[0])/sqrt(3)))/2*3);
          y[2] = y[0]-((x[0]-((y[0])/sqrt(3)))/2*-sqrt(3));
          
          //CircleY=a*sqrt(3)の線対称
          x[3] = x[0];
          y[3] = -y[0];
          
          //CircleY=a*sqrt(3)の線対称
          x[4] = x[1];
          y[4] = -y[1];
          
          //CircleY=a*sqrt(3)の線対称
          x[5] = x[2];
          y[5] = -y[2];      
         
          for(int e=-5; e<=5; e++){
            for(int d=-5; d<=5; d++){
              pushMatrix();
              translate(0+(3*2*a*d)+(3*a*e),0-(a*sqrt(3)*e));
                for(int i=0; i<=5; i++){
                     int b= 5;
                        beginShape();                     
                              vertex(x[i]+ 0, y[i]+ b*sqrt(3));
                              vertex(x[i]+ b*sqrt(3), y[i]+ b);
                              vertex(x[i]+ b*sqrt(3), y[i] -b);
                              vertex(x[i]+ 0, y[i] -b*sqrt(3));
                              vertex(x[i] -b*sqrt(3), y[i] -b);
                              vertex(x[i] -b*sqrt(3), y[i]+ b);
                        endShape(CLOSE);               
                }
              popMatrix();
            }
          } 
          
}

                                             

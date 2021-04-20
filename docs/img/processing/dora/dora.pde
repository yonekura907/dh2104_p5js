int posX;
int posY;
int posX2;
int posX3;
int posX4;
int posX5;

void setup(){
  size(1000,1000);
  background(255);
  posX = 500; 
  posY = 500;
  posX2 = 500; 
  posX3 = 300;
  posX4 = 0;
  posX5=1000;
  colorMode(HSB,360,100,100,100);
}

void draw(){
  background(179,60,91);
  
  //雲
  noStroke();
  fill(250,0,100);
  

  ellipse(posX2,100,300,100);
  posX2=posX2+2;
  if(posX2>1300){
  posX2 = -300;
  }
  ellipse(posX2+80,160,180,80);
  if(posX2>1300){
  posX2 = -300;
  }
  
  ellipse(posX5,140,200,80);
  if(posX5>1300){
  posX5 = -300;
  }
  ellipse(posX5+80,170,90,50);
  if(posX5>1300){
  posX5 = -300;
  }
  
    ellipse(posX4,100,200,70);
  if(posX4>1300){
  posX4 = -300;
  }
  
  ellipse(posX3,300,250,100);
  posX3=posX3+2;
  if(posX3>1300){
  posX3 = -300;
  }
  ellipse(posX3-40,370,180,80);
  if(posX3>1300){
  posX3 = -300;
  }
  
  ellipse(posX4-50,370,150,80);
  if(posX4>1300){
  posX4 = -300;
  }
  
  
  ellipse(posX4-60,600,400,200);
    posX4=posX4+2;
  if(posX4>1300){
  posX4 = -300;
  }
  ellipse(posX4+20,720,220,100);
  if(posX4>1300){
  posX4 = -300;
  }
  
  ellipse(posX5-60,500,400,200);
  if(posX5>1300){
  posX5 = -300;
  }
  
  ellipse(posX3,900,80,60);
  if(posX3>1300){
  posX3 = -300;
  }
  
  ellipse(posX5,880,140,80);
  posX5=posX5+2;
  if(posX5>1300){
  posX5 = -300;
  }
 
  
  makeChara(posX,posY);
  
  if(mouseX<500){
    posX=posX-1;
    if(posX<-100){
    posX=500;
  }
  }else{
    posX=posX+1; //現在の値に1足す
  //posXが1100を超えたら
  if(posX>1100){
    posX=-100; //-100に戻してあげる
  }
}
  if(mouseY<500){
    posY=posY-1;
    if(posY<-100){
    posY=1100;
    }
  }else{
    posY=posY+1;
  if(posY>1100){
    posY=-100;
  }
}
}

//キャラクターの顔を描く関数
void makeChara(int _x,int _y){
//足
stroke(0);
fill(184,0,100);
ellipse(_x-170,_y+140,80,100);
ellipse(_x-30,_y+140,80,100);

//胴体
fill(213,81,100);
arc(_x-100,_y, 490, 200, radians(0), radians(180));
ellipse(_x-100,_y-20,270,400);
fill(184,0,100);
ellipse(_x-100,_y+100,180,140);
arc(_x-100,_y+120, 100, 80, radians(0), radians(180));
line(_x-150,_y+120,_x-50,_y+120);

//首輪
fill(3,76,89);
ellipse(_x-100,_y-80,350,360);

//タケコプター
fill(184,0,100);
ellipse(_x-100,_y-350,140,50);
noFill();
stroke(255);
arc(_x-120,_y-355,140,50, radians(20), radians(60));
arc(_x-110,_y-352,140,50, radians(10), radians(70));
arc(_x-90,_y-340,140,50, radians(210), radians(250));
arc(_x-95,_y-345,140,50, radians(200), radians(270));
stroke(0);
fill(49,98,100);
rect(_x-110,_y-340,20,50);
ellipse(_x-100,_y-270,50,50);
rect(_x-115,_y-350,30,15);
line(_x-115,_y-345,_x-85,_y-345);

//青円
fill(213,81,100);
ellipse(_x-100,_y-100,400,360);
//白円
fill(184,0,100);
ellipse(_x-100,_y-70,340,300);

//白目
fill(184,0,100);
ellipse(_x-140,_y-210,80,100);
ellipse(_x-60,_y-210,80,100);
//瞳
fill(0);
ellipse(_x-120,_y-210,30,40);
ellipse(_x-80,_y-210,30,40);
noStroke();
fill(184,0,100);
ellipse(_x-120,_y-210,10,15);
ellipse(_x-80,_y-210,10,15);

//くち
stroke(0);
fill(184,0,100);
arc(_x-100,_y-50,200,100, radians(0), radians(180));
line(_x-100,_y-140,_x-100,_y);

//鼻
fill(3,76,89);
ellipse(_x-100,_y-155,50,50);
noStroke();
fill(184,0,100);
ellipse(_x-110,_y-165,15,15);

//左ひげ
stroke(0);
line(_x-140,_y-120,_x-220,_y-140);
line(_x-140,_y-100,_x-220,_y-100);
line(_x-140,_y-80,_x-220,_y-60);

//右ひげ
line(_x+20,_y-140,_x-60,_y-120);
line(_x+20,_y-100,_x-60,_y-100);
line(_x+20,_y-60,_x-60,_y-80);

//鈴
fill(49,98,100);
ellipse(_x-100,_y+100,50,50);
ellipse(_x-100,_y+90,55,10);
fill(0);
ellipse(_x-100,_y+105,15,15);
line(_x-100,_y+100,_x-100,_y+125);


//手
fill(184,0,100);
ellipse(_x+100,_y,100,100);
ellipse(_x-300,_y,100,100);
}

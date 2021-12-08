//Presentation

//音ファイルの変数

import processing.sound.*;

SoundFile se1;
SoundFile se2;
SoundFile se3;
SoundFile se4;

//シーンを切り替える変数
int scene;

//シーン1の変数

int tree_step;
float tree_angle;
float tree_length;
float tree_length_limit;
float tree_startX;
float tree_scale;
float tree_sw_scale;

//シーン2の変数
int angle;
int radius;
int count;
int alpha;

//シーン3の変数

float x = 0.1;
float y = 0.1;

static final float a = 1.25;
static final float b = 0.75;

//シーン4の変数

float x2 = 0.1;
float y2 = 0.1;

static final float a2 = -2.0;
static final float b2 = 0.0;
static final float c2 = 2.6;
static final float d2 = -0.5;

void setup(){

  size(1280,720);
  background(0);
  colorMode(HSB,360,100,100,100);
  
  //音データの読み込み
  se1 = new SoundFile(this,"pinwheel.mp3");
  se2 = new SoundFile(this,"bubbles.mp3");
  se3 = new SoundFile(this,"squiggle.mp3");
  se4 = new SoundFile(this,"ufo.mp3");
  
  //シーン0
  scene = 0;
  
  //シーン2
  frameRate(60);
  count = 0;
  alpha = 0;
  
}

void draw(){
  
  println(scene);
  
  //シーン1
  if(scene == 1){
   
    noStroke();
    fill(0,0,0,5);
    rect(0,0,width,height);
  
    
    blendMode(SCREEN);
    tree_step = 10;
    tree_angle = 30;
    tree_length = 100;
    tree_length_limit = 20;
    tree_scale = 1.05;
    tree_sw_scale = 0.75;
    tree_startX = width/2;
    tree_angle = radians(tree_angle);
        
    if(frameCount % 15 == 0){
      newTree();
    }
    
    
  }
  
  //シーン2
  if(scene == 2){
    
    blendMode(NORMAL);
    
    count ++;
  
    noStroke();
    fill(0,0,0,5);
    rect(0,0,width,height);
  
    if(count < 60*3){
    
    translate(width/2,height/2);
    rotate(radians(angle));
    
    noFill();
    strokeWeight(3);
    stroke(220,100,100,100);
    
    triangle(radius*cos(radians(30)),radius*sin(radians(30)),radius*cos(radians(150)),radius*sin(radians(150)),radius*cos(radians(270)),radius*sin(radians(270)));
    
    stroke(200,100,100,100);    
    triangle(radius*cos(radians(60)),radius*sin(radians(60)),radius*cos(radians(180)),radius*sin(radians(180)),radius*cos(radians(300)),radius*sin(radians(300)));
    
    angle = angle+1;
    radius = radius+8;  
      
  }else{
    
    fill(0,0,0,alpha);
    rect(0,0,width,height);
    
    alpha = alpha +1;
    
    }
  }
  
  //シーン3
  if(scene == 3){
    
    blendMode(ADD);
    stroke(220, 50, 100, 50);
    
    float _x;
    float _y;

    for (int i = 0; i < 10000; i++) {
      
      _x = (1+a*b)*x-b*x*y;
      _y = (1-b)*y+b*x*x;
      
      point(_x*250+width*0.5, -_y*250+height*0.9);
      
      x = _x;
      y = _y;
       
    }
  }
  
  //シーン4
  if(scene == 4){
    
  blendMode(ADD);
  stroke(220,50,100,50);
    
  float _x2;
  float _y2;
  float A;
 
  //iは0から始まって、iが1000以下の時、iは1ずつ増える
  for(int i = 0; i < 3000; i++){
    
    A = a2*(x2*x2+y2*y2)+b2*x2*(x2*x2-3*y2*y2)+c2;
    _x2 = A*x2+d2*(x2*x2-y2*y2);
    _y2 = A*y2-2*d2*x2*y2;
    
    point(_x2*250+width/2,-_y2*250+height/2);
    
    x2 = _x2;
    y2 = _y2;
  
    }
  }
  
}

void keyPressed(){
  
  //シーン1
  if(key == 'a'){
    
    background(0);
    scene = 1;
    se1.play();
    //redraw();
    
  }
  
  if(key == 's'){
    
    background(0);
    scene = 2;
    se2.play();
    
  }
  
  if(key == 'd'){
    
    background(0);
    scene = 3;
    se3.play();
  
  }
  
  if(key == 'f'){
    
    background(0);
    scene = 4;
    se4.play();
  
  }

}

//シーン1の関数

void newTree(){
  
  //noLoop();
  
  translate(tree_startX,height);
  branch(tree_startX,tree_length,tree_step);

}

void branch(float x0,float h,int n){
  
  //noLoop();
  
  float theta;
  
  strokeWeight(int((n+2)*tree_sw_scale));
  stroke(0,0,100,20);
  if(n < 1){
    
    stroke(220,100,100,50);
  
  }
  
  line(0,0,0,-h);
  translate(0,-h);
  
  h = h * tree_scale;
  
  if(n > 0){
    
    theta = random(0,tree_angle);
    pushMatrix();
    rotate(theta);
    branch(x0,random(tree_length_limit,h),n-1);
    popMatrix();
    theta = random(-tree_angle,0);
    pushMatrix();
    rotate(theta);
    branch(x0,random(tree_length_limit,h),n-1);
    popMatrix();

  }
}

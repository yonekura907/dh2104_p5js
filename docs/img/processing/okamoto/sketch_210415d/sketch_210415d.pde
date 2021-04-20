//global variables
int centerX;
int centerY;
int r;
int diameter; //円の直径

//setup()
void setup(){
  size(800, 600);
  smooth();
  noFill();
  background(255);
  centerX = width/2;
  centerY = height/2;
  r = 10;
}

//draw()
void draw(){
  
if(mouseX > width/2 && mouseY < height/2){ //マウスが半分より右だったらblue 第1象限
  stroke(100,210,255,30);//blue
  strokeWeight(1);
  line(centerX, centerY, mouseX, mouseY);
  rect(mouseX, mouseY,centerX, centerY);
 }else if(mouseX < width/2 && mouseY < height/2){ //マウスが半分より左だったらyellow 第2象限
  stroke(255,240,40,20);//yellow
  strokeWeight(1);
  line(centerX, centerY, mouseX, mouseY);
  rect(mouseX, mouseY,centerX, centerY); 
 } else if(mouseX < width/2 && mouseY > height/2){ //マウスが半分より上だったらpurple 第3象限
  stroke(164,60,255,20); //purple
  strokeWeight(1);
  line(centerX, centerY, mouseX, mouseY);
  rect(mouseX, mouseY,centerX, centerY);
 }else if(mouseX > width/2 && mouseY > height/2){ //第４象限
  stroke(235,20,0,10); //red　第３象限は赤にしたかった
  strokeWeight(1);
  line(centerX, centerY, mouseX, mouseY);
  rect(mouseX, mouseY,centerX, centerY);
 }

//中心から円が大きくなる　色は上記のマウス位置による
  ellipse(width/2, height/2, diameter, diameter);
  diameter +=1;
  println(mouseX, mouseY);
  

} 

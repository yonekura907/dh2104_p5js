# イージング


## 目的値へ向かうイージングアニメーション

```
// 円の座標
float x;
float y;

// 目的地の座標
float targetX;
float targetY;

float easing;


void setup(){
  size(500, 500);
  background(0);
  noStroke();
  
  // グローバル変数に初期値を代入
  x = width/2;
  y = height/2;
  targetX = 400;
  targetY = 400;
  easing = 0.05;
}

void draw(){
  background(0);
  
  // 現在の位置と目的地の差分（距離）
  float distanceX = targetX - x;
  float distanceY = targetY - y;
  
  // 絶対座標が1以上ならアニメーションする
  //現在のX座標に距離を足していく、イージングでスピードに変化を加える
  x = x + distanceX * easing;
  y = y + distanceY * easing;

  //　塗りと円の描画
  fill(255,0,0);
  ellipse(x,y,40,40);
}

```

&nbsp;

<!--
### 目的値へ向かうイージングアニメーション PVector

```
// 円の現在地
PVector pos;

// 円の目的地
PVector target;

// イージング
float easing; 

void setup() {
    size(512, 512);
    noStroke();

    pos = new PVector(0,0);
    target = new PVector(200,200);
    easing = 0.05;
}

void draw() {
    background(0);

    PVector distance = new PVector();

    // 現在の位置と目的地の距離
    distance.x = target.x - pos.x;
    distance.y = target.y - pos.y;

    // 絶対座標が1以上ならアニメーションする
    if(abs(distance.x) > 1.0){
        pos.x = pos.x + distance.x * easing;
    }
    if(abs(distance.y) > 1.0){
        pos.y = pos.y + distance.y * easing;
    }

    fill(255);
    ellipse(pos.x, pos.y, 40, 40);
}
```

-->

&nbsp;



## 目的地へ戻るアニメーション

```
float targetX = 100;
float targetY = 100;
float posX;
float posY;
float speedX;
float speedY;
float easing = 0.05;

boolean isOn;

void setup() {
    size(500, 500);
    isOn = false;
    posX = random(8,width);
    posY = random(8,height);
    speedX = random(-4,4);
    speedY = random(-4,4);
} 


void draw() {
    background(255);

    // 目的地
    fill(255,0,0);
    ellipse(targetX, targetY, 40, 40);

    noStroke();
    fill(0,255,255);

    if (isOn == true) {
        float distanceX = targetX- posX;
        float distanceY = targetY - posY;

		 // 絶対座標が1以上ならアニメーションする
        if(abs(distanceX) > 1.0 && abs(distanceY) > 1.0){
            posX = posX + distanceX * easing; //現在のX座標に距離を足していく、イージングでスピードに変化を加える
             posY = posY + distanceY * easing; //現在のY座標に距離を足していく、イージングでスピードに変化を加える
        }

        println(distanceX,distanceY);
    } else {
        posX = posX + speedX;
        posY = posY + speedY;

        if(posX < 0 || posX > width){
            speedX = speedX * -1;
        }
        if(posY < 0 || posY > height){
            speedY = speedY* -1;
        }
    }
    ellipse(posX, posY, 40, 40);
    println("isOn: "+isOn);
}

void mousePressed(){
    isOn = true;
}

void mouseReleased(){
    isOn = false;
}

```


&nbsp;


## 目的地へ戻るアニメーション 配列

```
int aLength = 18;

// 目的地
int[] targetX = {45,85,125,160,200,240,270,315,355,395,430,465,505,545,580,225,315,410};
int[] targetY = {590,510,435,355,275,198,120,45,120,198,275,355,435,510,590,435,435,435};

// 円の座標
float[] x = new float[aLength];
float[] y = new float[aLength];

// 円のスピード
float[] speedX = new float[aLength];
float[] speedY = new float[aLength];

// イージング
float easing;

// マウスを押しているかどうかのフラグ
boolean isClick;

void setup(){
  size(650, 650);
  background(0);
  
  // フラグをオフ
  isClick = false;
  
  easing = 0.05;

  // グローバル配列に初期値を代入
  for(int i=0; i<aLength; i++ ){
    x[i] = random(0,width);
    y[i] = random(0,height);
    speedX[i] = random(-8,8);
    speedY[i] = random(-8,8);
  }
}

void draw(){
  background(0);
  
  // 目的と現在地の距離
  float[]distanceX = new float[aLength];
  float[]distanceY = new float[aLength];
  
  noStroke();
  fill(255,0,0);
  
  for(int i=0; i<aLength; i++ ){
    
    if(isClick == true){
    // もしフラグがオンだったら
    
      // 目的地から現在地を引いた差分を距離の配列に保存
      distanceX[i] = targetX[i] - x[i];
      distanceY[i] = targetY[i] - y[i];
      
      // 現在地に差分を足す
      x[i] = x[i] + distanceX[i] * easing;
      y[i] = y[i] + distanceY[i] * easing;
      
    } else {
    // もしフラグがオフだったら
    
      // 座標にスピードを足す
      x[i] += speedX[i];
      y[i] += speedY[i];
      
      // 跳ね返り
      if(x[i] < 0 || x[i] > width){
          speedX[i] = speedX[i] * -1;
      }
      if(x[i] < 0 || x[i] > height){
          speedY[i] = speedY[i] * -1;
      }
    }
    ellipse(x[i], y[i], 40, 40);
  }
}

void mousePressed(){
  isClick = true; // フラグをオン
}

void mouseReleased(){
  isClick = false; // フラグをオフ
}

void keyPressed(){
  if(key == 'a'){
    isClick = true; // フラグをオン
  }
}

void keyReleased(){
  isClick = false; // フラグをオフ
}

```

![image](img/easing01.png)
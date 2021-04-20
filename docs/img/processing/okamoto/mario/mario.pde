//中心のX座標、Y座標を定義
float centerX;
float centerY;

//スピード宣言？
float x = 10, y = 350;
float xSpeed = 0, ySpeed = 0;


//一回だけ実行
void setup() {
  size(800, 600);

  //塗りなし
  noStroke();
  //中心
  centerX = 400;
  centerY = 300;
}

//繰り返し実行
void draw() {
  //地面色の背景　背景消すとマリオがwidthこえたら軌跡描いてまうのはなんで(背景ずっとループの方法?)
  //background(232, 209, 93);

  //背景（地面と空）がスクロール
  centerX = centerX - 0.5; 
  //centerY = centerY ; 

  //地面と空の色の変数
  color groundColor = color(232, 209, 93);
  color skyColor = color(156, 221, 255);
  color starColor = color(255, 255, 0);
  color blockColor = color(150, 100, 10);
  color cloudColor = color(255, 255, 255);
  color pipeColor = color(205, 240, 65);


  // 地面
  fill(groundColor);
  rect(centerX-400, centerY+100, width+1000, 300);
  // 空
  fill(skyColor);
  rect(centerX-400, centerY+100, width+1000, -400);
  
  // 星
  fill(starColor);
  beginShape();
  vertex(centerX, centerY -120);
  vertex(centerX - 12, centerY -85);
  vertex(centerX + 18, centerY -108);
  vertex(centerX - 18, centerY -108);
  vertex(centerX + 12, centerY -85);
  endShape(CLOSE);
  
  fill(starColor);
  beginShape();
  vertex(centerX+400, centerY-100 -120);
  vertex(centerX+400 - 12, centerY -100-85);
  vertex(centerX+400 + 18, centerY -100-108);
  vertex(centerX+400 - 18, centerY -100-108);
  vertex(centerX+400 + 12, centerY -100-85);
  endShape(CLOSE);

  fill(starColor);
  beginShape();
  vertex(centerX+800, centerY-50 -120);
  vertex(centerX+800 - 12, centerY -50-85);
  vertex(centerX+800 + 18, centerY -50-108);
  vertex(centerX+800 - 18, centerY -50-108);
  vertex(centerX+800 + 12, centerY -50-85);
  endShape(CLOSE);

  // block
  fill(blockColor);
  rect(centerX+350, centerY-80, 100, 50);
  
  //cloud
  fill(cloudColor);
  ellipse(centerX+600, centerY-200, 50, 50);
  ellipse(centerX+625, centerY-220, 50, 50);
  ellipse(centerX+650, centerY-220, 50, 50);  
  ellipse(centerX+625, centerY-180, 50, 50);
  ellipse(centerX+650, centerY-180, 50, 50);
  ellipse(centerX+675, centerY-200, 50, 50);
  
  fill(cloudColor);
  ellipse(centerX+1000, centerY-100, 50, 50);
  ellipse(centerX+1025, centerY-120, 50, 50);
  ellipse(centerX+1050, centerY-120, 50, 50);  
  ellipse(centerX+1025, centerY-80, 50, 50);
  ellipse(centerX+1050, centerY-80, 50, 50);
  ellipse(centerX+1075, centerY-100, 50, 50);  
  
  // pipe
  fill(pipeColor);
  rect(centerX+760, centerY, 80, 20);
  rect(centerX+770, centerY, 60, 100);  
  
  
  // limted
  fill(pipeColor);
  rect(centerX+1400, centerY, 10, 600);

  //マリオ色変数
  color capColor = color(217, 22, 4);
  color faceColor = color(245, 177, 116);
  color eyeColor = color(140, 106, 3);

  //Mario's face
  fill(capColor); 
  ellipse(int(x), int(y), 100, 80); //帽子
  rect(int(x+10), int(y), 80, 20); //帽子のつば
  fill(faceColor);
  rect(int(x-40), int(y+20), 90, 50); //顔
  rect(int(x+50), int(y+30), 30, 20); //鼻
  fill(eyeColor);
  rect(int(x+20), int(y+20), 10, 15); //目
  rect(int(x+20), int(y+50), 30, 10); //ひげ
  rect(int(x+25), int(y+40), 10, 20); //ひげ
  rect(int(x-20), int(y+20), 10, 20); //髪たて
  rect(int(x-40), int(y+20), 40, 10); //髪よこ
  rect(int(x-40), int(y+20), 10, 20); //髪うしろ
  
  //Mario's body
  fill(faceColor);
  rect(int(x), int(y+50), 20, 90); //くびのたてぼう
  fill(eyeColor);
  rect(int(x-40), int(y+90), 100, 20); //てのよこぼう
  fill(faceColor);
  rect(int(x-50), int(y+110), 20, 20); //てのたてぼう
  rect(int(x+50), int(y+110), 20, 20); //てのたてぼう
  fill(capColor); 
  rect(int(x-25), int(y+80), 70, 80); //ふく
  fill(eyeColor);
  rect(int(x-20), int(y+160), 20, 20); //あしのたてぼうひだり
  rect(int(x+20), int(y+160), 20, 20); //あしのたてぼうみぎ
  fill(starColor);
  rect(int(x-10), int(y+110), 10, 10); //ぼたんひだり
  rect(int(x+20), int(y+110), 10, 10); //ぼたんみぎ

  //text
  fill(255);
  textSize(40);
  text("press[→][←][↑]", centerX, centerY-200);
  text("GAMEOVER", centerX+1200, centerY-200);

  //左右動き
  if (keyPressed && key == CODED) {
    if (keyCode == LEFT) {
      xSpeed = -3;
    } else if (keyCode == RIGHT) {
      xSpeed = 3;
    }
  }
  x += xSpeed;
  y += ySpeed;
  if (x > width - 11) {
    x = width - 11;
  } else if (x < 0) {
    x = 0;
  }

  //ジャンプ処理
  if (y<300) { //速度が下がる
    ySpeed += 0.1;
  } else { //地面に着いたら速度を0に
    ySpeed = 0;
    y = 300;
  }
}

//ジャンプ
void keyPressed() {
  if (keyCode == UP && y == 300) {
    ySpeed = -5;
  }
}

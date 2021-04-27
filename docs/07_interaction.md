# インタラクション

マウスやキーボードの操作を制御する

## mousePressed
マウスを押したら

```
function setup() {
  createCanvas(500, 500);
  background(255);
  noStroke();
}

function draw() {
  noStroke();
  if (mousePressed == true) {
     // もしマウスを押していたら
    fill(random(255), random(255), random(255), 200);
  } else {
    // マウスを押していないとき
    fill(50, 10);
  }
  circle(mouseX, mouseY, 100);
}
```

### 関数指定
マウスを押した時にこの関数が呼ばれる

```
function mousePressed() {
  background(0);
}

```

&nbsp;
&nbsp;


## keyPressed


キーを押したら

```
function setup() {
  createCanvas(500, 500);
  background(255);
  noStroke();
}

function draw() {
  if (keyPressed == true) {
  // もし（何らかの）キーを押したら
     if(key == 'a'){
       //キーがAだったら
       fill(255,0,0);
     } else if(key == 's'){
       //キーがSだったら
       fill(0,255,0);
     } else if(key == 'd'){
       //キーがDだったら
       fill(0,0,255);
     }    
  } else {
    // キーを押していないとき
    fill(50, 10);
  }
  circle(mouseX, mouseY, 100);
}
```

&nbsp;

### key
どのキーを押したか判定したい場合、キーをシングルコーテーションで挟んで、char型の変数として認識させる

```
if (key == 'c') {
   print("キーボードのcを押しました");
}

```


### 関数指定
いずれかのキーを押した時にこの関数が呼ばれる

```
function keyPressed() {
  if (key == 'c') {
   print("キーボードのcを押しました");
  }
}

```

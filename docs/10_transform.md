# 座標変換

## 原点の移動　
### translate();

初期値では左上がX座標`0` / Y座標`0`で起点となるが、`translate`を使うことで起点を移動することができる


```
createCanvas(500, 500);
background(0);
noStroke();
fill(255, 0, 0);

translate(100, 100);
rect(0, 0, 100, 100);
```

![image](https://yonekura907.github.io/dh17processing/sketch_tra01.png)

&nbsp;
&nbsp;


## 回転

### rotate();

基点で回転する

```
createCanvas(512, 512);
background(0);

noStroke();
fill(255, 0, 0);
rotate(radians(45));
rect(0, 0, 100, 100);
```

![image](https://yonekura907.github.io/dh17processing/sketch_tra02.png)


&nbsp;
&nbsp;


translateで基点を真ん中に移動してから回転する

```
createCanvas(512, 512);
background(0);
noStroke();
fill(255, 0, 0);
translate(width/2, height/2);
rotate(radians(45));
rect(-50, -50, 100, 100);
```

&nbsp;
&nbsp;

### アニメーション

```
let angle = 0;

function setup() {
    createCanvas(512, 512);
}

function draw() {
    background(0);
    noStroke();
    fill(255, 0, 0);
    translate(width/2, height/2);
    rotate(radians(angle));
    rect(-50, -50, 100, 100);
    angle++;
    if(angle>360){
        angle = 0;
    }
}

```

![image](https://yonekura907.github.io/dh17processing/sketch_tra03.png)


&nbsp;
&nbsp;

## 座標保存

### push 

座標の保存

### pop

座標を元に戻す


```
createCanvas(512, 512);
background(0);

noStroke();
fill(255, 0, 0);

push(); // 座標保存
translate(width/2,height/2); // 座標移動
rect(-50, -50, 100, 100);
pop(); // 座標を戻す

// これは影響を受けない
rect(0,0,100,100); 

```

![image](https://yonekura907.github.io/dh17processing/sketch_tra04.png)

&nbsp;
&nbsp;


### 回転アニメーションと静止

```
// 回転の角度
let angle = 0;

function setup() {
    createCanvas(500, 500);
}

function draw() {
    background(0);
    noStroke();
    
    // 青の四角形
    fill(0, 0, 255);
    rectMode(CENTER);
    rect(width/2, height/2, 200, 200);

    push(); // 座標保存
    // 赤の四角形
    fill(255, 0, 0);
    translate(width/2, height/2);
    rotate(radians(angle));
    rect(0, 0, 100, 100);
    pop(); // 座標を元に戻す
    
    // 緑の四角形
    fill(0, 255, 0);
    rect(250, 250, 50, 50);

    // 回転角度を増やす
    angle++;
    if(angle>360){
        angle = 0;
    }
}
```
![image](https://yonekura907.github.io/dh17processing/sketch_tra05.png)

&nbsp;
&nbsp;
&nbsp;
&nbsp;


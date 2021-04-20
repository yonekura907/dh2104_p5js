# Color


### background　背景色

```
background(255);
```

&nbsp;


### stroke 線の色

```
stroke(255,0,0);
```

&nbsp;

#### noStroke 線なし
```
noStroke();
```

&nbsp;

### fill 塗りの色

```
fill(0,0,255);
```

&nbsp;


####  noFill 塗りなし

```
noFill();
```

&nbsp;


&nbsp;

## 基本色の設定

初期値はRGB

`fill(0, 0, 255)` など()の中身が

* 1つなら0〜255までのグレースケール
* 2つなら0〜255までのグレースケール と アルファ値（透明）
* 3つならR(レッド)、G(グリーン)、Y(イエロー) 0〜255
* 4つならR(レッド)、G(グリーン)、Y(イエロー) 0〜255と アルファ値（透明）


```
stroke(255,0,0);
fill(0,0,255);
```

&nbsp;
&nbsp;


## colorMode

colorMode(HSB, 360, 100, 100, 100);

色相、彩度、明度、透明（アルファ）で表現
トーンが固定されるので配色設計しやすい


![image](https://yonekura907.github.io/dh17processing/for01.png)

```
createCanvas(200,200);
background(255);
colorMode(HSB,360,100,100);
noStroke();

for(int x=0; x < 6; x++){
  fill(0, 100, 100);
  rect(5,100,10,10);
  fill(10, 100, 100);
  rect(25,100,10,10);
  fill(20, 100, 100);
  rect(45,100,10,10);
  fill(30, 100, 100);
  rect(65,100,10,10);
  fill(40, 100, 100);
  rect(85,100,10,10);
  fill(50, 100, 100);
  rect(105,100,10,10);
}
```

&nbsp;
&nbsp;
&nbsp;







# p5js と Processingの違い

p5jsはJavaScript言語で記述するのでコードがシンプルですが、Processingから後発な為、参考書籍や資料はProcessingのものが多い。

&nbsp;
&nbsp;

## 記述の違い1: setup と draw

#### p5js

```
//初期設定
function setup() {
  // 最初の1回だけ読み込む
}

//メインループ
function draw() {
  // ここが繰り返される
}

```
&nbsp;
&nbsp;

#### Processing

```
//初期設定
void setup() {
  // 最初の1回だけ読み込む
}

//メインループ
void draw() {
  // ここが繰り返される
}

```

&nbsp;
&nbsp;



## 記述の違い2: createCanvas

`createCanvas()`

#### p5js

```
function setup() {
  createCanvas(500, 500); //キャンバスのサイズ
}

```

&nbsp;
&nbsp;

#### Processing

```
void setup() {
  size(500, 500); //キャンバスのサイズ
}
```

&nbsp;
&nbsp;
&nbsp;
&nbsp;



## 記述の違い3: 変数

#### p5js

変数に型はない。
`let`（古い記述では`var`）

```
let num = 10;

```

&nbsp;
&nbsp;

#### Processing

変数に型がある。
変数に保存するデータには型（タイプ）が存在する

|データ型 | 内容 |
|:-----------|:------------|
| int       | 整数 |
| float     | 浮動小数点型(小数点以下の数字を含む実数) |
| char       | キャラクタ型(一文字の英数字を文字コードで扱うときに使用する) |
| color    | カラー型（色設定のデータを扱う）|
| boolean       | 論理型 |
| byte    | バイト型(8 ビット単位のデジタルデータを使うときに使用する) |


```
int numA; //int型の変数名numAと命名
numA = 100;￼ //numAに数値「100」を保存

float numB;  //float型の変数名numBと命名
numB = 100.5;￼ //numBに数値「100.5」を保存
```

&nbsp;
&nbsp;
&nbsp;
&nbsp;


## 記述の違い4: 関数

#### p5js

関数に型はない。
`function`

```
function update(){
	//処理を記述
}

```

#### Processing

関数に型がある。戻り値がある場合は、関数名の前に型を記述する。戻り値がない場合は関数名の前に`void`と記述する。


```
//int型を返す関数
int addNum(int numA, int numB){
	int result = numA + numB;
	return result;
}

//戻り値がない関数
void update(){
 //処理を記述
}
```

&nbsp;
&nbsp;

## 記述の違い5: 座標保存

#### p5js

##### `push()`

座標の保存

##### `pop()`

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

&nbsp;
&nbsp;

#### Processing

##### `popMatrix()`

座標の保存

##### `pushMatrix()`

座標を元に戻す


```
size(512, 512);
background(0);

noStroke();
fill(255, 0, 0);

pushMatrix(); // 座標保存
translate(width/2,height/2); // 座標移動
rect(-50, -50, 100, 100);
popMatrix(); // 座標を戻す

// これは影響を受けない
rect(0,0,100,100); 
```

&nbsp;
&nbsp;





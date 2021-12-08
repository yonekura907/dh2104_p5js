let img; //画像を保存する変数
let x; //X座標
let y; //Y座標

function preload() {
  // setupよりも先に画像を読み込む
  img = loadImage('dino.png');
}


function setup() {
  createCanvas(windowWidth, windowHeight);
  imageMode(CENTER); //画像の基準値を中央に
  x = width / 2;
  y = height / 2;

}

function draw() {
  background(0);
  image(img, x, y); //イメージの読み込み
  x = x + 2;

  if (x > width) {
    x = 0;
  }
}

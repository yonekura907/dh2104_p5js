// 円の座標
let x;
let y;
// 目的地の座標
let targetX;
let targetY;

const easing = 0.05;

function setup() {
  createCanvas(600, 600);
  noStroke();
  // グローバル変数に初期値を代入
  x = width / 2;
  y = height / 2;
  targetX = width / 2;
  targetY = height / 2;
}

function draw() {
  background(0);

  // 現在の位置と目的地の差分（距離）
  let distanceX = targetX - x;
  let distanceY = targetY - y;

  //現在のX座標に距離を足していく、イージングでスピードに変化を加える
  x = x + distanceX * easing;
  y = y + distanceY * easing;

  //　塗りと円の描画
  fill(255, 0, 0);
  circle(x, y, 40);
}

function mousePressed() {
  targetX = mouseX;
  targetY = mouseY;
}

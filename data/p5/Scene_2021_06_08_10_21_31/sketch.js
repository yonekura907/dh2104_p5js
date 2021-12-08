let scene;
let x;
let y;
let hue;
let radius;
let angle;
let speed;
function setup() {
  createCanvas(windowWidth, windowHeight);
  angleMode(DEGREES);
  hue = 0;
  scene = 0;
  radius = 0;
  angle = 0;
  speed = 30;
}

function draw() {
  background(220);
  noStroke();
  colorMode(HSB, 360, 100, 100);

  if (scene == 1) {
    fill(hue, 100, 100);
    circle(x, height / 2, 400);
    x = x + speed;
  } else if (scene == 2) {
    fill(hue, 100, 100);
    rect(0, y, width, height);
    y = y - speed;
  } else if (scene == 3) {
    noFill();
    strokeWeight(80);
    stroke(hue, 100, 100);
    translate(width / 2, height / 2);
    rotate(angle); //回転
    triangle(
      radius * cos(30),
      radius * sin(30),
      radius * cos(150),
      radius * sin(150),
      radius * cos(270),
      radius * sin(270)
    );
    angle = angle + 2;
    radius = radius + speed;
  }
}
function keyPressed() {
  hue = int(random(360));
  if (keyCode == 65) {
    scene = 1;
    x = -200;
  } else if (keyCode == 83) {
    scene = 2;
    y = height;
  } else if (keyCode == 68) {
    scene = 3;
    radius = 0;
    x = 0;
    y = 0;
  }
  print(scene);
}
function keyReleased() {
  // scene = 0;
  print(scene);
}

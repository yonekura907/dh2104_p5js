let angle;
function setup() {
  createCanvas(600, 600, WEBGL);
  rectMode(CENTER);
  angle = 0;
  debugMode(AXES,1000,0,0,0);
}

function draw() {
  background(220);
  lights();
  orbitControl();
  noStroke();
  fill(0, 255, 0);

  // 回転
  rotateX(radians(angle));
  rotateY(radians(angle));
  // plane(200, 200);
  box(50);
  // translate(0,0,0);
  // sphere(100);

  angle++;
  if (angle > 360) {
    angle = 0;
  }
  print(angle);
}

const NUM = 100;
let x = [];
let y = [];
let z = [];
function setup() {
  createCanvas(windowWidth, windowHeight, WEBGL);
  for (let i = 0; i < NUM; i++) {
    x[i] = random(width * -1, width);
    y[i] = random(height * -1 , height);
    z[i] = i * -10;
  }
}

function draw() {

  background(0);
  stroke(255);
  for (let i = 0; i < NUM; i++) {
    line(x[i], y[i], z[i], x[i], y[i], z[i] - 100);
    z[i] += 20;

    if (z[i] > 0) {
      x[i] = random(width * -1, width);
      y[i] = random(height * -1 , height);
      z[i] = -1000;
    }
  }
}

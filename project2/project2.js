var xspeed = 3;
var yspeed = 3;
var x = 0;
var y = 0;

function setup() {

  createCanvas(600, 400);
}



function draw() {
  background(20);
  fill(51);
  if (x > width || x < 0) {
    xspeed = -xspeed;
  } else if (y > height || y < 0) {
    yspeed = -yspeed;
  }
  x = x + xspeed;
  y = y + yspeed;
  ellipse(x, y, 30, 30);
}
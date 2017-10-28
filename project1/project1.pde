Ball[] balls; //<>//
liquid liquid;
void setup() {

  size(600, 400);
  smooth();
  balls = new Ball[8];
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball();
  }
  liquid = new liquid(0, height/2, width, height/2, 0.1);
}

void draw() {

  background(255);
  liquid.display();
  for (Ball b : balls) {

    if(liquid.contains(b)){
      
      PVector dragForce = liquid.drag(b);
      b.applyForce(dragForce);
      
    }
    
    PVector gravity = new PVector(0, 0.01*b.mass);
    b.applyForce(gravity);
    //PVector wind = new PVector(0.2, 0);
    //b.applyForce(wind);
  

    b.move();
    b.checkEdges();
    b.display();
  }
}
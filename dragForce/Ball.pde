class Ball {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  Ball() {

    location = new PVector(random(width),20);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = random(0.5,4);
  }
  //Newton's 2nd Law
  void applyForce(PVector f) {
    //Copy force to not mess with f for others objects
    PVector force = PVector.div(f, mass);
    acceleration.add(force);
  }

  void move() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

 void checkEdges() {
    if (location.y > height) {
      velocity.y *= -0.9;  // A little dampening when hitting the bottom
      location.y = height;
    }
  }

  void display() {

    stroke(0);
    strokeWeight(2);
    fill(127,100);
    ellipse(location.x, location.y, mass*20, mass*20);
  }
}
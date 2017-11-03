class Rocket{
  
  //Physics stuff
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  //Size
  float r;
  
  
  DNA dna; //The quality that will evolve each generation
  float fitness; //How good it's performing
  
  Rocket(PVector l, DNA dna_, float vo){
    
    dna = dna_;
    acceleration = new PVector(0,0);
    position = l.get();
    velocity = new PVector(vo*cos(dna_.angle),vo*sin(dna_.angle)); //Change the initial velocity acording the random angle
    r = 4;
    
    
  }
  
  void fitness(){
    float d = dist(position.x,position.y,target.x,target.y); //The further away the greater the fitness 
    fitness = pow(1/d,2);
    
  }
  
  public void run(PVector force){
    update();
    display();
    borders();
    applyForce(force);
    
  }
  
  //Euler integration method
  void update(){
    velocity.add(acceleration);
    position.add(velocity);
    //Restore acceleration every frame
    acceleration.mult(0);  
  }
  
  void applyForce(PVector force){
    //Newton's second law (mass = 1)
    acceleration.add(force);
  }
  
  void display(){
    
    float theta = velocity.heading2D() + radians(90); //Changing the angle according where its heading
    fill(127);
    stroke(0);
    pushMatrix(); // Make the translations only valid for this case, dont change other things
    translate(position.x,position.y);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(-r,r*2);
    vertex(0,-r*2);
    vertex(r,r*2);
    endShape();
    popMatrix();
       
  }
  
  void borders(){
 
    if(position.y > height - d){ //If it hits the ground
      position.y = height - d; //Stay on the floor
      acceleration.setMag(0); //Stop
      velocity.setMag(0); //Stop
    }
    
    
    
  }
  
  
  
  
  
  
  
}
class DNA{
  
  
  //The only thing that will evolve is the initial angle at which is thrown
  float angle;
  
  DNA(){
    //Pick a random angle to cover all posibilities
    angle = random(-PI/2);
  
      
  }
  
  //I get the average of the parent's angle, there may be a smarter way of doing this
  DNA crossover(DNA partner){
    
    DNA child  = new DNA();
    
    float angle1 = partner.angle;
    float angle2 = this.angle;
    float averageAngle = (angle1 + angle2)/2;
    
    child.angle = averageAngle;
    
    return child;
    
  }
  
  void mutate(float mutationRate){
    
    //If it mutates, then change the angle to a random angle for greater variety
    if(random(1) < mutationRate){
      angle = random(-PI/2);
    }  
    
  }
  
  
  
  
  
  
  
  
  
}
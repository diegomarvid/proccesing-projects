class liquid{
  
  float x;
  float y;
  float w;
  float h;
  float c;
  
  liquid(float x_, float y_, float w_, float h_, float c_){
    
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c = c_;
    
  }
  
  PVector drag(Ball b){
    float speed = b.velocity.mag();
    float dragMagnitude = c * speed * speed;
    
    PVector dragForce = b.velocity.get();
    dragForce.mult(-1);
    
    dragForce.normalize();
    dragForce.mult(dragMagnitude);
    return dragForce;
    
    
  }
  
  void display(){
    
    noStroke();
    fill(51,100);
    rect(x, y, w, h);
    
  }
  
  boolean contains(Ball m) {
    PVector l = m.location;
    return l.x > x && l.x < x + w && l.y > y && l.y < y + h;
  }
  
  
  
  
  
  
  
  
  
  
}
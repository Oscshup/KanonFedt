class Shot {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector target;
  float diaX;
  float diaY;
  color c;
  float angleStart;
  float velStart;
  float mass;
  
  Shot(float x_, float y_, float dia_, color c_, float targetX_, float targetY_, float mass_){
    location = new PVector(x_, y_);
    target = new PVector(targetX_, targetY_);
    angleStart = atan2(target.y-location.y, target.x-location.x);
    println(angleStart);
    PVector tempVel = PVector.sub(target, location);
    velStart = map(tempVel.mag(), -width, width, -20, 20);
    float VelX = velStart * cos(angleStart);
    float VelY = velStart * sin(angleStart);
    velocity = new PVector(VelX, VelY);
    mass = mass_; 
    acceleration = new PVector(0,0);
    diaX = dia_;
    diaY = dia_;
    c = c_;
  }
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void applyForce(PVector force){
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  void display(){
    stroke(0);
    strokeWeight(1);
    fill(c);
    ellipse(location.x, location.y, diaX, diaY);
  }
  
  void hit(){
    velocity.mult(0);
    diaY-=2;
    if(diaY <= diaX*7/8){
      explode();
    }
  }
  
  void explode(){
    println("Exploded");
    soundEffect();
    shotActive = false;
  }
  
  void soundEffect(){
  
  
  }
  
  void checkEdges(){
    if(location.x > width-diaX/2){
      location.x = width-diaX/2;
      velocity.x*=-1;
    } else if (location.x < diaX/2){
      location.x = diaX/2;
      velocity.x*=-1;
    } 
    if(location.y > height-diaY/2){
      location.y = height-diaY/2;
      hit();
    } 
  }
  
}

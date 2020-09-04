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
  int sequence = 0;
  boolean explosionActive = false;


  // For explosion animation
  int redOpacity;
  float diaExplosion;
  float diaExplChange;

  Shot(float x_, float y_, float dia_, color c_, float targetX_, float targetY_, float mass_) {
    location = new PVector(x_, y_);
    target = new PVector(targetX_, targetY_);
    angleStart = atan2(target.y-location.y, target.x-location.x);
    PVector tempVel = PVector.sub(target, location);
    velStart = map(tempVel.mag(), -width, width, -20, 20);
    float VelX = velStart * cos(angleStart);
    float VelY = velStart * sin(angleStart);
    velocity = new PVector(VelX, VelY);
    mass = mass_; 
    acceleration = new PVector(0, 0);
    diaX = dia_;
    diaY = dia_;
    c = c_;
    redOpacity = 255;
    diaExplosion = dia_;
    diaExplChange = 0.5;
  }

  void update() {
    if (explosionActive == false) {
      velocity.add(acceleration);
    }
    location.add(velocity);
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void display() {
    stroke(0);
    strokeWeight(1);
    fill(c);
    ellipse(location.x, location.y, diaX, diaY);
  }

  void hit() {
    velocity.mult(0);
    explosionActive = true;
    soundEffect();
  }

  void explode() {
    color orange = color(255, 60, 0, redOpacity);
    fill(orange);
    noStroke();
    ellipse(location.x, location.y, diaExplosion, diaExplosion);
    diaExplosion+=diaExplChange/2;
    diaExplChange+=0.001;
    redOpacity-=4;
    if (redOpacity <= 0) {
      explosionActive = false;
      shotActive = false;
    }
  }

  void soundEffect() {
  }


  void checkEdges() {
    if (location.x > width-diaX/2) {
      location.x = width-diaX/2;
      velocity.x*=-1;
    } else if (location.x < diaX/2) {
      location.x = diaX/2;
      velocity.x*=-1;
    } 
    if (location.y > height-diaY/2) {
      location.y = height-diaY/2;
      hit();
    }
  }
}

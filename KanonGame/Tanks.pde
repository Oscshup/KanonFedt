class Tank {
  float x,y;
  float r;
  
  
  Tank(float posX, float posY, float r_){
  x = posX;
  y = posY;
  r = r_;
  
  }

  void display() {
    stroke(0);
    fill(200,100,150);
    rectMode(CENTER);
    rect(x, y, r, r, 100, 100, 0, 0);
    
  }
  
  
  
}

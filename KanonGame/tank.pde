class Tank {
  float r;

  PVector location;
  int i = 0; 




  Tank(float x, float y, float r_) {
    location = new PVector(x, y);
    location = new PVector(x, y);
    r = r_;
  }

  void display() {
    stroke(0);
    strokeWeight(3);
    fill(200, 100, 150);
    rectMode(CENTER);
    rect(location.x, location.y, r, r, 100, 100, 0, 0);
  }


  void move() {
    if (keyPressed) { 
      if (key == 'A' || key == 'a') {
        location.x -= 1;
      }
      if (key == 'D' || key == 'd') {
        location.x += 1;
      }
    }
  }
}

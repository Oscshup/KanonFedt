class Tank {
  float r;
  PImage tank;
  PImage ror;
  PVector location;
  int i = 0; 
  int dir = 1;




  Tank(float x, float y, float r_) {
    location = new PVector(x, y);
    r = r_;
  }

  void display() {
    // rectMode(CENTER);
    pushMatrix();
    translate(location.x+53, location.y+6.6);
    float angleStart = atan2(mouseY-location.y-6.6, mouseX-location.x-53);
    rotate(angleStart);
    fill(129, 128, 120);
    rect(0, 0, 46, 10);
    popMatrix();

    tank = loadImage("tank.png");
    noStroke();
    noFill();

    rect(location.x, location.y, r*2, r);
    tank.resize(int(r*2), int(r));
    image(tank, location.x, location.y);
  }


  void move() {
    if (keyPressed) { 
      if (key == 'A' || key == 'a') {
        location.x -= 1;
        i--;
        dir = 1;
      }
      if (key == 'D' || key == 'd') {
        location.x += 1;
        i++;
        dir = -1;
      }
      println(i);
    }
  }
  
}

class Tank {
  float r;
  PImage tank;
  PImage ror;
  PVector location;
  PVector velocity;
  int i = 0; 
  int dir = 1;




  Tank(float x, float y, float r_) {
    location = new PVector(x, y);
    r = r_;
  }

  void display() {
    // rectMode(CENTER);
    ror = loadImage("ror.png");
    pushMatrix();
    translate(location.x+50, location.y+5);
    float angleStart = constrain(atan2(mouseY-location.y-5, mouseX-location.x-50),-PI,0);
    rotate(angleStart);

  println(angleStart);
    ror.resize(75, 5);
    image(ror, 0, 0);

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

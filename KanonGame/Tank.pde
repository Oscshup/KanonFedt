class Tank {
  float r;
  PImage tank;
  PImage ror;
  PVector location;
  int i = 0;
  int dir = 1;
  float angleStart = 0;
  int rorLength = 75;
  float offX;
  float offY;
  float yTop;
  int id;

  Tank(float x, float y, float r_, float offX_, float offY_, int id_) {
    location = new PVector(x, y);
    yTop = y;
    r = r_;
    offX = offX_;
    offY = offY_;
    id = id_;
  }

  void display() {
    // rectMode(CENTER);
    ror = loadImage("ror.png");
    pushMatrix();
    translate(location.x, location.y);
    rotate(hill.diffFloorFunction(location.x));
    pushMatrix();
    angleStart = constrain(atan2(mouseY-location.y, mouseX-location.x), -PI, 0);
    rotate(angleStart-hill.diffFloorFunction(location.x));

    ror.resize(rorLength, 5);
    image(ror, 0, 0);

    popMatrix();

    tank = loadImage("tank.png");
    noStroke();
    noFill();


    //rect(-offX, -offY, r*2, r);
    tank.resize(int(r*2), int(r));
    image(tank, -offX, -offY);
    popMatrix();
  }

  float rotation() {
    float angle = atan2(location.x, hill.diffFloorFunction(location.x));
    return angle;
  }

  void move() {
    if (keyPressed) {
      if (key == 'A' || key == 'a') {
        if (id == 2) {
          if (location.x-1 > (id-1)*width/2+r*id*7/9) {
            location.x -= 1;
            println(location.x);
            i--;
            dir = 1;
          }
        } else {
          if (location.x-1 > r/2) {
            location.x -= 1;
            println(location.x);
            i--;
            dir = 1;
          }
        }
      }
      if (key == 'D' || key == 'd') {
        if (id == 2) {
          if (location.x+1 < id*width/2-r/2) {
            location.x += 1;
            println(location.x);
            i++;
            dir = -1;
          }
        } else {
          if (location.x+1 < id*width/2-r*3/2) {
            location.x += 1;
            println(location.x);
            i++;
            dir = -1;
          }
        }
      }
    }
    location.y=hill.floorFunction(location.x)-tankOffY;
  }
}

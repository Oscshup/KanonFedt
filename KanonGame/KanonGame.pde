//Background background;
Shot s;
Hill hill;
Pillar p;
int player = 2;
Tank[] tank = new Tank[player];

int turn = 1;

// Skal udskiftes med lokation af rørets ende.
float xTemp;
float yTemp;
color orange = color(255, 154, 0);
float massShot = 10;
float tankOffY;

boolean shotActive = false;

void setup() {
  size(1200, 700);
  //background = new Background();
  hill = new Hill();
  p = new Pillar();
  for (int i = 0; i < tank.length; i++) {
    float offXTemp = 50;
    float offYTemp = 5;
    tankOffY = 50;
    xTemp = width*i+width/6-2*i*width/6;
    yTemp = hill.floorFunction(xTemp)-tankOffY;
    tank[i] = new Tank(xTemp, yTemp, 56, offXTemp, offYTemp, i+1);
  }
}

void draw() {
  background(0, 50, 180);
  //background.display();
  hill.display();
  p.display();

  if (shotActive == true) {
    PVector gravityShot = new PVector(0, 0.2*massShot);
    s.applyForce(gravityShot);
    s.update();
    if (p.collideBall(s) == true) {
      s.hit();
    }
    if (s.explosionActive == true) {
      s.explode();
    } else {
      s.display();
    }
    s.checkEdges();
  }

  for (Tank t : tank) {
    t.display();
  }
  if (shotActive == false) {
    tank[turn-1].move();
  }
}

void mouseClicked() {
  if (shotActive == false) {

    xTemp = tank[turn-1].location.x+cos(tank[turn-1].angleStart)*tank[turn-1].rorLength;
    yTemp = tank[turn-1].location.y+sin(tank[turn-1].angleStart)*tank[turn-1].rorLength;
    s = new Shot(xTemp, yTemp, 15, orange, mouseX, mouseY, massShot);
    shotActive = true;
  }
}

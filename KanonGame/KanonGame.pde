Background background;
Shot s;

// Skal udskiftes med lokation af rørets ende.
float xTemp;
float yTemp;
color orange = color(255, 154, 0);
float massShot = 10;

boolean shotActive = false;

void setup() {
  size(700, 700);
  background = new Background();
  xTemp = 100;
  yTemp = height-100;
}

void draw() {
  background.display();
  
  if (shotActive == true) {
    PVector gravityShot = new PVector(0, 0.2*massShot);
    s.applyForce(gravityShot);
    s.update();
    if (s.explosionActive == true) {
      s.explode();
    } else {
      s.display();
    }
    s.checkEdges();
  }
}

void mouseClicked() {
  if (shotActive == false) {
    s = new Shot(xTemp, yTemp, 30, orange, mouseX, mouseY, massShot);
    shotActive = true;
  }
}

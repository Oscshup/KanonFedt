//variable

Background background;
Shot s;

int player = 2;

// Skal udskiftes med lokation af rørets ende.
float xTemp;
float yTemp;
color orange = color(255, 154, 0);
float massShot = 10;

boolean shotActive = false;

Tank[] tank = new Tank[player];
Hill hill;


void setup() {
  size(700, 700);
  background = new Background();
  xTemp = 100;
  yTemp = height-100;

  for (int i = 0; i < player; i++) {
    tank[i] = new Tank(random(200), random(200), 40);
  }

  hill = new Hill(width/2, height, 350);
}



void draw() {
  background.display();
  hill.display();
  
  if (shotActive == true) {
    PVector gravityShot = new PVector(0, 0.2*massShot);
    println(gravityShot);
    s.applyForce(gravityShot);
    s.update();
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
  
}

void mouseClicked() {
   if (shotActive == false) {
    s = new Shot(xTemp, yTemp, 30, orange, mouseX, mouseY, massShot);
    shotActive = true;
  }
}

<<<<<<< Updated upstream
//variable

Background background;
Shot s;

int player = 1;

// Skal udskiftes med lokation af rørets ende.
float xTemp;
float yTemp;
color orange = color(255, 154, 0);
float massShot = 10;

boolean shotActive = false;

Tank[] tank = new Tank[player];
Hill hill;


void setup() {
  background = new Background(); 
  size(960, 540);
//  background = new Background();
  xTemp = 100;
  yTemp = height-100;

  for (int i = 0; i < player; i++) {
    tank[i] = new Tank(100, 100,56);
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
    t.move();
  }
}

void mouseClicked() {
  if (shotActive == false) {
    s = new Shot(xTemp, yTemp, 30, orange, mouseX, mouseY, massShot);
    shotActive = true;
  }
}
=======
import processing.sound.*;
SoundFile sound;
//Background background;
Shot s;
Hill hill;
Pillar p;
int player = 1;
Tank[] tank = new Tank[player];

// Skal udskiftes med lokation af rørets ende.
float xTemp;
float yTemp;
color orange = color(255, 154, 0);
float massShot = 10;

boolean shotActive = false;

void setup(){
  size(960, 640);
  //background = new Background();
  sound = new SoundFile(this,"Boom.mp3");
  hill = new Hill();
  p = new Pillar();
  for(int i = 0; i < tank.length; i++){
    tank[i] = new Tank(100,500,56);
  }
}

void draw() {
  background(0,50,180);
  //background.display();
  hill.display();
  p.display();
  
  if (shotActive == true) {
    PVector gravityShot = new PVector(0, 0.2*massShot);
    s.applyForce(gravityShot);
    s.update();
    if(p.collideBall(s) == true){
      s.hit();     
    }
    if (s.explosionActive == true) {
      s.explode();
    } else {
      s.display();
    }
    s.checkEdges();
  }
  
  for(Tank t : tank){
    t.display();
    t.move();
  }
}

void mouseClicked() {
  if (shotActive == false) {
    xTemp = tank[player-1].location.x+50+cos(tank[player-1].angleStart)*tank[player-1].rorLength;
    yTemp = tank[player-1].location.y+5+sin(tank[player-1].angleStart)*tank[player-1].rorLength;
    s = new Shot(xTemp, yTemp, 30, orange, mouseX, mouseY, massShot);
    shotActive = true;
  }
}
>>>>>>> Stashed changes

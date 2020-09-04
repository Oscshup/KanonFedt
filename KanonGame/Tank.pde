class Tank {
  float r;
  PImage tank;
  PImage ror;
  PVector location;
  PVector velocity;
  int i = 0; 
  int dir = 1;
  float angleStart = 0;
  int rorLength = 75;
  float offX;
  float offY;
  //variable to the Healthbar
  int maxHealth = 100;
  float health = 100;
  float healthDecrease = 10;
  int healthBarWidth = 60;

  Tank(float x, float y, float r_, float offX_, float offY_) {
    location = new PVector(x, y);
    r = r_;
    offX = offX_;
    offY = offY_;
  }

  void display() {
    // rectMode(CENTER);
    ror = loadImage("ror.png");
    pushMatrix();
    translate(location.x, location.y);
    angleStart = constrain(atan2(mouseY-location.y-5, mouseX-location.x-50), -PI, 0);
    rotate(angleStart);

    ror.resize(rorLength, 5);
    image(ror, 0, 0);

    popMatrix();

    tank = loadImage("tank.png");
    noStroke();
    noFill();


    rect(location.x-offX, location.y-offY, r*2, r);
    tank.resize(int(r*2), int(r));
    image(tank, location.x-offX, location.y-offY);
  }

  void rotater() {
    fill(0);
    ellipse(location.x, location.y, 20, 20);
    float angle = atan2(location.x, hill.diffFloorFunction(location.x));
    //println(angle);
  }

  void health() {
    noStroke();
    fill(0, 255, 0);
    rectMode(CORNER);
    rect(location.x-(healthBarWidth/2), location.y - 30, healthBarWidth, 5);
    if (health > 60) {
      fill(46, 204, 113);
    } else if (health > 30) {
      fill(230, 126, 34);
    } else {
      fill(231, 76, 60);
    }
    rectMode(CORNER);
    rect(location.x-(healthBarWidth/2), location.y - 30, healthBarWidth*(health/maxHealth), 5);
  }


  void decreaseHealth() {
    if ((s.location.x+(s.d/2)>location.x) && 
      (s.location.x-(s.d/2)<location.x) &&
      (s.location.y+(s.d/2)>location.y) &&
      (s.location.y-(s.d/2)<location.y)
      ) {
      decreaseHealth();
    }


    health -= healthDecrease;
    if (health <= 0) {
      gameOverScreen();
    }
  }

  void gameOverScreen() {
    background(0);
    textAlign(CENTER);
    fill(255);
    textSize(30);
    text("Game Over", height/2, width/2 - 20);
    textSize(15);
    text("Click to Restart", height/2, width/2 + 10);
  }



  void move() {
    rotater();
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
    }
  }
}

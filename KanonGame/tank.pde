<<<<<<< Updated upstream:KanonGame/Tank.pde
class Tank {
  float r;
  PImage tank;
  PImage ror;
  PVector location;
  float velocity = 1;
  int fuel = 200;
  int dir = 1;
  float angleStart = 0;
  int rorLength = 75;
  float offX;
  float offY;
  float yTop;
  int id;

  float health = 100;
  float maxHealth = 100;
  float healthDecrease = 0;
  int healthBarWidth = 60;
  boolean dead = false;

  Tank(float x, float y, float r_, float offX_, float offY_, int id_) {
    location = new PVector(x, y);
    yTop = y;
    r = r_;
    offX = offX_;
    offY = offY_;
    id = id_;
  }

  void display() {
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
    strokeWeight(2);
    noFill();

    rectMode(CORNER);
    rect(-offX, -offY, r*2, r);
    tank.resize(int(r*2), int(r));
    image(tank, -offX, -offY);
    popMatrix();
  }
  
  void health() {
    noStroke();
    fill(255, 100);
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
    rect(location.x-(healthBarWidth/2), location.y-30, healthBarWidth*(health/maxHealth), 5);
  }

  void decreaseHealth() {
    health -= healthDecrease;
    if (health <= 0) {
      screen.gameOverScreen();
      dead = true;
    }
  }

  float rotation() {
    float angle = atan2(location.x, hill.diffFloorFunction(location.x));
    return angle;
  }

  void move() {
    if (keyPressed) {
      if (key == 'A' || key == 'a') {
        if (id == 2) {
          if (location.x-velocity > (id-1)*width/2+r*id*7/9) {
            location.x -= velocity;
            fuel--;
            dir = 1;
          }
        } else {
          if (location.x-velocity > r/2) {
            location.x -= velocity;
            fuel--;
            dir = 1;
          }
        }
      }
      if (key == 'D' || key == 'd') {
        if (id == 2) {
          if (location.x+velocity < id*width/2-r/2) {
            location.x += velocity;
            fuel--;
            dir = -1;
          }
        } else {
          if (location.x+velocity < id*width/2-r*3/2) {
            location.x += velocity;
            println(location.x);
            fuel--;
            dir = -1;
          }
        }
      }
      if (fuel <= 0) {
        velocity = 0;
      } else {
        velocity = 1;
      }
    }
    location.y=hill.floorFunction(location.x)-tankOffY;
  }

  void fuelGuage() {
    fill(57, 255, 20);
    rectMode(CORNER);

    rect(location.x-100, location.y-20, 20, 50);
    fill(255);
    rect(location.x-100, location.y-20, 20, 50-(constrain(fuel, 0, 200)/4));
  }
}
=======
class Tank {
  float r;
  PImage tank;
  PImage ror; 
  PVector location;
  float velocity = 1;
  int fuel = 200; // Bestemmer hvor langt tanken kan køre på en tur.
  float angleStart = 0; // Hældning af røret af vandret jord.
  int rorLength = 75;
  float offX;
  float offY;
  float yTop;
  int id; 

  float health = 100;
  float maxHealth = 100;
  int healthBarWidth = 60;
  boolean dead = false; 

  Tank(float x, float y, float r_, float offX_, float offY_, int id_) {
    location = new PVector(x, y); // Tankens lokation
    yTop = y;
    r = r_; // Bruges til tankens hitbox
    
    // Billedet af tanken er en smule forskudt i forhold til billedets lokation i koordianter.
    offX = offX_;
    offY = offY_;
    
    id = id_;
  }

  void display() {
    pushMatrix();
    // Lokation og rotation af tanken i forhold til jordens hældning
    translate(location.x, location.y);
    rotate(hill.diffFloorFunction(location.x));
    pushMatrix();
    // Tankens kanon som roterer efter musen
    angleStart = constrain(atan2(mouseY-location.y, mouseX-location.x), -PI, 0);
    rotate(angleStart-hill.diffFloorFunction(location.x));
    ror = loadImage("ror.png");
    ror.resize(rorLength, 5);
    image(ror, 0, 0);

    popMatrix();
    rectMode(CORNER);
    
    //rect(-offX, -offY, r*2, r); // Tankens hitbox for kuglerne
    // Billede af tanken
    tank = loadImage("tank.png");
    tank.resize(int(r*2), int(r));
    image(tank, -offX, -offY);
    popMatrix();
  }

  void health() { // Denne funktion tegner health-barerne
    noStroke();
    fill(255, 100);
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
    rect(location.x-(healthBarWidth/2), location.y-30, healthBarWidth*(health/maxHealth), 5);
  }
  
// Denne funktion giver skade til tanks når de rammes
// Når tanken har 0 liv slutter spillet og man kan starte forfra.
  void decreaseHealth(float healthDecrease) { 
    health -= healthDecrease;
    if (health <= 0) {
      screen.gameScreen = 2;
      screen.gameOverScreen();
      dead = true;
    }
  }

// Denne funktion sørger for at tanken kan bevæge sig, men kun indenfor
// sin halvdel, og kun hvis den har noget fuel tilbage.
// Man kan bevæge sig til venstre med 'a' og højre med 'd'.
  void move() { 
    if (keyPressed) {
      if (key == 'A' || key == 'a') {
        if (id == 2) {
          if (location.x-velocity > (id-1)*width/2+r*id*7/9) {
            location.x -= velocity;
            fuel--;
          }
        } else {
          if (location.x-velocity > r/2) {
            location.x -= velocity;
            fuel--;
          }
        }
      }
      if (key == 'D' || key == 'd') {
        if (id == 2) {
          if (location.x+velocity < id*width/2-r/2) {
            location.x += velocity;
            fuel--;
          }
        } else {
          if (location.x+velocity < id*width/2-r*3/2) {
            location.x += velocity;
            println(location.x);
            fuel--;
          }
        }
      }
      if (fuel <= 0) {
        velocity = 0;
      } else {
        velocity = 1;
      }
    }
    
    // Her bestemmes tankens lokation ad y-aksen i forhold til jordens højde.
    location.y=hill.floorFunction(location.x)-tankOffY;
  }
  
  // Her tegnes tankens fuel-tank
  void fuelGuage() {
    fill(57, 255, 20);
    rectMode(CORNER);

    rect(location.x-100, location.y-20, 20, 50);
    fill(255);
    rect(location.x-100, location.y-20, 20, 50-(constrain(fuel, 0, 200)/4));
  }
}
>>>>>>> Stashed changes:Tank.pde

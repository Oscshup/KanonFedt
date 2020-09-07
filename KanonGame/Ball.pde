class Shot {

  PVector location; // Skuddets lokation
  PVector velocity; // Skuddets hastighed
  PVector acceleration; // Skuddets acceleration
  PVector target; // Musens lokation
  float dia; // Skuddets diameter
  color c; // Skuddets farve 
  float angleStart; // Skuddets startvinkel
  float velStart; // Skuddets starthastighed
  float mass; // Skuddets masse
  boolean explosionActive = false; // Siger om et skud har ramt noget.
  float topSpeed = 40; // Sætter maxhastigheden for et skud
  float damage = 20; // Bestemmer skaden som et skud gør mod en tank.

  // For explosions-animation
  int redOpacity;
  float diaExplosion; // Bestemmer diameteren af eksplosionen
  float diaExplChange; // Bestemmer ændringer i eksplosionens diameter.

  Shot(float x_, float y_, float dia_, color c_, float targetX_, float targetY_, float mass_) {
    location = new PVector(x_, y_);
    target = new PVector(targetX_, targetY_);
    angleStart = atan2(target.y-location.y, target.x-location.x);
    PVector tempVel = PVector.sub(target, location); // Bruges til udregning af starthastighed
    velStart = map(tempVel.mag(), -width, width, -topSpeed, topSpeed);
    float VelX = velStart * cos(angleStart); // Hastighed ad x-aksen
    float VelY = velStart * sin(angleStart); // Hastighed ad y-aksen
    velocity = new PVector(VelX, VelY); 
    mass = mass_;
    acceleration = new PVector(0, 0);
    dia = dia_;
    c = c_;
    redOpacity = 255;
    diaExplosion = dia_;
    diaExplChange = 0.5;
  }

  void update() {
    if (explosionActive == false) {
      // Hvis skuddet rammer søjlen i midten eksploderer det.
      if(location.y >= hill.floorFunction(location.x) || (location.x < width/2+p.w/2 && location.x > width/2-p.w/2 && location.y > height/2)){
        hit();
      }
      velocity.add(acceleration); // Tilføjer tyngdekraft på skuddet.
    }
    location.add(velocity);
    acceleration.mult(0);
  }

  // Tilføjer kræfter på skuddet.
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  // Viser skuddet
  void display() {
    stroke(0);
    strokeWeight(1);
    fill(c);
    ellipse(location.x, location.y, dia, dia);
  }
  
  // Starter eksplosion viser skuddet rammer noget.
  void hit() {
    velocity.mult(0);
    explosionActive = true;
  }
  
  // Her tjekkes for kollision mellem skuddet og tanksene
  boolean hitTank(float rX, float rY, float rW, float rH, int id) {
    float testX = location.x;
    float testY = location.y;

    if (id != turn) { // Hvis kollision er med modstanderens tank
    
      // Her finder jeg de to tætteste sider af tankens hitbox for skuddet.
      if (location.x < rX) {
        testX = rX; 
      } else if (location.x > rX+rW) {
        testX = rX+rW;
      }
      if (location.y < rY) {
        testY = rY;
      } else if (location.y > rY+rH) {
        testY = rY+rH;
      }
      
      // Her beregnes afstanden mellem kuglen og det tætteste punkt på rektanglet
      float distX = location.x-testX;
      float distY = location.y-testY;
      float distance = sqrt((distX*distX) + (distY*distY));
      
      // Hvis afstanden er mindre end skuddets radius har skuddet ramt en tank
      if (distance <= dia/2) {
        return true;
      }
    }
    return false;
  }

  void explode() {
    color orange = color(255, 60, 0, redOpacity); // Farven af eksplosionen
    fill(orange);
    noStroke();
    ellipse(location.x, location.y, diaExplosion, diaExplosion);
    diaExplosion+=diaExplChange/2;
    diaExplChange+=0.001;
    redOpacity-=4;
    if (redOpacity <= 0) {
      explosionActive = false;
      shotActive = false;
      // Efter eksplosion skifter turen og tankens gastank fyldes op
      if (turn == 1) {
        turn = 2;
        tank[turn-1].fuel = 200;
      } else {
        turn = 1;
        tank[turn-1].fuel = 200;
      }
    }
  }

  void checkEdges() {
    // Skuddet kan bounce på væggene
    if (location.x > width-dia/2) {
      location.x = width-dia/2;
      velocity.x*=-1;
    } else if (location.x < dia/2) {
      location.x = dia/2;
      velocity.x*=-1;
    }
    // Hvis skuddet rammer jorden skal det eksploderer
    for (int i = 0; i < width; i++) {
      float dis = dist(i, hill.floorFunction(i), location.x, location.y);
      if (dis < dia/2) {
        hit();
      }
    }
  }
}

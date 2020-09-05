// Denne class styrer hvilke dele af spillet som bliver vist på skærmen.

class Screen {
  int gameScreen = 0; // Styrer hvilken skærm der vises

  void display() {
    if (gameScreen == 0) {
      initScreen(); // Startskærmen før kampen begynder
    } else if (gameScreen == 1) {
      gameScreen(); // Skærmen som vises når kampen er igang
    } else if (gameScreen == 2) {
      gameOverScreen(); // Slutskærm efter en spiller er død
    }
  }

  void initScreen() { // Startskærm
    background(255);
    textAlign(CENTER);
    fill(0);
    textSize(30);
    text("TankWar", width/2, height/2 - 20);
    textSize(15);
    text("Click to Start", width/2, height/2 + 10);
  }

  void gameScreen() { // Spilskærm
    background(0, 50, 180);
    hill.display(); // Viser jorden
    p.display(); // Viser søjlen i midten
    
    // Viser teksten oppe i midten af skærmen, som siger hvis tur det er.
    String turnText = "Player " + turn + "'s turn"; 
    textSize(40);
    textAlign(CENTER);
    text(turnText, width/2, 100);
    
    // Viser skuddet og beregner om der er kollision med noget.
    if (shotActive == true) { // Funktionerne startes kun hvis der er affyret et skud.
      // Tyngdekraft
      PVector gravityShot = new PVector(0, 0.2*massShot);
      s.applyForce(gravityShot);
      s.update();      
      
      // Dette if-statement checker om der er kollision med en tank
      // Hvis der er, så skader den tanken
      if (lastTurnHit != turnsTotal) { // Man kan kun ramme modstanderens tank.
        for (Tank t : tank) {
          // Her køres funktionen som beregner om der er kollision
          if (s.hitTank(t.location.x-t.offX, t.location.y-t.offY, 2*t.r, t.r, t.id) == true) {
            lastTurnHit = turnsTotal; 
            t.decreaseHealth(s.damage); // Skader tanken
            s.hit(); // Fortæller skuddet at det har ramt noget.
          }
        }
      }
      // Hvis kuglen har ramt noget starter eksplosionen
      if (s.explosionActive == true) {
        s.explode();
      } else { // Ellers fortsætter skuddet som normalt
        s.display();
      }
      s.checkEdges(); // Her gøres så skuddet kan bounce på væggene.
    }

    for (Tank t : tank) {
      t.display(); // Her vises tanksene
      t.health(); // Her vises tanksenes health-barer
      t.fuelGuage(); // Her vises tanksenes gastanke
    }
    
    // Hvis der ikke er et skud igang kan tanken, hvis tur det er, køre
    if (shotActive == false) {
      tank[turn-1].move();
    }
  }
  
  // Game-over-skærm til efter en spiller har tabt
  void gameOverScreen() {
    background(0);
    textAlign(CENTER);
    fill(255);
    textSize(30);
    text("Game Over", width/2, height/2 - 20);
    textSize(15);
    text("Click to Restart", width/2, height/2 + 10);
  }

// Denne funktion starter spillet.
  void startGame() {
    gameScreen=1;
    start = false;
  }

// Denne funktion går til startskærmen efter man er gået videre fra Game-over-skærmen
  void restart() {
    Start();
  }
}

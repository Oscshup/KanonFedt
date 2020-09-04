class Screen {
  int gameScreen = 0;

  void display() {
    // Display the contents of the current screen
    if (gameScreen == 0) {
      initScreen();
    } else if (gameScreen == 1) {
      gameScreen();
    } else if (gameScreen == 2) {
      gameOverScreen();
    }
  }

  void initScreen() {
    background(255);
    textAlign(CENTER);
    fill(0);
    textSize(30);
    text("TankWar", height/2, width/2 - 20);
    textSize(15);
    text("Click to Start", height/2, width/2 + 10);
  }
  
  void gameScreen() {
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
      t.move();
      t.health();
      t.decreaseHealth();
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


  void startGame() {
    gameScreen=1;
  }
  
  void restart() {
   println("ge");
   /*for(Tank t: tank){
   t.
   }
   start = true;
   gameScreen = 0;*/
   Start();
  }
}

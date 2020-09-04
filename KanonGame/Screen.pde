class Screen {
  int gameScreen = 0;


  void StartGame() {
    // if we are on the initial screen when clicked, start the game
    if (gameScreen==0) {
      startGame();
    }

    if (gameScreen==2) {
      restart();
    }
  }

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
    // codes of initial screen
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
    //health = maxHealth;
    screen.gameScreen = 1;
  }
}

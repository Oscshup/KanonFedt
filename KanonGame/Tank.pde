class Tank {
  PVector location;
  int i = 0; 

  Tank(float x, float y) {
    location = new PVector(x, y);
  }


  void display() {
    rectMode(CENTER);
    rect(location.x, location.y, 50, 20);
  }

  void move() {
    if (keyPressed) { 
      if (key == 'A' || key == 'a') {
        i++;
        println(i);
      }
    }
  }
}

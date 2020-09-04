class Hill {
  PVector location;
  float r;

  float angle = 0;
  float angleVel = 0.3;



  Hill(float x, float y, float r_) {
    location = new PVector(x, y);
    r = r_;
  }


  void display() {
    stroke(0);
    strokeWeight(2);
    noFill();
    beginShape();
    for (int x = 0; x <= width; x += 20) {
      float y = map(sin(angle), -1, 1, height-100, height+20);
      vertex(x, y);
      angle +=angleVel;
    }
    angle = 0;
    endShape();
  }
}

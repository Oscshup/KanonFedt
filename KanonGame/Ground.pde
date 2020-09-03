class Hill {
  PVector location;
  float r;
  float a = 0.0;
  float inc = TWO_PI/25.0;



  Hill(float x, float y, float r_) {
    location = new PVector(x, y);
    r = r_;
  }


  void display() {
    stroke(4);
    for (int i = 0; i < 100; i=i+4) {
      stroke(i, 50, i, sin(a));
      a = a + inc;
    }
  }
}

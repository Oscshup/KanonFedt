class Hill {
  Hill() {
  }

  float floorFunction(float x) {
    float angularVelocity = (2*3*PI)/width;
    float amplitude = width/20;
    float faseShift = PI/2;
    float y = height-50+amplitude*sin(angularVelocity*x+faseShift);
    return y;
  }

  void display() {
    fill(150, 70, 30);
    noStroke();
    rectMode(CORNER);
    for (int x =0; x <= width; x += 1) {

      rect(x, floorFunction(x), 1, height-floorFunction(x));
    }
  }
}

class Hill {
  Hill() {
  }

  float floorFunction(float x) {
    float angularVelocity = (2*3*PI)/width;
    float amplitude = width/20;
    float displacement = PI/2;
    float konstant = height-100;
    float y = konstant+amplitude*sin(angularVelocity*x+displacement);
    return y;
  }
  
  float diffFloorFunction(float x){
    float angularVelocity = (2*3*PI)/width;
    float amplitude = width/20;
    float displacement = PI/2;
    float konstant = height-100;
    //float y = amplitude*angularVelocity*cos(angularVelocity*x+displacement);
    float y = -(3*PI*sin((3*x*PI)/350))/10;
    println(y);
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

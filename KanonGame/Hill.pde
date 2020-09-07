class Hill {
  Hill() {
  }
  
  // Denne funktion returnerer gulvets højde til enhver x-værdi
  float floorFunction(float x) {
    float angularVelocity = (2*3*PI)/width;
    float amplitude = width/20;
    float displacement = PI/2;
    float konstant = height-100;
    float y = konstant+amplitude*sin(angularVelocity*x+displacement);
    return y;
  }
  
  // Denne funktion returnerer gulvets hældning til enhver y-værdi
  float diffFloorFunction(float x){
    float angularVelocity = (2*3*PI)/width;
    float amplitude = width/20;
    float displacement = PI/2;
    float y = amplitude*angularVelocity*cos(angularVelocity*x+displacement);
    return y;
  }
  
  // Her tegnes gulvet
  void display() {
    fill(150, 70, 30);
    noStroke();
    rectMode(CORNER);
    for (int x =0; x <= width; x += 1) {
      rect(x, floorFunction(x), 1, height-floorFunction(x));
    }
  }
}

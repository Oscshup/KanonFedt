class Hill {
  PVector location;
  float r;


  Hill(float x, float y, float r_) {
    location = new PVector(x, y);
    r = r_;
  }

  float floorFunction(float x){
    float w = (2*3*PI)/width;
    float y = height-50+50*sin(w*x+PI/2);
    return y;
  }

  void display() {;
    //   arc(location.x, location.y, r*2, r, radians(180), radians(360));
    //  arc(location.x+490, location.y, r, r, radians(180), radians(200));
    //  arc(location.x-490, location.y, r, r, radians(340), radians(360));
    for (int x =0; x <= width; x += 1) {
      fill(150,70,30);
      noStroke();
      rect(x,floorFunction(x),1, height-floorFunction(x));
    }
  }
}

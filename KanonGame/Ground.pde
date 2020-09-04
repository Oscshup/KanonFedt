class Hill {
  PVector location;
  float r;
  float angle = 0;
  float angleVel = 0.03;


  Hill(float x, float y, float r_) {
    location = new PVector(x, y);
    r = r_;
  }


  void display() {
    strokeWeight(3);
    stroke(255);
    noFill();
    //   arc(location.x, location.y, r*2, r, radians(180), radians(360));
    //  arc(location.x+490, location.y, r, r, radians(180), radians(200));
    //  arc(location.x-490, location.y, r, r, radians(340), radians(360));
    beginShape();
    for (int x =0; x <= width; x += 1) {

      float y = map(sin(angle), -1, 1 , height-100, height);
      vertex(x, y);
      angle +=angleVel;
    }
     angle = 0;
    endShape();
  }
}

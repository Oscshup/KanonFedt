class Hill {
  PVector location;
  float r;


  Hill(float x, float y, float r_) {
    location = new PVector(x, y);
    r = r_;
  }


  void display() {
    noStroke();
    fill(#996600);
    arc(location.x, location.y, r*2, r, radians(180), radians(360));
    arc(location.x+490, location.y, r, r, radians(180), radians(200));
    arc(location.x-490, location.y, r, r, radians(340), radians(360));
  }
}

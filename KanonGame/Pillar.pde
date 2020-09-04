class Pillar {

  float x = width/2;
  float y = height/2+(hill.floorFunction(x)-height/2)/2+10;
  float w = 30;
  float h = hill.floorFunction(x)-height/2;
  float tl = w/2;
  float tr = w/2;
  float bl = 0;
  float br = 0;

  Pillar() {
  }

  boolean collideBall(Shot s) {
    for (int i = int(hill.floorFunction(x)); i >= height/2+w/2; i--) {
      float minDist = s.d/2+w/2;
      float d = dist(width/2, i, s.location.x, s.location.y);
      if (d < minDist-10) {
        return true;
      }
    }

    return false;
  }

  void display() {
    noStroke();
    fill(150,70,30);
    rectMode(CENTER);
    rect(x, y, w, h, tl, tr, bl, br);
  }
}

class Background {

  PImage b;

  Background() {
    b = loadImage("Background.JPG");
  }

  void display() {
    b.resize(width,height);
    image(b, 0, 0);
  }
}

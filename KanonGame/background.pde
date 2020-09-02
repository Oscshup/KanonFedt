class Background {
  
  PImage b;
  
  Background(){
    b = loadImage("Background.JPG");
  }
  
  void display(){
    image(b, 0, 0);
  }
  
}

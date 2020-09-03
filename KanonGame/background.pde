class Background {
  
  PImage b;
  
  Background(){
    b = loadImage("Background.jpg");
  }
  
  void display(){
    image(b, 0, 0);
  }
  
}

// Vi har valgt ikke at bruge denne baggrundsfunktion, da spillet laggede, men muligheden er der.

class Background {

  PImage b;

  Background(){
    b = loadImage("Background.JPG");
    b.resize(width,height);
  }

  void display(){

    image(b, 0, 0);
  }

}

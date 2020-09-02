//variable
Tank tank;

void setup() {

  tank =new Tank(100, 100);
  size(700, 700);
}



void draw() {
  tank.display();
  tank.move();
}

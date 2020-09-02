//variable
int player = 1;
Background background;

Tank[] tank = new Tank[player];
void setup() {
  background = new Background(); 
  size(700, 700);
  for (int i = 0; i < player; i++) {
    tank[i] = new Tank(100, 100,56);
  }
}




void draw() {

 background.display();
  for (Tank t : tank) {

    t.display();
    t.move();
  }
}

//variable
int player = 1;

Tank[] tank = new Tank[player];

void setup() {
  size(700, 700);
  for (int i = 0; i < player; i++) {
    tank[i] = new Tank(random(200, 400), random(400,700), 40);
  }
}




void draw() {
  
  for (Tank t : tank) {

    t.display();
    t.move();
  }
}

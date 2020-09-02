//variable
int player = 2;

Tank[] tank = new Tank[player];
Hill hill;

void setup() {
  size(1200, 700);

  for (int i = 0; i < player; i++) {
    tank[i] = new Tank(random(200), random(200), 40);
  }

  hill = new Hill(width/2, height, 350);
}



void draw() {


  for (Tank t : tank) {
    t.display();
  }

  hill.display();
}

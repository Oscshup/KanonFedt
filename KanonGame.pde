//Background background;
Shot s;
Hill hill;
Pillar p;
int player = 2;
Tank[] tank = new Tank[player];

int turn = 1; // Bestemmer hvis tur det er (eks. turn = 1, så er det player 1's tur)

// Lokation af tankens kanons ende
float xTemp; 
float yTemp;

color orange = color(255, 154, 0); // Farven af skuddet
float massShot = 10; // Massen af skuddet

float tankOffY; // Skyldes at tankens lokation er skæv i forhold til dets koordinater

// Sørger for at skuddet kun kan ramme en tank 1 gang per tur
int turnsTotal = 0;
int lastTurnHit = 0;

boolean shotActive = false; // Bestemmer om et skud er affyret eller ej.

boolean start = true; // Bestemmer om spillet lige er gået til startskærmen.

Screen screen;

void setup() {
  size(1200, 700);
  Start(); // Funktion der leder til startskærmen
}

void Start() { // Ligesom en setup-funktion der kan køres forfra.
  screen = new Screen();
  screen.gameScreen = 0; // Forklares i classen om skærmen. (den viser startskærmen)
  // Alle værdier sættes til deres startværdier
  start = true;
  turn = 1; 
  lastTurnHit = 0;
  turnsTotal = 0;
  //background = new Background(); // Kan anvendes, men skaber lag
  hill = new Hill(); // Tegner gulvet
  p = new Pillar(); // Tegner søjlen i midten
  
  // Her tegnes tanksene
  for (int i = 0; i < tank.length; i++) {
    float offXTemp = 50;
    float offYTemp = 5;
    tankOffY = 50;
    xTemp = width*i+width/6-2*i*width/6;
    yTemp = hill.floorFunction(xTemp)-tankOffY;
    tank[i] = new Tank(xTemp, yTemp, 56, offXTemp, offYTemp, i+1);
  }
}

void draw() {
  screen.display(); // Viser skærmen og kører alle funktioner, hvis spillet er igang
}

void mouseClicked() {
  // Her startes spillet forfra hvis en spiller har tabt
  for (Tank t : tank) {
    if (t.dead == true) {
      screen.restart();
    }
  }
  
  // Her startes spillet hvis man trykker på startskærmen
  if (start == true) {
    screen.startGame();
  } else if (shotActive == false) { // Her affyres et skud, hvis et ikke allerede er affyret.
    // Her beregnes lokationen af kanonen på tankens ende
    xTemp = tank[turn-1].location.x+cos(tank[turn-1].angleStart)*tank[turn-1].rorLength;
    yTemp = tank[turn-1].location.y+sin(tank[turn-1].angleStart)*tank[turn-1].rorLength;
    // Her affyrest skuddet
    s = new Shot(xTemp, yTemp, 15, orange, mouseX, mouseY, massShot);
    turnsTotal++; // Mængden af skud stiger med 1
    shotActive = true; // Der er nu et skud igang.
  }
}

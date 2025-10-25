// THE GAME BOX met 3x3 kleurenvierkant ertussen
PFont font;
color[] blockColors;

void setup() {
  size(800, 600);
  font = createFont("Arial Bold", 48);
  textFont(font);
  blockColors = new color[]{
    color(255, 165, 0), // oranje
    color(255, 255, 0), // geel
    color(255, 0, 0),   // rood
    color(0, 128, 0),   // groen
    color(0, 255, 255), // cyaan
    color(255, 105, 180), // roze
    color(255, 255, 255), // wit
    color(128, 0, 128),   // paars
    color(0, 255, 255)    // cyaan (herhaling)
  };
  noLoop();
}

void draw() {
  background(30);
  drawStoreFront();
  drawLogoWithGrid();
  drawGlassPanels();
}

void drawStoreFront() {
  fill(50);
  rect(20, 50, width-45, 500); // gevel
}

void drawLogoWithGrid() {
  textAlign(CENTER, CENTER);
  fill(255);
  textSize(48);
  text("THE", width/2 - 150, 140);

  // 3x3 grid van blokjes
  int gridSize = 150;
  int blockSize = gridSize / 9;
  int startX = width/2 - 150 + 60;
  int startY = 115;

  for (int row = 0; row < 3; row++) {
    for (int col = 0; col < 3; col++) {
      int index = row * 3 + col;
      fill(blockColors[index]);
      stroke(0);
      rect(startX + col * blockSize, startY + row * blockSize, blockSize, blockSize);
    }
  }

  // Tekst onder de grid
  fill(255);
  text("GAME BOX", width/2 + 100, 140);
    // Donkergrijze lijn onder logo + grid
  stroke(0); // donkergrijs
  strokeWeight(5);
  line(22, 180, width-27, 180);

}

void drawGlassPanels() {
  int panelWidth = 180;
  int panelHeight = 300;
  int spacing = 30;
  int startX = 100 + spacing;
  
  stroke(100, 200, 255, 100);
  fill(0, 0, 50, 150);
  
  for (int i = 0; i < 3; i++) {
    int x = startX + i * (panelWidth + spacing);
    int y = 200;

    // Paneel
    rect(x, y, panelWidth, panelHeight);

    // Reflectielijn binnen paneel
    line(x + 10, y + 10, x + panelWidth - 40, y + panelHeight - 10);
  }

  // Neonachtige tekst
  textSize(24);
  fill(0, 255, 255);
  text("PLAY THAT GAME", width/2, 500);
  textSize(16);
  fill(255, 100, 255);
  text("THEGAMEBOX.NL", width/2, 525);
}

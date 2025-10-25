class LogoBanner {
  PFont font;
  color[] blockColors;

  LogoBanner() {
    font = createFont("Arial Bold", 48);
    blockColors = new color[]{
      color(255, 165, 0), color(255, 255, 0), color(255, 0, 0),
      color(0, 128, 0), color(0, 255, 255), color(255, 105, 180),
      color(255, 255, 255), color(128, 0, 128), color(0, 255, 255)
    };
  }

  void display() {
    textFont(font);
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

    // GAME BOX tekst
    fill(255);
    text("GAME BOX", width/2 + 100, 140);

    // Donkergrijze lijn
    stroke(0);
    strokeWeight(5);
    line(22, 180, width - 27, 180);
  }
}

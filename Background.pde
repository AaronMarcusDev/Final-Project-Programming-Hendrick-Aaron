class Background {
  void drawBrickWall() {
    int brickW = 50;
    int brickH = 25;
    color brickColor = color(120, 60, 40);
    color cementColor = color(80, 40, 30);

    for (int row = 0; row * brickH < height; row++) {
      int y = row * brickH;
      int offset;

      if (row % 2 == 0) {
        offset = 0; // bricks start at regular location
      } else {
        offset = brickW / 2;
        // If that is not the case, we have to shift them to the right by half a brick
        // we do this because it is more realistic for a brick wall
      }

      for (int col = -1; col * brickW <  width + brickW; col++) {
        //            ^-- It has to start at -1 so that it covers the whole screen
        // otherwise the shifted rows would leave white spaces on the left
        int x = col * brickW + offset;

        fill(brickColor);
        stroke(cementColor);
        strokeWeight(2);
        rect(x, y, brickW, brickH);
        strokeWeight(1);
      }
    }
  }

  void drawPavement() {
    // Pavement rectanlge
    fill(100);
    noStroke();
    rect(0, 525, width, 120);

    // Pavement lines
    stroke(80);
    strokeWeight(2);

    for (int x = 20; x < width - 25; x += 50) {
      line(x, 530, x, 600);
    }

    strokeWeight(1);

    // Darker strip for curb?
    fill(60);
    rect(0, 530, width, 5);
  }
}

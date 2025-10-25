class StoreFront {
  void display() {
    fill(50);
    rect(20, 50, width - 45, 500);
  }

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
        rect(x, y, brickW, brickH);
      }
    }
  }
}

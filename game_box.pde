StoreFront storeFront;
LogoBanner logoBanner;
GlassWall glassWall;
ColoredLine[] lines;

void setup() {
  size(800, 600);
  storeFront = new StoreFront();
  logoBanner = new LogoBanner();
  glassWall = new GlassWall();
  lines = new ColoredLine[10];
  lines[0] = new ColoredLine(600, 210, 600, 400, color(255, 255, 0), 20);  // Vertical line yellow
  lines[1] = new ColoredLine(140, 400, 600, 400, color(255, 255, 0), 20);  // Horizontal line yellow
  lines[2] = new ColoredLine(200, 240, 200, 500, color(0, 68, 250), 15);    // Vertical line blue(left)
  lines[3] = new ColoredLine(135, 240, 200, 240, color(0, 68, 250), 15);  // Horizontal line blue(left)
  lines[4] = new ColoredLine(650, 240, 650, 500, color(0, 68, 250), 15);  // Vertical line blue(right)
  lines[5] = new ColoredLine(725, 240, 650, 240, color(0, 68, 250), 15);  // Horizontal line blue(right)
  lines[6] = new ColoredLine(130, 300, 250, 300, color(15, 170, 24), 10);  //Horizontal line green(left)
  lines[7] = new ColoredLine(250, 300, 250, 450, color(15, 170, 24), 10);  //Vertical line green(left)
  lines[8] = new ColoredLine(250, 450, 675, 450, color(15, 170, 24), 10);  //Horizontal line green(middle)
  lines[9] = new ColoredLine(675, 450, 675, 500, color(15, 170, 24), 10);  //Vertical line green(right)
  noLoop();
}

void draw() {
  storeFront.drawBrickWall();
  storeFront.display();
  logoBanner.display();
  glassWall.display();
  for (ColoredLine l : lines) {
    l.display();
  }
}

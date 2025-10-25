StoreFront storeFront;
LogoBanner logoBanner;
GlassWall glassWall;

void setup() {
  size(800, 600);
  storeFront = new StoreFront();
  logoBanner = new LogoBanner();
  glassWall = new GlassWall();
  noLoop();
}

void draw() {
  storeFront.drawBrickWall();
  storeFront.display();
  logoBanner.display();
  glassWall.display();
}

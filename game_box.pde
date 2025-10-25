StoreFront storeFront;
LogoBanner logoBanner;
GlassPanels glassPanels;
Background bg;
ColoredLine[] lines;

float reflectionStrength = 0.45; // Reflection strength
float reflectionWidth    = 220;  // Reflection width
float reflectionFeather  = 140;  // Softness
float reflectionJitter   = 0.08; // Shimmer amount

void setup() {
  size(800, 600);
  storeFront = new StoreFront();
  logoBanner = new LogoBanner();
  glassPanels = new GlassPanels();
  bg = new Background();
  lines = new ColoredLine[10];

  // Geel: horizontaal over alle ramen, verticaal aan rechterrand van rechterraam
  lines[0] = new ColoredLine(580, 210, 580, 400, color(255, 255, 0), 20);  // Vertical yellow (rechterrand van rechterraam)
  lines[1] = new ColoredLine(105, 400, 580, 400, color(255, 255, 0), 20);  // Horizontal yellow (van linker tot rechterraam)

  // Blauw: links van linkerraam en rechts van rechterraam
  lines[2] = new ColoredLine(155, 240, 155, 495, color(0, 68, 250), 15);     // Vertical blue (linkerrand)
  lines[3] = new ColoredLine(105, 240, 155, 240, color(0, 68, 250), 15);     // Horizontal blue (links)

  lines[4] = new ColoredLine(645, 240, 645, 495, color(0, 68, 250), 15);     // Vertical blue (rechterrand)
  lines[5] = new ColoredLine(645, 240, 695, 240, color(0, 68, 250), 15);     // Horizontal blue (rechts)

  // Groen: van links naar midden, dan naar rechts
  lines[6] = new ColoredLine(105, 300, 240, 300, color(15, 170, 24), 10);  // Horizontal green (linkerraam tot middenraam)
  lines[7] = new ColoredLine(240, 300, 240, 450, color(15, 170, 24), 10);  // Vertical green (middenraam)
  lines[8] = new ColoredLine(240, 450, 675, 450, color(15, 170, 24), 10);  // Horizontal green (midden tot rechterraam)
  lines[9] = new ColoredLine(675, 450, 675, 500, color(15, 170, 24), 10);  // Vertical green (rechterraam)


 //noLoop();
}

void draw() {
  bg.drawBrickWall();
  bg.drawPavement();
 storeFront.display();
 
  float viewer = constrain((float)mouseX / width, 0, 1);
  float shimmer = (noise(frameCount * 0.01f) - 0.5f) * 2.0f;
  float dynamicStrength = constrain(reflectionStrength + shimmer * reflectionJitter, 0, 1);


  logoBanner.display();
  glassPanels.display();
  glassPanels.displayWithReflection(viewer, dynamicStrength, reflectionWidth, reflectionFeather);

  for (ColoredLine l : lines) {
    l.display();
  }
  // Remove sections outside glass panels
  stroke(50);       // Matches storefront color
  strokeWeight(25); // Matching thickness to cover
  line(292, 200, 292, 500);
  line(502, 200, 502, 500);
}

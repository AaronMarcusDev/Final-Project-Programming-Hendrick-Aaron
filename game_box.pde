/* ----------------------------------------------------------------------------------------------

The Game Box Store in Enschede recreated in Processing for the programming M1 final assignment
By Hendrick Landeweerd & Aaron Struikenkamp

GitHub Repository: https://github.com/AaronMarcusDev/Final-Project-Programming-Hendrick-Aaron

------------------------------------------------------------------------------------------------- */

/* Classes used */
StoreFront storeFront;
LogoBanner logoBanner;
GlassPanels glassPanels;
Background bg;
ColoredLine[] lines;
Reflection reflection;
Bicycle bike;
Popup popup;

/* Global Variables */
// These are the only truely necessary global variables, we could not get them into classes.

boolean moving = false;
color bikerShirtColor;
int popupStartTime;

void setup() {
  size(800, 600);

  /* Assigning the classes to the variables */
  storeFront = new StoreFront();
  logoBanner = new LogoBanner();
  glassPanels = new GlassPanels();
  bg = new Background();
  popup = new Popup();
  lines = new ColoredLine[10];
  reflection = new Reflection();
  bike = new Bicycle(-60, 570, 4.0);
  popupStartTime = millis();

  /* Setting values to the lines */

  // Yellow line
  lines[0] = new ColoredLine(580, 210, 580, 400, color(255, 255, 0), 20);  // Vertical yellow
  lines[1] = new ColoredLine(105, 400, 580, 400, color(255, 255, 0), 20);  // Horizontal yellow

  // Blue lines
  lines[2] = new ColoredLine(155, 240, 155, 495, color(0, 68, 250), 15);     // Vertical blue (left)
  lines[3] = new ColoredLine(105, 240, 155, 240, color(0, 68, 250), 15);     // Horizontal blue

  lines[4] = new ColoredLine(645, 240, 645, 495, color(0, 68, 250), 15);     // Vertical blue (right)
  lines[5] = new ColoredLine(645, 240, 695, 240, color(0, 68, 250), 15);     // Horizontal blue

  // Green line
  lines[6] = new ColoredLine(105, 300, 240, 300, color(15, 170, 24), 10);  // Horizontal green
  lines[7] = new ColoredLine(240, 300, 240, 450, color(15, 170, 24), 10);  // Vertical green
  lines[8] = new ColoredLine(240, 450, 675, 450, color(15, 170, 24), 10);  // Horizontal
  lines[9] = new ColoredLine(675, 450, 675, 500, color(15, 170, 24), 10);  // Vertical
}

void draw() {
  bg.drawBrickWall();
  storeFront.display();

  // Map mouseX to a value between 0 and 1
  float viewer = map(mouseX, 0, width, 0, 1);
  viewer = constrain(viewer, 0, 1); // just to be safe

  // Create a shimmer effect that changes over time
  float noiseValue = noise(frameCount * 0.01); // smooth random value
  float shimmer = (noiseValue - 0.5) * 2.0;   // range: -1 to +1

  // Adjust reflection strength with shimmer, limited to 0–1
  float dynamicStrength = reflection.strength + shimmer * reflection.jitter;
  dynamicStrength = constrain(dynamicStrength, 0, 1);

  logoBanner.display();
  // glassPanels.display();
  glassPanels.displayWithReflection(viewer, dynamicStrength, reflection.width, reflection.feather);


  for (ColoredLine l : lines) {
    l.display();
  }

  // Remove sections outside glass panels
  // (just covering them with lines the same colour as the storefront)
  stroke(50);
  strokeWeight(25); // Matching thickness to cover
  line(292, 200, 292, 500);
  line(502, 200, 502, 500);

  if (millis() - popupStartTime < 7000) {
    //                              ^-- 7 Seconds
    popup.showMessage("Click a colored square in the logo to choose a color.\nPress SPACE to summon a biker from Enschede!");
  }

  bg.drawPavement();
  bike.display(bikerShirtColor); // Make it the same colour as the game box banner

  if (moving) {
    bike.update();
    if (bike.isOffRight()) {
      moving = false;
      bike = new Bicycle(-60, 570, 4.0);
    }
  }
}

void mousePressed() {
  bikerShirtColor = logoBanner.handleClick();
}

void keyPressed() {
  if (key == ' ') {
    moving = true;
    loop();
  }
}

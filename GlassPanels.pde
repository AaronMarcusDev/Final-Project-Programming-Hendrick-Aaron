class GlassPanels {
  void display() {
    int panelWidth = 180;
    int panelHeight = 300;
    int spacing = 30;
    int startX = 20 + 77; // centered with 755px width

    stroke(100, 200, 255, 100);
    fill(0, 0, 50, 150);

    for (int i = 0; i < 3; i++) {
      int x = startX + i * (panelWidth + spacing);
      int y = 200;

      rect(x, y, panelWidth, panelHeight);
      line(x + 10, y + 10, x + panelWidth - 40, y + panelHeight - 10);
    }

    fill(0);

    // Neon text
    textSize(30);
    fill(0, 255, 255);
    text("PLAY", width/2, 300);
    text("THAT ", width/2, 325);
    text("GAME", width/2, 350);

    textSize(16);
    fill(255, 100, 255);
    text("THEGAMEBOX.NL", width/2, 480);
  }

  // Draws panels and reflections
  void displayWithReflection(float viewerNorm, float opacity, float bandWidth, float feather) {
    //Repeat from display
    int panelWidth  = 180;
    int panelHeight = 300;
    int spacing     = 30;
    int startX      = 20 + 77; // centered with 755px width
    int y           = 200;

    // Repeat from display
    stroke(100, 200, 255, 100);
    fill(0, 0, 50, 150);
    for (int i = 0; i < 3; i++) {
      int x = startX + i * (panelWidth + spacing);
      rect(x, y, panelWidth, panelHeight);
      line(x + 10, y + 10, x + panelWidth - 40, y + panelHeight - 10);
    }

    // Relfection inside panels
    float bandCenterX = viewerNorm * width;
    pushStyle();
    blendMode(ADD);
    noStroke();

    for (int i = 0; i < 3; i++) {
      int gx = startX + i * (panelWidth + spacing);
      int gy = y;
      int gw = panelWidth;
      int gh = panelHeight;

      int steps = max(12, gw / 4);            // Gradient resolution
      for (int s = 0; s < steps; s++) {
        float t  = (s + 0.5f) / steps;
        float cx = gx + t * gw;

        float d     = abs(cx - bandCenterX);
        float inner = bandWidth * 0.5f;
        float outer = inner + feather;

        float a;
        if (d <= inner)      a = 1.0f;
        else if (d >= outer) a = 0.0f;
        else {
          float u = (d - inner) / (outer - inner);
          a = 1.0f - (u*u*(3 - 2*u));         // smoothstep fade
        }

        float alpha = 255 * a * opacity;
        fill(170, 200, 255, alpha);           // Subtle tinted reflection

        float stripW = gw / steps + 1;        // Avoids gaps
        rect(cx - stripW * 0.5f, gy, stripW, gh);
      }
    }
    popStyle();

    // Repeat from display
    fill(0);
    textSize(30);
    fill(0, 255, 255);
    textAlign(CENTER, CENTER);
    text("PLAY", width/2, 300);
    text("THAT", width/2, 325);
    text("GAME", width/2, 350);

    textSize(16);
    fill(255, 100, 255);
    text("THEGAMEBOX.NL", width/2, 480);
  }
}

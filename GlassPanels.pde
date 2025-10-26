class GlassPanels {
  void display() {
    int panelWidth = 180;     // Width of each glass panel
    int panelHeight = 300;    // Height of each glass panel
    int spacing = 30;         // Space between panels
    int startX = 20 + 77;     // Left margin + centering offset (for 755px wide storefront)

    stroke(100, 200, 255, 100); // Light blue stroke with transparency
    fill(0, 0, 50, 150);        // Dark blue fill with transparency

    for (int i = 0; i < 3; i++) {
      int x = startX + i * (panelWidth + spacing); // X position of each panel
      int y = 200;                                  // Y position (top of panels)

      rect(x, y, panelWidth, panelHeight);         // Draw the panel
      line(x + 10, y + 10, x + panelWidth - 40, y + panelHeight - 10); // Diagonal reflection line
    }

    // Neon text overlay
    fill(0);
    textSize(30);
    fill(0, 255, 255);         // Cyan glow
    text("PLAY", width/2, 300);
    text("THAT ", width/2, 325);
    text("GAME", width/2, 350);

    textSize(16);
    fill(255, 100, 255);       // Pink accent
    text("THEGAMEBOX.NL", width/2, 480);
  }


  // Draws panels and reflections
  void displayWithReflection(float viewerNorm, float opacity, float bandWidth, float feather) {
    // Panel layout settings
    int panelWidth = 180;
    int panelHeight = 300;
    int spacing = 30;
    int startX = 97; // 20 + 77
    int y = 200;

    // Draw panels and diagonal lines
    stroke(100, 200, 255, 100);
    fill(0, 0, 50, 150);
    for (int i = 0; i < 3; i++) {
      int x = startX + i * (panelWidth + spacing);
      rect(x, y, panelWidth, panelHeight);
      line(x + 10, y + 10, x + panelWidth - 40, y + panelHeight - 10);
    }

    // Reflection band center based on viewer position
    float bandCenterX = viewerNorm * width;

    // Draw reflection strips
    pushStyle();
    blendMode(ADD); // glow effect
    noStroke();

    for (int i = 0; i < 3; i++) {
      int panelX = startX + i * (panelWidth + spacing);
      int steps = 20; // number of strips per panel

      for (int s = 0; s < steps; s++) {
        float t = (s + 0.5f) / steps;
        float stripX = panelX + t * panelWidth;

        // Distance from viewer center
        float distance = abs(stripX - bandCenterX);
        float inner = bandWidth / 2;
        float outer = inner + feather;

        // Calculate alpha with smooth fade
        float alpha = 0;
        if (distance <= inner) {
          alpha = 255 * opacity;
        } else if (distance < outer) {
          float fade = (distance - inner) / (outer - inner);
          alpha = 255 * opacity * (1 - fade * fade * (3 - 2 * fade)); // smoothstep
        }

        // Draw strip
        fill(170, 200, 255, alpha);
        float stripW = panelWidth / steps + 1;
        rect(stripX - stripW / 2, y, stripW, panelHeight);
      }
    }

    popStyle();

    // Neon text overlay
    textAlign(CENTER, CENTER);
    textSize(30);
    fill(0, 255, 255);
    text("PLAY", width / 2, 300);
    text("THAT", width / 2, 325);
    text("GAME", width / 2, 350);

    textSize(16);
    fill(255, 100, 255);
    text("THEGAMEBOX.NL", width / 2, 480);
  }
}


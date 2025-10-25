class GlassWall {
  void display() {
    int panelWidth = 180;
    int panelHeight = 300;
    int spacing = 30;
    int startX = 20 + 77; // gecentreerd binnen gevel van 755px breed

    stroke(100, 200, 255, 100);
    fill(0, 0, 50, 150);

    for (int i = 0; i < 3; i++) {
      int x = startX + i * (panelWidth + spacing);
      int y = 200;

      rect(x, y, panelWidth, panelHeight);
      line(x + 10, y + 10, x + panelWidth - 40, y + panelHeight - 10);
    }

    // Neon tekst
    textSize(24);
    fill(0, 255, 255);
    text("PLAY THAT GAME", width/2, 500);
    textSize(16);
    fill(255, 100, 255);
    text("THEGAMEBOX.NL", width/2, 525);
  }
}

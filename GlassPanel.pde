class GlassPanel {
  int x, y, w, h;

  GlassPanel(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  void display() {
    stroke(100, 200, 255, 100);
    fill(0, 0, 50, 150);
    rect(x, y, w, h);
    line(x + 10, y + 10, x + w - 40, y + h - 10);
  }
}

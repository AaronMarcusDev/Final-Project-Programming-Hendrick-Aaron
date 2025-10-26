class ColoredLine {
  float x1, y1, x2, y2;
  color lineColor;
  float thickness;

  ColoredLine(float x1, float y1, float x2, float y2, color lineColor, float thickness) {
    /// Pretty self-explanatory
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    this.lineColor = lineColor;
    this.thickness = thickness;
  }

  void display() {
    stroke(lineColor);
    strokeWeight(thickness);
    line(x1, y1, x2, y2);
  }
}

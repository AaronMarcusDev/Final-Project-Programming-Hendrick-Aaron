class StoreFront {
  void display() {
    fill(50);
    rect(20, 50, width - 45, 500);

    stroke(30);         // darker gray than the building
    strokeWeight(5);

    int x = 20;               // left edge of storefront
    int y = 50;              // top edge
    int w = width - 45;       // storefront width
    int h = 500;              // storefront height

    line(x, y, x, y + h);         // left edge
    line(x, y, x + w, y);         // top edge
    line(x + w, y, x + w, y + h); // right edge
  }
}

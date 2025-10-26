class LogoBanner {
  PFont font;               // Font used for the logo text
  color[] blockColors;      // Array of selectable block colors

  color titleColor = color(255); // Default color for the logo text (white)

  // Constructor: sets up font and color options
  LogoBanner() {
    font = createFont("Arial Bold", 48); // Load a bold font for the logo
    blockColors = new color[] {
      // 9 vibrant colors for the 3x3 grid blocks
      color(255, 165, 0), // orange
      color(255, 255, 0), // yellow
      color(255, 0, 0), // red
      color(0, 128, 0), // dark green
      color(0, 255, 255), // cyan
      color(255, 105, 180), // pink
      color(255, 255, 255), // white
      color(128, 0, 128), // purple
      color(0, 255, 255)    // cyan (again)
    };
  }

  // Draws the logo banner with text and color blocks
  void display() {
    textFont(font);               // Use the custom font
    textAlign(CENTER, CENTER);    // Center text horizontally and vertically
    fill(titleColor);             // Use current title color
    textSize(48);                 // Large text size

    // Draw "THE" on the left side of the logo
    text("THE", width/2 - 150, 140);

    // Draw the 3x3 grid of color blocks
    int gridSize = 150;                   // Total size of the grid
    int blockSize = gridSize / 9;        // Size of each small square (9 per row)
    int startX = width/2 - 150 + 60;     // X position of the grid (between "THE" and "GAME BOX")
    int startY = 115;                    // Y position of the grid

    for (int row = 0; row < 3; row++) {
      for (int col = 0; col < 3; col++) {
        int index = row * 3 + col;       // Convert 2D grid to 1D index
        fill(blockColors[index]);        // Set fill color from array
        stroke(0);                       // Black border around each block
        rect(startX + col * blockSize, // X position of block
          startY + row * blockSize, // Y position of block
          blockSize, blockSize);      // Size of block
      }
    }

    // Draw "GAME BOX" on the right side of the logo
    fill(titleColor);                   // Same color as "THE"
    text("GAME BOX", width/2 + 100, 140);

    // Draw a dark horizontal line below the logo
    stroke(30);                         // Dark gray
    strokeWeight(5);                    // Thick line
    line(22, 180, width - 27, 180);     // Full width line with padding
  }

  color handleClick() {
    int gridsize = 150;
    int blocksize = gridsize / 9;
    int startX = width/2 - 150 + 60;
    int startY = 115;

    // Check if mouse is within the 3x3 block area
    if (mouseX >= startX && mouseX < startX + 3 * blocksize &&
      mouseY >= startY && mouseY < startY + 3 * blocksize) {

      // Calculate which block was clicked
      int col = (mouseX - startX) / blocksize;
      int row = (mouseY - startY) / blocksize;
      int index = row * 3 + col;

      // If valid block, update title color and return it
      if (index >= 0 && index < blockColors.length) {
        titleColor = blockColors[index]; // Update logo text color
        return blockColors[index];       // Return color for external use (e.g. biker shirt)
      }
    }

    // If click was outside the grid, return black
    return color(0);
  }
}


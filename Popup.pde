class Popup {
  void showMessage(String message) {
    fill(0, 0, 0, 200); // semi-transparent background
    //              ^-- this is the opacity (for future applications) 
    stroke(255);
    strokeWeight(2);
    rect(150, 200, 500, 120, 10); // rounded box

    fill(255);
    textAlign(CENTER, CENTER);
    textSize(16);
    text(message, 400, 260);

    //"Click a colored square in the logo to choose a color.\nPress SPACE to summon a biker from Enschede!",
  }
}

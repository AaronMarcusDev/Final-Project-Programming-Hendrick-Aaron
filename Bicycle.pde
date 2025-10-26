class Bicycle {
  float x;
  float wheelCenterY;  //Center of the wheel sits just above the pavement
  float speed;
  float r = 20;  //Wheel radius
  
  Bicycle(float startX, float pavementTop, float speed) {
    x = startX;
    wheelCenterY = pavementTop - r;  //Wheels touch the pavement
    this.speed = speed;
  }
  
  void update() {
    x += speed;
  }
  
  boolean isOffRight() {
    return x - r > width + 60;
  }
  
  void display() {
    //Wheels
    noFill();
    stroke(0);
    strokeWeight(3);
    ellipse(x, wheelCenterY, 2*r, 2*r);  //Rear
    ellipse(x + 80, wheelCenterY, 2*r, 2*r);  //Front

    
    //Frame
    line(x, wheelCenterY, x + 35, wheelCenterY - 25);
    line(x + 35, wheelCenterY - 25, x + 80, wheelCenterY);
    line(x + 35, wheelCenterY - 25, x + 50, wheelCenterY);
    line(x + 50, wheelCenterY, x, wheelCenterY);
    
    //Seat and Handlebar
    line(x + 30, wheelCenterY - 28, x + 45, wheelCenterY - 28);
    line(x + 80, wheelCenterY, x + 95, wheelCenterY - 10);
  }
}

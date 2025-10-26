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
    
    //Person
    float bodyBaseX = x + 40;  //Hips over center of the bike)
    float bodyBaseY = wheelCenterY - 25;
    float bodyHeight = 35;
    
    //Body
    stroke(0);
    strokeWeight(3);
    line(bodyBaseX, bodyBaseY, bodyBaseX, bodyBaseY - bodyHeight);
    
    //Head
    fill(255, 220, 180);
    noStroke();
    ellipse(bodyBaseX, bodyBaseY - bodyHeight - 10, 15, 15);
    
    //Arms on handlebar
    stroke(0);
    strokeWeight(2);
    line(bodyBaseX, bodyBaseY - 25, x + 5, wheelCenterY - 15);
    
    //Legs on pedals
    line(bodyBaseX, bodyBaseY, x + 45, wheelCenterY);
    line(bodyBaseX, bodyBaseY, x + 25, wheelCenterY);
    
    //Shirt and colour
    noStroke();
    fill(0, 100, 255);
    rect(bodyBaseX - 6, bodyBaseY - bodyHeight, 12,bodyHeight - 5);

    //Seat and Handlebar
    line(x + 30, wheelCenterY - 28, x + 45, wheelCenterY - 28);
    line(x + 80, wheelCenterY, x + 95, wheelCenterY - 10);
  }
}

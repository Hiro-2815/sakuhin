Rotater[] rotaters;

void setup() {
  size(800, 800);
  colorMode(HSB, 360, 100, 100); // Set color mode to HSB

  rotaters = new Rotater[120];

  // Rotaters are made randomly
  for (int i = 0; i < rotaters.length; i++) {
    rotaters[i] = new Rotater(random(width), random(height), random(-0.1, 0.2), random(60));
  }
}



void draw() {
  background(0);

  // Set blend mode to SCREEN
  blendMode(SCREEN);

  // All Rotaters spin and are displayed
  for (int i = 0; i < rotaters.length; i++) {
    rotaters[i].spin();
    rotaters[i].display();
  }
}

class Rotater {

  float x, y;   // x,y location
  float theta;  // angle of rotation
  float speed;  // speed of rotation
  float w;      // size of rectangle

  Rotater(float tempX, float tempY, float tempSpeed, float tempW) {
    x = tempX;
    y = tempY;
    // Angle is always initialized to 0
    theta = 0;
    speed = tempSpeed;
    w = tempW;
  }

  // Increment angle
  void spin() {
    theta += speed;
  }

  // Display star
  void display() {
    stroke(0);
    // Set fill color to yellow in HSB
    fill(60,30,100);

   
    pushMatrix();
    translate(x, y);
    rotate(theta);

    // Draw a star
    float angle = TWO_PI / 5;
    float halfAngle = angle / 2.0;
    beginShape();
    for (float a = -PI/2; a < TWO_PI-PI/2; a += angle) {
      float sx = cos(a) * w;
      float sy = sin(a) * w;
      vertex(sx, sy);
      sx = cos(a + halfAngle) * (w / 2);
      sy = sin(a + halfAngle) * (w / 2);
      vertex(sx, sy);
    }
    endShape(CLOSE);

    popMatrix();
  }
}

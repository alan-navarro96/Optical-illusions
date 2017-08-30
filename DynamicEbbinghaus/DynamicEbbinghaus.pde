/*
 Dynamic Ebbinghaus Illusion
 Author: Christopher D. Blair, Gideon P. Caplovitz and Ryan E.B. Mruczek, 2014
 Tags: Dynamic Ebbinghaus Illusion
*/

boolean active = true;

void setup() {
  size(600, 600);
  background(255);
}
float x = 150, y = 150, dist = 30, grayR = 20;
int currentDirection = 0;
final int endX = 300, initX = 150;
void draw() {
  background(255);
  if (!active) {
    pushStyle(); // lines to turn off the illusion.
    stroke(13, 30, 188);
    line(35, 0, width + 35, 600);
    line(-35, 0, width - 35, 600);
    popStyle();
  }
  moveEbbinghaus();
  dynamicEbbinghaus(x, y, dist, grayR);
}

final float delta[] = {0.5, -0.5};
void moveInDir(int dir) {
  x += delta[dir];
  y += delta[dir];
  dist += delta[dir] * 2;
  grayR += delta[dir];
}

void moveEbbinghaus() {
  if (x == endX) {
    currentDirection = 1;
  } 
  if (x == initX) {
    currentDirection = 0;
  }
  moveInDir(currentDirection);
}


// Turn off illusion by clicking on it.
void mouseClicked() {
  active = !active;
}

// Draw the Ebbinghaus illusion. The input parameters are the current coordinates of
// the circle, the distance to the circumference and the radius of the gray circles.
void dynamicEbbinghaus(float x1, float y1, float distance, float grayRadius) {
  noStroke();
  pushStyle(); // orange circle
  fill(214, 98, 32); 
  int orangeRadius = 50;
  ellipse(x1, y1, orangeRadius, orangeRadius);
  popStyle();
  pushStyle(); // gray circles
  fill(190);
  paintCircles(x1, y1, distance + orangeRadius, 6, grayRadius);
  paintReferenceCircle(x1, y1, distance + orangeRadius, 6);
  popStyle();
}

// This function paints n circles of radius r2 separated equally 
// throughout a given circumference.
void paintCircles(float x, float y, float r, int n, float r2) {
  for (int i = 0; i < n; i++) {
    float xi = r/2 * cos(i*2*PI/n);
    float yi = r/2 * sin(i*2*PI/n);
    ellipse(x + xi, y + yi, r2, r2);
  }
}

// This function paints the reference dot to increase the effect of the dynamic Ebbinghaus illusion.
void paintReferenceCircle(float x, float y, float r, int n) {
    float xi = r/2 * cos(2*PI/n);
    float yi = r/2 * sin(2*PI/n);
    pushStyle();
    fill(0);
    ellipse(x + xi, y + yi, 5, 5);
    popStyle();
}
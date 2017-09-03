/*
 Ebbinghaus Illusion
 Author: Hermann Ebbinghaus, 1890
 Tags: Ebbinghaus Illusion, Titchener illusion
*/

boolean active = true;

void setup() {
  size(600, 600);
  frameRate(10);
}
int currentDegree = 0, rotationDegree = 25;
void draw() {
  background(150);
  colorWagonWheel(300, 300);
}

void colorWagonWheel (int x, int y) {
  fill(0);
  noStroke();
  int numCircles = 12;
  paintWheel(x, y, 450, numCircles, 25, currentDegree, 1);
  paintWheel(x, y, 350, numCircles, 20, currentDegree + 15, 1);
  paintWheel(x, y, 300, numCircles, 16, currentDegree, 2);
  paintWheel(x, y, 250, numCircles, 13, currentDegree + 15, 2);
  paintWheel(x, y, 200, numCircles, 10, currentDegree, 3);
  
  currentDegree += rotationDegree;
  if (active) {
    rotationDegree = 25;
  } else {
    rotationDegree = 1;
  }
}

// Turn off illusion by clicking on it.
void mouseClicked() {
    active = !active;
}

// This function paints n circles of radius r2 separated equally 
// throughout a given circumference.
void paintWheel(float x, float y, float r, int n, float r2, int rotate, int yellow) {
  for (int i = 0; i < n; i++) {
    if (i == yellow) {
      fill(247, 231, 4);
    } else {
      fill(0);
    }
    float xi = r/2 * cos(i*2*PI/n + rotate*PI/180);
    float yi = r/2 * sin(i*2*PI/n + rotate*PI/180);
    ellipse(x + xi, y + yi, r2, r2);
  }
}
boolean active = true;

void setup() {
  size(700, 500);
  background(255, 255, 255);
}

void draw() {
  ebbinghaus(250, 250, 550, 250, 50);
}

// Turn off illusion by clicking on it.
void mouseClicked() {
    active = !active;
}

// Draw the Ebbinghaus illusion. The input parameters are the two centers of the 
// circles and the radius.
void ebbinghaus(int x1, int y1, int x2, int y2, int r) {
  background(255);
  noStroke();
  pushStyle(); // orange circles
  fill(214, 98, 32); 
  ellipse(x1, y1, r, r);
  ellipse(x2, y2, r, r);
  popStyle();
  pushStyle(); // gray circles
  fill(190);
  paintCircles(x1, y1, 250, 6, 120);
  paintCircles(x2, y2, 100, 8, 28);
  popStyle();
  if (!active) {
    pushStyle(); // lines to turn off the illusion.
    stroke(13, 30, 188);
    line(0, x1-r/2, 700, x1-r/2);
    line(0, x1+r/2, 700, x1+r/2);
    popStyle();
  }
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
/*
 Lilac Chaser
 Author: Jeremy L Hinton, 2005
 Tags: Lilac Chaser, color after-image
*/

boolean active = true;

void setup() {
  size(600, 600);
  background(255);
  frameRate(7);
}

void draw() {
  background(255);
  LilacChaser(300, 300, 400, 12, 70);
}

// Turn off illusion by clicking on it.
void mouseClicked() {
    active = !active;
}

int hidden = 0;

void LilacChaser(float x, float y, float r, int n, float r2) {
  // Draw "X" in the middle.
  line(x-5, y-5, x+5, y+5);
  line(x+5, y-5, x-5, y+5);
  
  for (int i = 0; i < n; i++) {
    float xi = r/2 * cos(i*2*PI/n);
    float yi = r/2 * sin(i*2*PI/n);
    if (i != hidden) {
      drawGradient(x + xi, y + yi, r2);
    }
  }
  if (active) {
    hidden ++;
    hidden %= n;
  }
}

void drawGradient (float x, float y, float radius) {
  pushStyle();
  colorMode(HSB, 360, 100, 100);
  noStroke();
  float h = 0;
  for (float r = radius; r > 0; r -= 1) {
    fill(295, h, 100);
    ellipse(x, y, r, r);
    h += 2;
  }
  popStyle();
}
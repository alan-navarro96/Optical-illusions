boolean active = true;

// Turn off illusion by clicking on it.
void mouseClicked() {
  active = !active;
}

void setup() {
  size(600, 600);
}
float moireX = 300;
int dirMoire = 0; 
final float moireEndingX = 200, moireStartingX = 400;
final float deltaMoire[] = {0.5, -0.5};
void draw() {
  background(255);
  moire(moireX, height/2);
  if (active) {
    moireX += deltaMoire[dirMoire];
    if(moireX == moireEndingX || moireX == moireStartingX) {
      dirMoire = 1 - dirMoire;
    }
  }
}

void moire(float x, float y) {
  stroke(10, 153, 0);
  drawInnerCircles(width/2, height/2, 20, 2*width/3, 5);
  stroke(0, 0, 255);
  drawInnerCircles(x, y, 10, 2*width/3, 5);
}

void drawInnerCircles(float x, float y, float minRadius, float MaxRadius, float space) {
  pushStyle();
  strokeWeight(space);
  noFill();
  for (float r = minRadius; r <= MaxRadius; r += space*4) {
    ellipse(x, y, r, r);
  }
  popStyle();
}
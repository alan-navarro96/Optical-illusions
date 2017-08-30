/*
 Induced Contrast Asynchrony
 Author:Shapiro AG, D’Antona AD, Charles JP, Belano LA, Smith JB, Shear-Heyman M (2004)
 Tags: Induced contrast asynchronies
*/
boolean active = true;

// Turn off illusion by clicking on it.
void mouseClicked() {
  active = !active;
}

void setup() {
  size(700, 600);
}

void draw() {
  background(255);
  inducedContrastAsynchrony();
}

int currentColor = 0;
final int deltaColor[] = {10, -10};
int deltaColorId = 0;

// Draws the induced contrast illusion.
void inducedContrastAsynchrony() {
  if (active) {
    pushStyle();
    fill(0);
    rect(0, 0, width/2, height);
    popStyle();
  }
  pushStyle();
  noStroke();
  fill(currentColor);
  currentColor += deltaColor[deltaColorId];
  if (currentColor >= 255 || currentColor <= 0) {
    deltaColorId = 1 - deltaColorId;
  }
  int mainRadius = 200;
  ellipse(200, 300, mainRadius, mainRadius);
  ellipse(500, 300, mainRadius, mainRadius);
  popStyle();
}
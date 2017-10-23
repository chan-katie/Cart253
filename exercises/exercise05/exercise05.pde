// Exercise 05
// by Katie Chan

float t = 0;
int x = 0;
void setup() {
  size(600,600);
  background(0);
  stroke(500);
}
void draw() {
  float n = noise(t);
  float r = random(0,1);
  ellipse(x,n*height,10,10);
  x++;
  t += 0.01;
}
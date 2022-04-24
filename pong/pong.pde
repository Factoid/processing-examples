void setup() {
  size(640,480);
}

float x = 20;
float y = 20;
float s = 20;

void draw() {
  background(0);
  circle(x,y,s);
  if( y >= height - s ){
  }
  y += 1;
}

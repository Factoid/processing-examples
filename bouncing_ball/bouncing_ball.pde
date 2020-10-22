float x,y;
float vy = -10;
float vx = -5;

void setup(){
  size(800,600);
  fill(#6C3D00);
  background(255);
  noStroke();
  x = width/2;
  y = height/2;
}

void draw() {
  clear();
  fill(random(256),random(256),random(256));
  circle(x,y,40);
  x = x + vx;
  y = y + vy;
  if( y <= 0 || y >= height ) vy = -vy;
  if( x <= 0 || x >= width ) vx = -vx;
}

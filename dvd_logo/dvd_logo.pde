float x,y;
float vy = -4;
float vx = -3;
PImage logo;
color c;

void setup(){
  size(800,600);
  fill(#6C3D00);
  background(255);
  noStroke();
  x = width/2;
  y = height/2;
  logo = loadImage("dvd.jpg");
  frameRate(24);
}

void draw() {
  if( frameCount % 48 == 1 ) c = color(random(255),random(255),random(255)); 
  clear();
  tint(c);
  //circle(x,y,40);
  image(logo,x,y,120,80);
  x = x + vx;
  y = y + vy;
  if( y <= 0 || y >= height-80 ) vy = -vy;
  if( x <= 0 || x >= width-120 ) vx = -vx;
  saveFrame("frames/frame####.png");
  if( frameCount > 240 ) exit(); 
}

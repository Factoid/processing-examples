float x,y;
float vy = -0;
float vx = -0;
int score = 0;

void setup(){
  size(800,600);
  fill(#6C3D00);
  background(255);
  noStroke();
  x = width/2;
  y = height/2;
}

void mousePressed() {
  float B = mouseX - x;
  float A = mouseY - y;
  float C2 = (B*B) + (A*A);
  float C = sqrt(C2);
  if( C <= 20 ) {
    score += 1;
    println("HIT!");
  } else {
    println("MISS!");
  }
}

void draw() {
  clear();
  fill(255);
  text("Score : " + score,10,10);
  
  fill(random(256),random(256),random(256));
  circle(x,y,40);
  x = x + vx;
  y = y + vy;
  if( y <= 0 || y >= height ) vy = -vy;
  if( x <= 0 || x >= width ) vx = -vx;
}

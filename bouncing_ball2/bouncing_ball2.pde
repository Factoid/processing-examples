class Target {
  private float x,y;
  private float vy = 0;
  private float vx = 0;
  private boolean alive = true;
  
  public void setLocation( float x, float y ) {
    this.x = x;
    this.y = y;
  }
  
  public void setSpeed( float angle, float velocity ) {
    vx = cos(angle)*velocity;
    vy = -sin(angle)*velocity;
  }

  public void kill() {
    alive = false;
  }
  
  public boolean isHit( float mx, float my ) {
    if( !alive ) return false;
    
    float B = mx - x;
    float A = my - y;
    float C2 = (B*B) + (A*A);
    float C = sqrt(C2);
    return C <= 20;
  }
  
  public void update() {
    if( !alive ) return;
    
    fill(random(256),random(256),random(256));
    circle(x,y,40);
    x = x + vx;
    y = y + vy;
    if( y <= 0 || y >= height ) vy = -vy;
    if( x <= 0 || x >= width ) vx = -vx;
  }
}

Target targets[] = new Target[30];
int score = 0;
float timeLimit = 30;
int ammo;
int maxAmmo = 10;

void setup(){
  size(800,600);
  fill(#6C3D00);
  background(255);
  noStroke();
  for( int i = 0; i < targets.length; ++i ) {
    targets[i] = new Target();
    targets[i].setLocation( random(width), random(height) );
    targets[i].setSpeed( random(2*PI), random(3)+1);
  }
  ammo = maxAmmo;
}

void mousePressed() {
  if( ammo == 0 ) return;
  ammo -= 1;
  
  for( Target target : targets ) {
    if( target.isHit( mouseX, mouseY) ) {
      score += 1;
      target.kill();
    }
  }
}

void draw() {
  float timeLeft = timeLimit - ( millis() / 1000.0f );
  clear();
  if( timeLeft <= 0 ) {
     fill(255,0,0);
     textSize(30);
     textAlign(CENTER,BOTTOM);
     text("Game Over",width/2,height/2);
     textAlign(CENTER,TOP);
     textSize(15);
     text("Score : " + score,width/2,height/2);
  } else {
    fill(255);
    textAlign(LEFT,TOP);
    text("Score : " + score + "\nTime Left: " + timeLeft + "\nAmmo : " + ammo,0,0);
    
    for( Target target : targets ) {
      target.update();
    }
  }
}

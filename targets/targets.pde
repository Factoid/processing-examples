void settings() {
  System.setProperty("jogl.disable.openglcore", "false");
  size( 800, 800, P2D );
}

ArrayList<Target> targets = new ArrayList<Target>();

void setup() {
  targets.add( new Target(50, 50, 4*60) );
}

void draw() {
  background(200);
  if( frameCount % 120 == 0 ) {
    targets.add( new Target(random(width),random(height),4*60));
  }
  
  ArrayList<Target> toRemove = new ArrayList<Target>();
  for( Target t : targets ) {
    t.update();
    t.draw();
    if( !t.alive() ) toRemove.add(t);
  }

  for( Target t : toRemove ) {
    targets.remove(t);
  }
}

void mousePressed()
{  
  if( mouseButton == LEFT ) {
    for( Target t : targets ) {
      if( t.hit(mouseX, mouseY) ) {
        t.destroy();
      }
    }
  } else if( mouseButton == RIGHT ) {
    exit();
  }
}

class Target
{
  float x, y;
  float time;
  float size = 40;
  boolean alive = true;
  
  Target( float x, float y, float t ) {
    this.x = x;
    this.y = y;
    time = t;
  }
 
  void update() {
    time -= 1;
    if( time <= 0 ) destroy();
  }
  
  void destroy() {
    alive = false;
  }
  
  boolean alive() {
    return alive;
  }
  
  void draw() {
    if( !alive ) return;
    
    fill(255,0,0);
    circle(x,y,size);
  }
  
  boolean hit( int px, int py ) {
    if( !alive ) return false;
    
    if( px > x + (size/2) || px < x - (size/2) ) return false;
    if( py > y + (size/2) || py < y - (size/2) ) return false;
    return true;
  }
}

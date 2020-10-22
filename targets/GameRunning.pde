class GameRunning implements State {

  // An individual target object that can be shot, and dies after timeout
  class Target
  {
    private float x, y; // Where is it on the screen?
    private float lifeTime; //How long before it times out?
    private float size = 40; //How big is it?
    private boolean alive = true; //Is it currently alive?
    
    Target( float x, float y, float t ) {
      this.x = x;
      this.y = y;
      lifeTime = t;
    }
   
    void update() {
      lifeTime -= 1;
      if( lifeTime <= 0 ) destroy();
    }
    
    void destroy() {
      alive = false;
    }
    
    boolean alive() {
      return alive;
    }
    
    //Draw the target if we're not dead
    void draw() {
      if( !alive ) return;      
      fill(255,0,0);
      circle(x,y,size);
    }
    
    //Returns true if px,py are inside the circle bounding box, otherwise false. If the target is dead, we're always false 
    boolean hit( int px, int py ) {
      if( !alive ) return false;
      
      if( px > x + (size/2) || px < x - (size/2) ) return false;
      if( py > y + (size/2) || py < y - (size/2) ) return false;
      return true;
    }
  }

  //Constants
  final int reloadTime = 90; //Number of frames we will be unable to fire when reloading
  final int maxAmmo = 10; //Consecutive shots we can fire before we must reload
  final int maxLife = 5; //Number of targets we can miss before game over
  
  ArrayList<Target> targets = new ArrayList<Target>(); // Our active targets
  int score = 0; // Number of targets we've destroyed
  int life = maxLife; // Remaining targets we can miss before game over
  int ammo = maxAmmo; // Remaining shots before we must reload
  int nextFire = 0; // At which frame will we get the ability to fire again?

  GameRunning() {
    targets.add( new Target(random(width),random(height),4*60));
  }

  void draw() {
    background(200);

    spawnNewTargets();
    updateTargets();
    drawUI();
  }
    
  void spawnNewTargets() {
    //Spawn 1-3 rargets every 120 frames
    if( frameCount % 120 == 0 ) {
      for( int i = 0; i < int(round(random(1,3))); ++i ) {
        targets.add( new Target(random(width),random(height),4*60));
      }
    }
  }
  
  void updateTargets() {
    ArrayList<Target> toRemove = new ArrayList<Target>();
    // Go through all the targets
    for( Target t : targets ) {
      // If a target is alive
      if( t.alive() ) {
        // Update it
        t.update();
        // If it timed out, lose a life
        if( !t.alive() ) {
          --life;
          //If we're out of lives, switch to game over state
          if( life == 0 ) {
            state = new GameOver();
          }
        }
      }
      // draw the target
      t.draw();
      // If the target is dead, add it to re remove list
      if( !t.alive() ) toRemove.add(t);
    }
    for( Target t : toRemove ) {
      targets.remove(t);
    }
  }
  
  void drawUI() {
    fill(0);
    textSize(10);
    textAlign(LEFT,TOP);
    text("Score : " + score + "\nAmmo : " + ammo + "\nHealth : " + life,0,0);
    if( frameCount < nextFire ) {
      textSize(40);
      textAlign(CENTER,CENTER);
      text("RELOADING",width/2,height/2);
    }
  }
  
  void mousePressed() {
    switch( mouseButton ) {
      case LEFT:
        if( ammo == 0 ) break; // Can't fire if no ammo
        if( frameCount < nextFire ) break; // Can't fire if reloading
        --ammo; //Use up ammo
        // Destroy first target we hit
        for( Target t : targets ) {
          if( t.hit(mouseX, mouseY) ) {
            t.destroy();
            ++score;
            break;
          }
        }
        break;
      case RIGHT:
        // Refill ammo and set the next fire time into the near future
        ammo = maxAmmo;
        nextFire = frameCount + reloadTime;
        break;
    }
  }
}

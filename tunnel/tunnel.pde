class Ring {
  private float x, y;
  private color c;
  private float size;
  
  public Ring( float s, float c ) {
    size = s;
    x = width/2;
    y = height/2;
    this.c = color(c*255);
  }
  
  void copyPos( Ring r ) {
    this.x = r.x;
    this.y = r.y;
  }
  
  void nudge() {
    x = mouseX;
    y = mouseY;
  }
  
  public void draw() {
    fill(c);
    circle(x,y,size);
  }
}

Ring[] rings = new Ring[15];

void setup() {
  size(800,600);
  noStroke();
  for( int i = 0; i < rings.length; ++i ) {
    rings[i] = new Ring((30+rings.length*40)-(i*40), 1.0f - (i/(float)rings.length));
  }
}

void draw() {
  background(255);
  for( Ring r : rings ) {
    r.draw();
  }
  
  for( int i = 0; i < rings.length-1; ++i ) {
    rings[i].copyPos( rings[i+1] );
  }
  rings[rings.length-1].nudge();
}

float scale = 10.0f;
float timeScale = 1.2f;
PImage ramp;

int[] pVals;
void setup() {
  size(800,600);
  pVals = new int[7];
  ramp = loadImage("blue_flame.png");
  if( ramp != null ) {
    ramp.loadPixels();
  }
//  noiseDetail(4,0.5f);
}

color getCol( int i ) {
  if( ramp != null ) {
    return ramp.pixels[pVals[i]];
  }
  return lerpColor( color(0,0,0), color(0,0,255), pVals[i]/255.0f);
}

int min = 1000;
int max = 0;
int time = 0;
boolean realtime = true;
int maxtime = 0;
float fps = 30.0f;
boolean export = false;

void draw() {
  if( realtime ) {
    time = millis();
  } else {
    time += (int)(1000.0f/fps);
  }
  for( int x = 0; x < 7; ++x ) {
    pVals[x] = (int)min(255,255*noise(x*scale,timeScale * time/1000.0f));
    if( pVals[x] < min ) min = pVals[x];
    if( pVals[x] > max ) max = pVals[x];
  } 
  background(0);
  translate(width/2,height/2);
  noStroke();
  fill( getCol(6) );
  
  int sz = 110;
  circle(0,0,sz);
  for( int i = 0; i < 6; ++i ) {
    float x = sin(i*2.0f*PI/6.0f) * sz*2;
    float y = cos(i*2.0f*PI/6.0f) * sz*2;
    fill( getCol(i) );
    circle(x,y,sz);
  }
  
  if( export ) saveFrame( "frames/####.png" );
  if( maxtime > 0 && time >= maxtime ) {
    exit();
  }
}

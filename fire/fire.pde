float scale = 0.02f;
float timeScale = 1.0f;
PImage[] ramp;
PImage output;
PGraphics pg;
void settings() {
  System.setProperty("jogl.disable.openglcore", "false");
  size(400,400);
//  pg = createGraphics(400,400,P2D);
}

void setup() {  
  frameRate(200);
  ramp = new PImage[2];
  ramp[0] = loadImage("blue_flame.png");
  ramp[1] = loadImage("red_flame.png");
  for( PImage img : ramp ) {
    if( img == null ) continue;
    img.loadPixels();
  }
  output = createImage(400,400,RGB);
  output.loadPixels();
  noiseDetail(3,0.3f);
}

color getCol( int i ) {
  PImage img = ramp[(time/10000)%ramp.length];
  if( img != null ) {
    return img.pixels[i];
  }
  return lerpColor( color(0,0,0), color(0,0,255), i/255.0f);
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
  float dt = time/1000.0f*timeScale;
  for( int i = 0; i < output.pixels.length; ++i ) {
      //output.pixels[i] = getCol( (int)min(255,255*) );
      output.pixels[i] = getCol((int)(255*noise((i%400)*scale+dt,(i/400)*scale+2*dt)));
  }
  output.updatePixels();
  image(output,0,0);
  text(frameRate,20,20);
  if( export ) saveFrame( "frames/####.png" );
  if( maxtime > 0 && time >= maxtime ) {
    exit();
  }
}

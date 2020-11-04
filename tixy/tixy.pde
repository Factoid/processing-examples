void setup() {
  size(640,640);
  noStroke();
  frameRate(30);
}

float tixy( float t, int i, int x, int y ) {
  return -0.5f+x/16.0f+sin(t*PI)*(16-y)/16.0f;
}

void draw() {
  clear();
  for( int x = 0; x < 16; ++x ) {
    for( int y = 0; y < 16; ++y ) {
      float v = tixy(millis()/1000.0f,y*16+x,x,y);
      if( v < -1 ) v = -1;
      if( v > 1 ) v = 1;
      if( v < 0 ) 
        fill(255,0,0);
      else
        fill(255);
      circle( 20 + x*40, 20 + y * 40, abs(v)*39 );
    }
  }
}

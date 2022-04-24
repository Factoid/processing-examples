void setup() {
  size(300,300);
  noStroke();
}

float ripple( float t, float x, float y, float p ) {
  return sin((t-sqrt(x*x+y*y))+p);
}

float rLine( float t, float x, float y, float p ) {
  return sin((t-p*x-y));
}

float tixy_r( float t, float i, float x, float y ) {
  return 0;
  //return ripple(t,x-14,y-8,0);
}

float tixy_g( float t, float i, float x, float y ) {
  return 0;
  //return ripple(t*2,x-0,y-0,PI/6);
}

float tixy_b( float t, float i, float x, float y ) {
  return rLine(t*3,x-0,y-14,1);
}

float tixy_s( float t, float i, float x, float y ) {
  return 1.0;
  //ripple(t*4,x-7.5,y-7.5,PI*3/6);
}

void draw() {
  background(0);
  int i = 0;
  for( int x = 0; x < 16; ++x ) {
    for( int y = 0; y < 16; ++y ) {
      float t = millis()/1000.0f;
      float s = tixy_s(t,i,x,y);
      float r = tixy_r(t,i,x,y);
      float g = tixy_g(t,i,x,y);
      float b = tixy_b(t,i,x,y);
      if( s > 1.0 ) s = 1.0f;
      if( s < 0 ) s = 0f;
      
      fill(r*255,g*255,b*255);
      circle(20*(x+1)-10,20*(y+1)-10,20*s);
      ++i;
    }
  }
}
/*
float ripple( float x, float y, float t, float s ) {
  return sin(t-s*sqrt(x*x+y*y));
}

float ripple( float x, float y, float t ) {
  return ripple(x,y,t,1);
}

float mouseZ = 1.0f;
void mouseWheel(MouseEvent event) {
  mouseZ += event.getCount() * 0.1f;
}
*/

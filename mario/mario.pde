int ground; 
int mSize = 40;
int mPosX = 30;
float mPosY;
float mSpdY = 0;
float gravity = 0.1f;

void setup() {
  size(800,600);
  ground = 2*height/3;
  mPosY = ground - mSize;
}


void draw() {
  if( keyPressed ) {
    if( key == CODED ) {
      switch( keyCode ) {
        case LEFT:
          mPosX -= 1;
          break;
        case RIGHT:
          mPosX += 1;
          break;
      }
    } else {
      switch( key ) {
        case 'a':
          mPosX -= 1;
          break;
        case 'd':
          mPosX += 1;
          break;
        case ' ':
          mSpdY -= 2;
          break;
        }
    }
  }
  
  background(128,128,256);
  fill(128,256,128);
  rect(-1,ground,width+1,height);
 
  
  fill(255,0,0);
  mPosY += mSpdY;
  mSpdY += gravity;
  rect(mPosX,mPosY,mSize,mSize);
}

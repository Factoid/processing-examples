int ground; 
float mSize = 40;
float mPosX = 30;
float mPosY;
float mSpdY = 0;
float gravity = 0.5f;
boolean onGround = true;

boolean jump = false;
boolean left = false;
boolean right = false;

float blockX = 200;
float blockY;
float blockSize = 40;

void setup() {
  size(800,600);
  ground = 2*height/3;
  mPosY = ground - mSize;
  blockY = ground - blockSize;
}

void keyPressed() {
  if( key == CODED ) {
    switch( keyCode ) {
      case LEFT:
        left = true;
        break;
      case RIGHT:
        right = true;
        break;
    }
  } else {
    switch( key ) {
      case 'a':
        left = true;
        break;
      case 'd':
        right = true;
        break;
      case ' ':
        jump = true;
        break;
      }
  }
}

void keyReleased() {
  if( key == CODED ) {
    switch( keyCode ) {
      case LEFT:
        left = false;
        break;
      case RIGHT:
        right = false;
        break;
    }
  } else {
    switch( key ) {
      case 'a':
        left = false;
        break;
      case 'd':
        right = false;
        break;
      case ' ':
        jump = false;
        break;
      }
  }
}

void draw() {
  if( left ) {
    mPosX -= 5;
  }
  if( right ) {
    mPosX += 5;
  }
  if( jump ) {
    if( onGround ) {
      onGround = false;
      mSpdY = -12;  
    }
  }
  
  background(128,128,256);
  fill(128,256,128);
  rect(-1,ground,width+1,height);
  
  fill(255,0,0);
  mPosY += mSpdY;
  mSpdY += gravity;
  
  if( mPosY + mSize > ground ) {
    onGround = true;
    mSpdY = 0;
    mPosY = ground - mSize;
  }

  float dl = (mPosX + mSize) - blockX;
  float dr = mPosX - (blockX + blockSize);
  float dt = (mPosY + mSize) - blockY;
  if( dl > 0 && dt > 0 && dr < 0 ) {
    if( mPosX < blockX + blockSize/2 ) {
      mPosX = blockX - mSize;
    } else {
      mPosX = blockX + blockSize;
    }
  }
  
  rect(mPosX,mPosY,mSize,mSize);
  
  fill(220,120,0);
  rect(blockX,blockY,blockSize,blockSize);
}

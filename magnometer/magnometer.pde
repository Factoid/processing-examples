void setup() {
  size(640,480);
}

float x = 0;
float y = 0;

void mouseClicked() {
  x = mouseX - (width/2);
  y = mouseY - (height/2);
}

void mouseDragged() {
  x = mouseX - (width/2);
  y = mouseY - (height/2);
}

void draw() {
  float extX = height*0.4f;
  float extY = extX;
  
  if( x > extX ) x = extX;
  if( x < -extX ) x = -extX;
  if( y > extY ) y = extY;
  if( y < -extY ) y = -extY;
  
  translate(width/2,height/2);

  background(128);
  stroke(0);
  line(-extX,0,extX,0);
  line(0,-extY,0,extY);

  stroke(255,0,0);
  fill(255,0,0);
  line(0,0,x,0); 
  textSize(12);
  fill(255,0,0);
  textAlign(CENTER,TOP);
  text(x/extX,x/2,-15);
  
  stroke(0,255,0);
  fill(0,255,0);
  line(0,0,0,y);
  textAlign(RIGHT,CENTER);
  text(-y/extY,-15,y/2);
  
  stroke(0,255,255);
  line(0,0,x,y);
  fill(0,255,255);
  circle(x,y,5);

  //Calculate the angle
  float heading = atan2(x,-y);
  //Convert to degrees
  heading = degrees(heading);
  //Convert from [-180, 180] to [0, 360] range
  heading = (heading + 360) % 360;
  
  textSize(32);
  textAlign(RIGHT,BOTTOM);
  text("Heading: " + nfs(heading,3,2), -40, height/2);
}

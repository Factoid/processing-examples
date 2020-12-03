void settings() {
  System.setProperty("jogl.disable.openglcore", "false");
  size(800,800,P3D);
}

void setup() {
  noStroke();
  background(0);
}

void draw() {
  clear();
  camera(0,800,10,0,0,0,0,1,0);
  ambientLight(0,0,0);
  pointLight(255,255,255,0,0,0);
  emissive(255,255,0);
  sphere(50);
  emissive(0);
  fill(0,0,255);
  rotateY(frameCount*2*PI/360/4);
  translate(300,0,0);
  sphere(20);
  rotateY(frameCount*13*2*PI/360/4);
  translate(30,0,0);
  fill(128);
  sphere(5);
}

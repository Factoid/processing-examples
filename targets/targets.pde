interface State {
  void draw();
  void mousePressed();
}

void settings() {
  System.setProperty("jogl.disable.openglcore", "false");
  size( 640, 480 );
}

State state;
//Called once per game
void setup() {
  state = new GameRunning();
}

//Called once per frame
void draw() {
  state.draw();
}

//Called when we click press a mouse button
void mousePressed()
{
  state.mousePressed();
}

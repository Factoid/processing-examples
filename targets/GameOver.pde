class GameOver implements State {

  void draw() {
    background(0);
    fill(255,0,0);
    textSize(60);
    textAlign(CENTER,BOTTOM);
    text("Game Over",width/2,height/2);
    textSize(30);
    textAlign(CENTER,TOP);
    text("Click To Play Again",width/2,height/2);
  }

  void mousePressed() {
    state = new GameRunning();
  }
  
}

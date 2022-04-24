import g4p_controls.*;

GSlider slider;
GView view;
ViewHandler handler;
GTextField minText, maxText;

float x1 = -200, y1 = 0;
float x2 = 200, y2 = 0;
float f = 0.5f;

void setup() {
  size(640,480);  
  view = new GView(this,0,0,width,height-100,JAVA2D);
  handler = new ViewHandler();
  view.addListener(handler);
  
  G4P.setCtrlMode(GControlMode.CENTER);
  slider = new GSlider(this, width/2, height - 50, width*0.6f, 30, 20);
  minText = new GTextField(this, 100, height-50, 40, 40);
  minText.setNumeric( -200.0f, -1.0f, -80.0f );
  minText.setText(str(minText.getValueF()));
  maxText = new GTextField(this, width-100, height-50, 40, 40);
  maxText.setNumeric( 1.0f, 200.0f, 80.0f);
  maxText.setText(str(maxText.getValueF()));
  
  handler.setMin(minText.getValueF());
  handler.setMax(maxText.getValueF());
}

void handleSliderEvents(GValueControl sld, GEvent evt) {
  handler.setF(sld.getValueF());
}

void handleTextEvents(GEditableTextControl tcon, GEvent evt ) {
  if(tcon == minText) {
    handler.setMin(minText.getValueF());
  } else if( tcon == maxText ) {
    handler.setMax(maxText.getValueF());
  }
}

void draw() {
}

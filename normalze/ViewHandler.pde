public class ViewHandler extends GViewListener {
  public float x1 = -250, y1 = 0;
  public float x2 = 250, y2 = 0;
  public float f = 0.5f;
  
  public float min = -40;
  public float max = 40;
  
  public void setF( float f ) {
    this.f = f;
    invalidate();
  }
  
  public void setMin( float f ) {
    min = f;
    invalidate();
  }
  
  public void setMax( float f ) {
    max = f;
    invalidate();
  }
  
  public void update() {
    PGraphics g = getGraphics();
    g.beginDraw();
    g.translate(g.width/2,g.height/2);
    g.background(200);
    g.noStroke();
  
    g.stroke(255,255,0);
    g.line(x1,y1,x2,y2);
    
    g.noStroke();
    g.fill(0,255,0);
    g.circle(x1,y1,20);
    g.fill(255,0,0);
    g.circle(x2,y2,20);
    
    // lerp(a,b,f) is a function that returns a when f = 0, b when f = 1
    // and (a+b)/2 when f = 0.5
    // it's calculated as (a*(1-f)) + (b*f)

    // normalizing is basically an inverse lerp
    // norm(a,b,v) returns 0 when v == a, 1 when v == b, and 0.5 when v == (a+b)/2
    // it's calculated as (v-a)/(b-a)
    // if you want to turn that 0 to 1 value into a -1 to 1 value you double it and subtract 1. 
   
    // Calebrating is just working out the min and max values of a sensor so you can
    // correctly normalize the signal, which makes the math easier to work out
    float fx = lerp(x1,x2,f);
    float fy = lerp(y1,y2,f);
    g.fill(255,255,0);
    g.circle(fx,fy,15);
    
    float fv = lerp(min,max,f);
    g.textAlign(CENTER,BOTTOM);
    g.text(fv,fx,fy-20);
    g.textAlign(CENTER,TOP);
    g.text(f*2-1,fx,fy+20);
    
    g.endDraw();
    validate();
  }
}

int nSliders=3;
Slider sl [] = new Slider [nSliders];
float [] slVal = {0.2,55,100};

void setupsl(){
  sl[0] = new Slider(40, 40*(1), 200, 0, 1, slVal[0], "Slider1", true);
  sl[1] = new Slider(40, 40*(2), 200, 1, 100, slVal[1], "Slider2", true);
  sl[2] = new Slider(40, 40*(3), 200, 1, 200, slVal[2], "Slider3", true);
}
void drawsl(){
  for (int i=0; i<sl.length; i++) sl[i].display();
  for (int i=0; i<sl.length; i++)  slVal [i] = sl [i].value;
}
void presssl(){
  for (int i=0; i<sl.length; i++) if (sl[i].isOver()) sl[i].lock = true; 
}
void releasesl(){
  for (int i=0; i<sl.length; i++) sl[i].lock = false;
}

class Slider {
  float x, y, minX, maxX, value;
  float  minV, maxV, inV;
  boolean lock = false;
  boolean flt = false;
  int bsize=35; 
  String tittle;
  Slider (float posX, float posY, float maxX, float minV, float maxV, float inV, String tittle, boolean flt) {
    this.minX = posX;
    this.x=map(inV, minV, maxV, posX, minX+maxX);
    this.y=posY;
    this.maxX=maxX;
    this.minV=minV;
    this.maxV=maxV;
    this.inV=inV;
    this.tittle=tittle;
    this.flt = flt;
  }
  void display() {
    pushStyle();
    colorMode(RGB,255);
    if (flt) value = map(x, minX, minX+maxX, minV, maxV);  
    else value = int(map(x, minX, minX+maxX, minV, maxV));      
    float mx = constrain(mouseX, minX, minX+maxX );     
    if (lock) x = mx;
    fill(255);
    stroke(200);
    strokeWeight(1);
    rect(minX, y, maxX, 2.5);         
    pushMatrix();

    ellipse(x, y, bsize, bsize);              
    fill(100);  
    textAlign(CENTER, CENTER);
    if (flt) text(nf(value, 0, 2), x+1, y-2);
    else text(int(value), x+1, y-2); 
    textAlign(LEFT, CENTER);
    text(tittle, minX, y-20);
    popMatrix();
    popStyle();
  }   
    void displaymove(float ren) {
      pushStyle();
      colorMode(RGB,255);
    x=map(ren, minV, maxV, minX, minX+maxX);
      if (flt) value = map(x, minX, minX+maxX, minV, maxV);  
    else value = int(map(x, minX, minX+maxX, minV, maxV));      
    float mx = constrain(mouseX, minX, minX+maxX );     
    if (lock) x = mx;
    strokeWeight(1);
    fill(255);
    stroke(200);
    rect(minX, y, maxX, 2.5); 
    pushMatrix();

    ellipse(x, y, bsize, bsize);              
    fill(100);  
    textAlign(CENTER, CENTER);
    if (flt) text(nf(value, 0, 2), x+1, y-2);
    else text(int(value), x+1, y-2); 
    textAlign(LEFT, CENTER);
    text(tittle, minX, y-20);
    popMatrix();
    popStyle();
  }
  boolean isOver() {
    return (x+(bsize/2) >= mouseX) && (mouseX >= x-(bsize/2)) && (y+(bsize/2) >= mouseY) && (mouseY >= y-(bsize/2));
  } 
  float flSlider() {
    return value;
  }
}
int nHouses = 40;
int nOuts = 100;
House [] houses;
Out [] outs;
float learning  = 0.1;   

float window;  //Neighborhood  Radius

void setup() {
  size(1000, 1000);

  setupsl();
  rectMode(CENTER);
  randomHouses();
  setupOuts();
  window = 55;
}
void draw() { 
  background(255);
  drawsl();
    //learning = slVal[0];
    //window  = slVal[1];
  window *= 0.99;
  learning *= 0.999;
  trainAll();
  displayHouses();
  displayOuts();
}
void mousePressed() {
  presssl();
}

void mouseReleased() {
  releasesl();
}
void keyPressed() {
  houses = new House[nHouses];
  for (int i=0; i<nHouses; i++)houses[i] = new House();
}
void randomHouses() {
  houses = new House[nHouses];
  for (int i=0; i<nHouses; i++)houses[i] = new House();
}
void setupOuts() {
  outs = new Out[nOuts];
  for (int i=0; i<nOuts; i++)outs[i] = new Out();
}
void displayHouses() {
  noFill();
  stroke(255, 0, 0);
  for (int i=0; i<nHouses; i++)houses[i].display();
}

void displayOuts() {
  noFill();
  stroke(0);
  for (int i=0; i<nOuts; i++) {
    int i2 =  (i+1)%nOuts;      //Total and modulo to close everything
    line(outs[i].w[0], outs[i].w[1], outs[i2].w[0], outs[i2].w[1]);
  }
}
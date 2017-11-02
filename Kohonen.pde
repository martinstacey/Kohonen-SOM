int findBMU(House h) {
  int win = 0;
  float minDist = width + height;

  for (int i=0; i<nOuts; i++) {

    float d = dist(outs[i].w[0], outs[i].w[1], h.pos[0], h.pos[1]);
    if (d<minDist) {
      minDist = d;
      win = i;
    }
  }
  return win;
}

float Gauss(int k, int j) {
  float f = exp(-sq(j-((k+nOuts)%nOuts))/(2*sq(window)));
  return f;
}

void updateWeights(House h, int winner) {
  for (int j=0; j<nOuts; j++) {
    outs[j].w[0] += learning*Gauss(winner, j)*(h.pos[0] - outs [j].w[0]); 
    outs[j].w[1] += learning*Gauss(winner, j)*(h.pos[1] - outs [j].w[1]);
  }
}


void trainOne (House h){
  int BMUindex = findBMU(h);
  updateWeights(h, BMUindex);
}

void trainAll(){
 for (int i=0; i<nHouses; i++) trainOne(houses[i]); 
  
}
class Out {
  float [] w;

  Out() {
    w= new float [2];
    w[0] = random(0, width);
    w[1] = random(0, height);
  }
}

class House {
  float [] pos;
  House() {
    pos = new float [2];
    pos[0] = random(0, width);
    pos[1] = random(0, height);
  }
  
  void display(){
   rect(pos[0],pos[1],10,10); 
    
  }
    
    
  
}
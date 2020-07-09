class Stroke {
  
  PVector p1;
  PVector p2;
  float weight;
  
  Stroke(PVector p1, PVector p2, float wB) {
    this.p1 = new PVector(p1.x + random(-1,1),p1.y + random(-1,1));
    this.p2 = new PVector(p2.x + random(-1,1),p2.y + random(-1,1));
    this.weight = wB + random(-0.2,0.2);
  }
  
  void show() {
    strokeWeight(this.weight);
    line(this.p1.x,this.p1.x,this.p2.x,this.p2.y);
  }
  
}

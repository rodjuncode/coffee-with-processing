class Stroke {
  
  PVector p1;
  PVector p2;
  float weight;
  
  float chaos;
  
  Stroke(PVector p1, PVector p2, float w, float c) {
    this.chaos = c;
    this.weight = w + random(-0.2,0.2);
    float r = this.weight*this.chaos;
    this.p1 = new PVector(p1.x + random(-r,r),p1.y + random(-r,r));
    this.p2 = new PVector(p2.x + random(-r,r),p2.y + random(-r,r));
  }
  
  void show() {
    strokeWeight(this.weight);
    line(this.p1.x,this.p1.y,this.p2.x,this.p2.y);
  }
  
}

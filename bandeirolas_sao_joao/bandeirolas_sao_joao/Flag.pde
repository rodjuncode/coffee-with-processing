class Flag {
  boolean type;
  PVector position;
  float size;
  color myColor;
  
  float flagWidth;
  float flagHeight;
  float flagCorner;
  
  Flag(boolean t, PVector p, float s, color c) {
    this.type      = t;
    this.position  = p;
    this.size      = s;
    this.myColor   = c;

    this.flagHeight = this.size;
    this.flagWidth  = flagHeight*0.75;
    this.flagCorner = flagHeight*0.6;
  }
  
  void show() {
    push();    
    translate(this.position.x, this.position.y);
    
    fill(this.myColor);
    noStroke();
  
    if (type) {
      beginShape();
      vertex(0,0);
      vertex(this.flagWidth,0);
      vertex(this.flagWidth,this.flagHeight);
      vertex(this.flagWidth/2,this.flagCorner);
      vertex(0,this.flagHeight);
      endShape(CLOSE);
    } else {
      beginShape();
      vertex(0,0);
      vertex(this.flagWidth,0);
      vertex(this.flagWidth,this.flagCorner);
      vertex(this.flagWidth/2,this.flagHeight);
      vertex(0,this.flagCorner);
      endShape(CLOSE);      
    }
    
    pop();
  }
  
  
}

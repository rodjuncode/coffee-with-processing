class Flag {
  int type;
  PVector position;
  float size;
  color myColor;
  
  float flagWidth;
  float flagHeight;
  float flagCorner;
  
  Flag(int t, PVector p, float s, color c) {
    this.type      = t;
    this.position  = p;
    this.size      = s;
    this.myColor   = c;

    this.flagHeight = this.size*0.8;
    this.flagWidth  = this.size*0.6;
    this.flagCorner = this.flagHeight*0.6;
  }
  
  void show() {
    push();    
    translate(this.position.x+this.size*0.2,this.position.y+this.size*0.1);
    
    fill(this.myColor);
    noStroke();
  
    if (this.type == FORK_FLAG_TYPE) {
      beginShape();
      vertex(0,0);
      vertex(this.flagWidth,0);
      vertex(this.flagWidth,this.flagHeight);
      vertex(this.flagWidth/2,this.flagCorner);
      vertex(0,this.flagHeight);
      endShape(CLOSE);
    } else if (this.type == ARROW_FLAG_TYPE) {
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

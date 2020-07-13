class HatchingTile {
 
  PVector position;
  float size;
  int value;
  ArrayList<Stroke> strokes;
  ArrayList<PVector> top;
  ArrayList<PVector> bottom;
  ArrayList<PVector> left;
  ArrayList<PVector> right;
  
  float baseWeight;
  float chaos; 

  final int strokeQty = 10; // <- pode influenciar value
  final float weightWhenSize100 = 2;
  
  HatchingTile(PVector p, float s, int v, float c) {
    this.position = p;
    this.size = s;
    this.value = v;
    this.chaos = c;
    
    this.top = new ArrayList<PVector>();
    this.bottom = new ArrayList<PVector>();
    this.left = new ArrayList<PVector>();
    this.right = new ArrayList<PVector>();
    
    this.strokes = new ArrayList<Stroke>();
    this.baseWeight = this.size/100*this.weightWhenSize100;
    this.update();

    
  }
  
  void show() {
    for (int i = 0; i < this.strokes.size(); i++) {
      this.strokes.get(i).show();
    }
  }
  
  void update() {
    this.updatePoints(); 
    this.updateStrokes();
  }
  
  void updatePoints() {
    // generate points
    this.top.clear();
    this.bottom.clear();
    this.left.clear();
    this.right.clear();
    for (int i = 1; i <= this.strokeQty+1; i++) {
      float strokeSpacing = this.size/(this.strokeQty+1);
      PVector newTop = new PVector(this.position.x+i*strokeSpacing,this.position.y);
      this.top.add(newTop);
      PVector newBottom = new PVector(this.position.x+i*strokeSpacing,this.position.y+this.size);
      this.bottom.add(newBottom);
      PVector newLeft = new PVector(this.position.x,this.position.y+i*strokeSpacing);
      this.left.add(newLeft);
      PVector newRight = new PVector(this.position.x+this.size,this.position.y+i*strokeSpacing);
      this.right.add(newRight);
    }
  }
  
  void updateStrokes() {
    this.strokes.clear();
    if (this.value > 0) { // (1 & 2) //<>//
      for (int i = 0; i <= this.strokeQty; i++) {
        if (i % 2 == 0 || this.value > 1) {
          Stroke s = new Stroke(
            new PVector(this.top.get(i).x,this.top.get(i).y),
            new PVector(this.bottom.get(i).x,this.bottom.get(i).y), 
            this.baseWeight,this.chaos);
          this.strokes.add(s);
        }
      }
    }
    if (this.value > 2) { // (3 & 4) //<>//
      for (int i = 0; i <= this.strokeQty; i++) {
        if (i % 2 == 0 || this.value > 3) {
          Stroke s = new Stroke(
            new PVector(this.left.get(i).x,this.left.get(i).y),
            new PVector(this.right.get(i).x,this.right.get(i).y), 
            this.baseWeight,this.chaos);
          this.strokes.add(s);
        }
      }
    }
    if (this.value > 4) { // (5 & 6) //<>//
      for (int i = 0; i <= this.strokeQty; i++) {
        if (i % 2 == 0 || this.value > 5) {
          Stroke s = new Stroke(
            new PVector(this.top.get(i).x,this.top.get(i).y),
            new PVector(this.left.get(i).x,this.left.get(i).y), 
            this.baseWeight,this.chaos);
          this.strokes.add(s);
        }
      }
      for (int i = 0; i <= this.strokeQty; i++) {
        if (i % 2 == 0 || this.value > 5) {
          Stroke s = new Stroke(
            new PVector(this.bottom.get(i).x,this.bottom.get(i).y),
            new PVector(this.right.get(i).x,this.right.get(i).y), 
            this.baseWeight,this.chaos);
          this.strokes.add(s);
        }
      }      
    }
    if (this.value > 6) { // (7 & 8)
      for (int i = 0; i < this.strokeQty; i++) {
        if (i % 2 == 0 || this.value > 7) {
          Stroke s = new Stroke(
            new PVector(this.top.get(i).x,this.top.get(i).y),
            new PVector(this.right.get(this.strokeQty-1-i).x,this.right.get(this.strokeQty-1-i).y), 
            this.baseWeight,this.chaos);
          this.strokes.add(s);
        }
      }
      for (int i = 0; i < this.strokeQty; i++) {
        if (i % 2 == 0 || this.value > 7) {
          Stroke s = new Stroke(
            new PVector(this.left.get(i).x,this.left.get(i).y),
            new PVector(this.bottom.get(this.strokeQty-1-i).x,this.bottom.get(this.strokeQty-1-i).y), 
            this.baseWeight,this.chaos);
          this.strokes.add(s);
        }
      }         
    }
      

    
  }
  
}

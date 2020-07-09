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

  final int strokeQty = 5;
  final float weightWhenSize100 = 3;
  
  HatchingTile(PVector p, float s, int v) {
    this.position = p;
    this.size = s;
    this.value = v;
    
    this.top = new ArrayList<PVector>();
    this.bottom = new ArrayList<PVector>();
    this.left = new ArrayList<PVector>();
    this.right = new ArrayList<PVector>();
    
    this.strokes = new ArrayList<Stroke>();
    this.baseWeight = this.size/100*this.weightWhenSize100;
    this.generate();
    
  }
  
  void show() {
    for (int i = 0; i < this.top.size(); i++) {
      point(this.top.get(i).x,this.top.get(i).y);  
      point(this.bottom.get(i).x,this.bottom.get(i).y);
      point(this.left.get(i).x,this.left.get(i).y);  
      point(this.right.get(i).x,this.right.get(i).y);
      
    }

  }
  
  void generate() {
    for (int i = 1; i < this.strokeQty; i++) {
      float strokeSpacing = this.size/this.strokeQty;
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
  
}

class ColorTripper {
  ArrayList<PVector> colors;
  PVector currentColor;
  int _index;
  
  ColorTripper() {
    this.currentColor = null;
    this.reset();
  }
  
  void addColor(PVector newColor) {
    this.colors.add(newColor);
    if (this.colors.size() == 1) {
      if (this.currentColor == null) {
        this.currentColor = new PVector(this.colors.get(0).x,this.colors.get(0).y,this.colors.get(0).z);
      }
      this._index = 0;
    } else if (this.colors.size() > 1) {
      this._index = 1; 
    }
  }

  PVector getColor() {
    return this.currentColor;    
  }
  
  ArrayList<PVector> getColors() {
    return this.colors; 
  }
  
  void reset() {
    this.colors = new ArrayList<PVector>();
    this._index = -1;
  }
  
  void move(float rate) {
    if (this.colors.size() > 1) {
      if (this._index == this.colors.size()) {
        this._index = 0;
      }
      if (this.colors.get(this._index).dist(this.currentColor) > 1) {
        PVector newColor = 
          PVector.sub(this.colors.get(this._index),this.currentColor);
        newColor.normalize(); 
        newColor.mult(rate);
        this.currentColor.add(newColor);
      } else {
        if (this._index < this.colors.size()) {
          this._index++;
        }
      }
    }
  }
  
  void move() {
    this.move(1L);  
  }
  
  
  
}

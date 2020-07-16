class ColorTripper {
  ArrayList<PVector> colors;
  PVector currentColor;
  int _index;
  
  ColorTripper() {
    this.colors = new ArrayList<PVector>();
    this.currentColor = new PVector(0,0,0);
    this._index = -1;
  }
  
  void addColor(PVector newColor) {
    this.colors.add(newColor);
    if (this.colors.size() == 1) {
      this.currentColor = new PVector(this.colors.get(0).x,this.colors.get(0).y,this.colors.get(0).z);
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
  
  void move() {
    if (this.colors.size() > 1) {
      if (this._index == this.colors.size()) {
        this._index = 0;
      }
      if (this.colors.get(this._index).dist(this.currentColor) > 1) {
        PVector newColor = 
          PVector.sub(this.colors.get(this._index),this.currentColor);
        newColor.normalize();        
        this.currentColor.add(newColor);
      } else {
        if (this._index < this.colors.size()) {
          this._index++;
        }
      }
    }
  }
  
}

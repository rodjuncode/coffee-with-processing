

ArrayList<HatchingTile> hatching; 

float angulo = 0;
float lado = 50;



void setup() {
  size(700,700);
  
  hatching = new ArrayList<HatchingTile>(); //<>//
  int tilesQty = 8;
  for (int i = 0; i <= tilesQty; i++) {
    for (int j = 0; j <= tilesQty; j++) {
      HatchingTile h = new HatchingTile(new PVector(i*lado,j*lado),lado,i,1);
      hatching.add(h); //<>//
    }
  }
  
}


void draw() {
  background(255); 
  noFill();
  
  translate(100,100);
  
  float c = random(0,20);

  for (int i = 0; i < hatching.size(); i++) {
    this.hatching.get(i).chaos = c;
    this.hatching.get(i).updateStrokes();
    hatching.get(i).show(); 
  }
  
  println(frameRate);
  
}

// BACKLOG
// TODO #3: more levels (10 or 15(!))
// TODO #6: perlin noise for chaos
// TODO #4: animate with chaos
// TODO #5: draw photos

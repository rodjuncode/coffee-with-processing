ArrayList<HatchingTile> hatching;
float size = 20;

float xOff = 0;
float yOff = 0;

int chaos = 1;

void setup() {
  size(700,700);
  
  hatching = new ArrayList<HatchingTile>(); //<>//
  int tilesQty = 35;
  for (int i = 0; i <= tilesQty; i++) {
    for (int j = 0; j <= tilesQty; j++) {
      float n = noise(xOff,yOff);
      int value = Math.round(map(n,0,1,0,8));
      HatchingTile h = new HatchingTile(new PVector(i*size,j*size),size,value,chaos);
      hatching.add(h); //<>//
      yOff += 0.15;      
    }
    xOff += 0.01;
  }
  
}


void draw() {
  background(255);
  noFill();
  
  
  
  for (int i = 0; i < hatching.size(); i++) {
    this.hatching.get(i).chaos = chaos;
    this.hatching.get(i).updateStrokes();
    hatching.get(i).show(); 
  }
  
  chaos += 1;
  
  println(frameRate);
  
  saveFrame("output/#####.png");
  
}

// BACKLOG
// TODO #8: draw photos
// TODO #3: more levels (10 or 15(!))
// TODO #9: paper texture

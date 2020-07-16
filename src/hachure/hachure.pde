ArrayList<HatchingTile> hatching;
float size = 20;

float xOff = 0;
float yOff = 0;

int chaos = 2;

void setup() {
  size(700,700,FX2D);
      
  hatching = new ArrayList<HatchingTile>(); //<>//
  int tilesQty = 35;
  for (int i = 0; i <= tilesQty; i++) {
    for (int j = 0; j <= tilesQty; j++) {
      float n = noise(xOff,yOff);
      int value = Math.round(map(n,0,1,0,8));
      float c = map((i+j),0,2*tilesQty,0,1);      
      float easinC = map(easin(c),0,1,0,2*tilesQty);
      HatchingTile h = new HatchingTile(new PVector(i*size,j*size),size,value,chaos + easinC);
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
    //this.hatching.get(i).chaos = chaos;
    //this.hatching.get(i).updateStrokes();
    hatching.get(i).show(); 
  }
  
  //chaos += 1;
  
  println(frameRate);
  
}

float easin(float x) {
  //return 1 - sqrt(1 - pow(x, 2));
  return 1 - cos((x * PI) / 2);
}


// BACKLOG
// TODO #8: draw photos (maybe videos)
// TODO #9: paper texture
// TODO #3: more levels (10 or 15(!))

// REFERENCES
// * https://easings.net/
// * https://processing.org/reference/environment/ (CTRL+F "FX2D")
// Alexandre Villares (Noite de Processing)
// Berin

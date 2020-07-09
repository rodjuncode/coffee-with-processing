HatchingTile h;

float angulo = 0;
float lado = 250;

void setup() {
  size(700,700);
  h = new HatchingTile(new PVector(0,0), lado, 1);
  
}


void draw() {
  background(50); 
  noFill();
  stroke(255);
  
  translate(100,100);
  
  //int qty = 5;
  //for (int i = 0; i < lado; i+=lado/qty) {
  //  for (int j = 0; j < lado; j+=lado/qty) {
  //    rect(i,j,lado/qty,lado/qty);
  //  }
  //} 
  
  strokeWeight(5);
  stroke(255,0,0);
  h.show();
  
  
}

// BACKLOG
// TODO #1: scale hatching. Limit stroke size
// TODO #2: fill shapes

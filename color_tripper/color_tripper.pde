import peasy.*;

PeasyCam cam;

final int cubeQty = 10;
final int cubeSize = 25;

PVector sub;

Gradient gradient;

ArrayList<PVector> destinations;

void setup() {
  size(700,700,P3D); 
  
  cam = new PeasyCam(this, 1000);
  cam.setMinimumDistance(10);
  cam.setMaximumDistance(2500); 

  gradient = new Gradient();
  for (int i = 0; i < 50; i++) {
    gradient.addColor(new PVector(random(255), random(255), random(255)));
  }
  
    
}

void draw() {
  sub = gradient.getColor();
  destinations = gradient.getColors();

  background(sub.x,sub.y,sub.z);
  translate(-cubeQty/2*cubeSize,-cubeQty/2*cubeSize,-cubeQty/2*cubeSize);

  showSub(sub,color(255),7);
  showDestination(destinations,gradient._index);
  
  gradient.move();

}

void showDestination(ArrayList<PVector> destinations, int currentIndex) {
  // show destination
  for (int i = currentIndex; i < destinations.size(); i++) {
    push();
    stroke(destinations.get(i).x,destinations.get(i).y,destinations.get(i).z);
    noFill();
    translate(destinations.get(i).x,destinations.get(i).y,destinations.get(i).z);
    box(5);
    pop();
  }
}

void showSub(PVector pos, int col, float siz) {
  // show submarine
  push();
  noStroke();
  fill(col);
  translate(pos.x,pos.y,pos.z);
  sphere(siz);
  pop();  
}

void showRGBBox(int cubeQty,int cubeSize) {
  //// rgb box
  for (int i = 0; i <= cubeQty; i++) {
    for (int j = 0; j <= cubeQty; j++) {
      for (int k = 0; k <= cubeQty; k++) {
        push();
        int r = (int) Math.floor(map(i,0,cubeQty,0,255));
        int g = (int) Math.floor(map(j,0,cubeQty,0,255));
        int b = (int) Math.floor(map(k,0,cubeQty,0,255));
        strokeWeight(0.5);
        stroke(color(r,g,b,100));
        fill(color(r,g,b,90));      
        translate(i*cubeSize,j*cubeSize,k*cubeSize);      
        box(cubeSize);
        pop();
      }
    }
  }  
}

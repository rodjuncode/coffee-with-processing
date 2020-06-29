import peasy.*;

PeasyCam cam;

final int cubeQty = 10;
final int cubeSize = 25;

PVector colorSubmarine;
PVector colorDestination;

void setup() {
  size(700,700,P3D); 
  
  cam = new PeasyCam(this, 1000);
  cam.setMinimumDistance(10);
  cam.setMaximumDistance(2500); 
  
  colorSubmarine = new PVector(0,0,255);
  colorDestination = new PVector(38, 70, 83);
  
}

void draw() {
  background(colorSubmarine.x,colorSubmarine.y,colorSubmarine.z);
  //lights();
  
  translate(-cubeQty/2*cubeSize,-cubeQty/2*cubeSize,-cubeQty/2*cubeSize);
    
    
  push();
  noStroke();
  fill(255);
  translate(colorSubmarine.x,colorSubmarine.y,colorSubmarine.z);
  sphere(7);
  pop();

  push();
  noStroke();
  fill(255);
  translate(colorDestination.x,colorDestination.y,colorDestination.z);
  box(5);
  pop();

  //push();
  //stroke(0);
  //strokeWeight(5);
  //line(colorShip.x,colorShip.y,colorShip.z,colorDestination.x,colorDestination.y,colorDestination.z);
  //pop();


  
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

// BACKLOG
// 1) Better modelling
// 2) Moving Color Submarine
// 3) Provide path with several stops for the color submarine
// 4) Background changes with the color where the sub is

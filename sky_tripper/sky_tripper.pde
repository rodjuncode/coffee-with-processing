import peasy.*;

PeasyCam cam;

final int cubeQty = 10;
final int cubeSize = 25;

PVector sub;

ArrayList<PVector> destinations;
int currentDestination = 0;

void setup() {
  size(700,700,P3D); 
  
  cam = new PeasyCam(this, 1000);
  cam.setMinimumDistance(10);
  cam.setMaximumDistance(2500); 
  
  sub = new PVector(38, 70, 83);
  
  destinations = new ArrayList<PVector>();
  
  for (int i = 0; i < 20; i++) {
    destinations.add(new PVector(random(255), random(255), random(255)));
  }
    
}

void draw() {
  background(sub.x,sub.y,sub.z);
  //lights();

  translate(-cubeQty/2*cubeSize,-cubeQty/2*cubeSize,-cubeQty/2*cubeSize);

  // show submarine
  push();
  noStroke();
  fill(255);
  translate(sub.x,sub.y,sub.z);
  sphere(7);
  pop();

  // show destination
  for (int i = currentDestination; i < destinations.size(); i++) {
    push();
    noStroke();
    fill(255);
    translate(destinations.get(i).x,destinations.get(i).y,destinations.get(i).z);
    box(5);
    pop();
  }
  
  // moving submarine
  if (destinations.get(currentDestination).dist(sub) > 1) {
    PVector newDirection = PVector.sub(destinations.get(currentDestination),sub).normalize();
    sub.add(newDirection);
    println(sub.x + "/" + sub.y + "/" + sub.z);  
  } else {
    if (currentDestination < destinations.size() - 1) {
      currentDestination++;
    }
  }
  
    

  // rgb box
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
// 2) Moving Color Submarine [DONE]
// 3) Provide path with several stops for the color submarine [DONE]
// 4) Background changes with the color where the sub is [DONE]

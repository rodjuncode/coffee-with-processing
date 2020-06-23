import peasy.*;

PeasyCam cam;

float flagSize = 100;
final int FORK_FLAG_TYPE   = 0;
final int ARROW_FLAG_TYPE  = 1;
ArrayList<Flag> flags;

void setup() {
  size(700,700);
  colorMode(HSB,360,100,100,100);
  flags = new ArrayList<Flag>();
  

  //cam = new PeasyCam(this, 100);
  //cam.setMinimumDistance(50);
  //cam.setMaximumDistance(2000);  
  
  PVector missingFlag = new PVector((int) Math.floor(random(width/flagSize)),(int) Math.floor(random(height/flagSize)));
  
  for (int i = 0; i < (width/flagSize); i++) {
    for (int j = 0; j < (height/flagSize); j++) {
      if (missingFlag.x != i || missingFlag.y != j) {
        PVector fPosition = new PVector(i*flagSize,j*flagSize);
        Flag f = new Flag((int) Math.round(random(1)),fPosition,flagSize,color(random(360),80,100,90));
        flags.add(f);
      }
    }
  }
  
}

void draw() {
  background(239, 97, 25,100); 
  //lights();
  
  for (int i = 0; i < flags.size(); i++) {
    flags.get(i).show();
  }
  
 
}

// TODO 1: reference point for flag's position and drawing
// TODO 3: flag's rotation
// TODO 4: color palette
// TODO 5: depth! and/or perspective

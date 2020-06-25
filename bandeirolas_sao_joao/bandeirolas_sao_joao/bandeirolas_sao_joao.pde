import peasy.*;

PeasyCam cam;

float flagSize = 70;
final int FORK_FLAG_TYPE   = 0;
final int ARROW_FLAG_TYPE  = 1;
ArrayList<Flag> flags;

void setup() {
  size(700,700,P3D);
  colorMode(HSB,360,100,100,100);
  flags = new ArrayList<Flag>();
  

  //cam = new PeasyCam(this, 100);
  //cam.setMinimumDistance(50);
  //cam.setMaximumDistance(2000);  
  
  //PVector missingFlag = new PVector((int) Math.floor(random(width/flagSize)),(int) Math.floor(random(height/flagSize)));
  
  for (float i = -width*5; i < width*2; i += flagSize) {
    for (int j = -100; j < 7000; j += flagSize) {
      //if (missingFlag.x != i || missingFlag.y != j) {
        PVector fPosition = new PVector(i,140,-j);
        Flag f = new Flag((int) Math.round(random(1)),fPosition,flagSize,color(random(360),80,100,90));
        flags.add(f);
      //}
    }
  }
  
}

void draw() {
  background(239, 97, 25,100); 
  lights();
  
  rotateX(radians(35));
  rotateY(radians(-20));
  
  for (int i = 0; i < flags.size(); i++) {
    flags.get(i).show();
  }
  
 
}

// TODO 1: reference point for flag's position and drawing / flag rotation
// TODO 4: color palette
// TODO 6: "varal" (wire?)
// TODO 7: animation
// TODO 8: rolling flag cone!!!

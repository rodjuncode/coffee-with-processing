import peasy.*;

PeasyCam cam;

float flagSize = 70;
final int FORK_FLAG_TYPE   = 0;
final int ARROW_FLAG_TYPE  = 1;
ArrayList<Flag> flags;
ArrayList<Integer> palette;

void setup() {
  size(700,700,P3D);
  colorMode(HSB,360,100,100,100);
  flags = new ArrayList<Flag>();
 
  // load colors
  palette = new ArrayList<Integer>();
  int _alpha = 90;
  palette.add(new Integer(color(231, 88, 98,_alpha)));
  palette.add(new Integer(color(67, 69, 99,_alpha)));
  palette.add(new Integer(color(4, 98, 91,_alpha)));
  palette.add(new Integer(color(85, 83, 91,_alpha)));
  palette.add(new Integer(color(33, 96, 99,_alpha)));
  palette.add(new Integer(color(0, 0, 100,_alpha)));
  palette.add(new Integer(color(190, 69, 97,_alpha)));

//  cam = new PeasyCam(this, 100);
//  cam.setMinimumDistance(50);
//  cam.setMaximumDistance(2000);  
  
  //PVector missingFlag = new PVector((int) Math.floor(random(width/flagSize)),(int) Math.floor(random(height/flagSize)));
  
  for (float i = -width*6; i < width*2.5; i += flagSize) {
    for (int j = -100; j < 7000; j += flagSize) {
      //if (missingFlag.x != i || missingFlag.y != j) {
        PVector fPosition = new PVector(i,height/2,10-j);
        Flag f = 
          new Flag((int) Math.round(random(1)),fPosition,flagSize,
          color(palette.get((int)Math.floor(random(palette.size())))));
        flags.add(f);
      //}
    }
  }
  
}

void draw() {
  background(239,80,25,100);
  
  rotateX(radians(32));
  rotateY(radians(-15));
  
  for (int i = 0; i < flags.size(); i++) {
    flags.get(i).show();
  }
  
 
}

// BACKLOG
// TODO 9: lights
// TODO 7: animation
// TODO 8: flag tunnel!!!
// TODO 6: "varal" (wire?)
// TODO 1: reference point for flag's position and drawing / flag rotation

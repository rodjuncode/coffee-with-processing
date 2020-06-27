import peasy.*;

PeasyCam cam;

float flagSize = 70;
final int FORK_FLAG_TYPE   = 0;
final int ARROW_FLAG_TYPE  = 1;
ArrayList<Flag> flags;
ArrayList<Integer> palette;

final int flagQtyX = 100;
final int flagQtyZ = 100;

void setup() {
  size(700,700,P3D);
  colorMode(HSB,360,100,100,100);
  flags = new ArrayList<Flag>();
 
  // load colors
  palette = new ArrayList<Integer>();
  int _alpha = 100;
  palette.add(new Integer(color(231, 88, 98,_alpha)));
  palette.add(new Integer(color(67, 69, 99,_alpha)));
  palette.add(new Integer(color(4, 98, 91,_alpha)));
  palette.add(new Integer(color(85, 83, 91,_alpha)));
  palette.add(new Integer(color(33, 96, 99,_alpha)));
  palette.add(new Integer(color(0, 0, 100,_alpha)));
  palette.add(new Integer(color(190, 69, 97,_alpha)));

  //cam = new PeasyCam(this, 100);
  //cam.setMinimumDistance(100);
  //cam.setMaximumDistance(5000);  
  
  for (int j = 0; j < flagQtyZ; j++) {
    for (int i = 0; i < flagQtyX; i++) {       
      PVector flagPosition = new PVector(-i*flagSize,0,-j*flagSize);
      int flagType = (int) Math.round(random(1));
      int randomColor = (int)Math.floor(random(palette.size()));
      int flagColor = color(palette.get(randomColor));
      Flag f = 
        new Flag(flagType,flagPosition,flagSize,flagColor);
      flags.add(f);
    }
  }
 
}

void draw() {
  background(239,80,25,100);
  camera(0, 400, 0, -2500, -2400, -3500, 0.0, 1.0, 0.0);      
     //<>//
  for (int i = 0; i < flags.size(); i++) {
    flags.get(i).show();
  }

}

// BACKLOG
// TODO 10: Camera
// TODO 7: animation
// TODO 8: flag tunnel!!!
// TODO 6: "varal" (wire?)
// TODO 1: reference point for flag's position and drawing / flag rotation

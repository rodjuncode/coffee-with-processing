import peasy.*;

PeasyCam cam;

float flagSize = 70;
final int FORK_FLAG_TYPE   = 0;
final int ARROW_FLAG_TYPE  = 1;
ArrayList<Flag> flags;
ArrayList<Integer> palette;

Gradient gradient;

final int flagQtyX = 90;
final int flagQtyZ = 100;

void setup() {
  size(700,700,P3D);
  //colorMode(HSB,360,100,100,100);
  frameRate(12);
  
  flags = new ArrayList<Flag>();

  // load colors
  palette = new ArrayList<Integer>();
  int _alpha = 255;
  // HSB
  //palette.add(new Integer(color(358, 65, 100,_alpha)));
  //palette.add(new Integer(color(44, 77, 100,_alpha)));
  //palette.add(new Integer(color(83, 81, 79,_alpha)));
  //palette.add(new Integer(color(203, 87, 77,_alpha)));
  //palette.add(new Integer(color(265, 48, 58,_alpha)));

  // RGB
  palette.add(new Integer(color(255, 89, 95,_alpha)));
  palette.add(new Integer(color(255, 203, 59,_alpha)));
  palette.add(new Integer(color(139, 201, 38,_alpha)));
  palette.add(new Integer(color(0, 204, 255,_alpha)));
  palette.add(new Integer(color(255, 255, 255,_alpha)));


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
  
  gradient = new Gradient();
  gradient.addColor(new PVector(0, 5, 10));
  gradient.addColor(new PVector(3, 4, 94));
  gradient.addColor(new PVector(0, 180, 216));
  gradient.addColor(new PVector(3, 4, 94));
 
}

void draw() {
  //background(239,80,25,100); // night
  //background(190, 19, 97,100); // day
  PVector bg = gradient.getColor();
  background(bg.x,bg.y,bg.z,255); 
  camera(0, 400, 0, -2500, -2400, -3500, 0.0, 1.0, 0.0);      

  // copy first row in another array
  ArrayList<Flag> firstRow = new ArrayList<Flag>();
  for (int i = 0; i < flagQtyX; i++) {
    firstRow.add(flags.get(i));
  }

  // removes first row
  for (int i = 0; i < flagQtyX; i++) {
    flags.remove(0);
  }  
  
  // update all flags position, bring them forward
  for (int i = 0; i < flags.size(); i++) {
    flags.get(i).position.z += flagSize; 
  }

  // put the first row's flags in the end of the cluster
  for (int i = 0; i < firstRow.size(); i++) {
    firstRow.get(i).position.z = -(flagQtyZ-1)*flagSize;
    flags.add(firstRow.get(i)); 
  }
     //<>//
  for (int i = 0; i < flags.size(); i++) {
    flags.get(i).show();
  }

  gradient.move();

}

// BACKLOG
// TODO 11: adjust camera to look like the results of the last session's peasy cam navigation (28-06)
// TODO 8: flag tunnel!!!
// TODO 6: "varal" (wire?)
// TODO 1: reference point for flag's position and drawing / flag rotation

import peasy.*;

final int xSpacing = 30;
final int ySpacing = 30;
float[][] zAxis;
final int zDelta = 50;
final float zBasis = 50;

float xOff = 0;
float yOff = 0;
float movingXOffset = 0;
float movingYOffset = 0;
final float maxOffsetMove = 0.02;
final float minOffsetMove = 0.003;
float offsetMove = minOffsetMove;
final float offsetForce = 0.02;

String path;
long lastFileSize;

void setup() {
  size(700,700,P3D);
  
  path = sketchPath();

  File[] files = listFiles(path); // list of files  
  for (int i = 0; i < files.length; i++) {
    File f = files[i];    
    if (f.getName().equals("keyLog.txt")) {
      lastFileSize = f.length();
      break;
    }
  }
}

void draw() {
  background(50);
  colorMode(HSB,360,100,100);
  lights();
  
  fill(#003594);
  noStroke();
 
  File[] files = listFiles(path); // list of files
  for (int i = 0; i < files.length; i++) {
    File f = files[i];    
    if (f.getName().equals("keyLog.txt")) {
      if (f.length() > lastFileSize) {  // key logger is growing
        offsetMove += offsetForce;      // accelerate
        if (offsetMove > maxOffsetMove) {
          offsetMove = maxOffsetMove;   // wait there!
        }
        lastFileSize = f.length();
      } else {
        offsetMove -= offsetForce*0.005; // not typing
        if (offsetMove < minOffsetMove) {
          offsetMove = minOffsetMove;    // keep moving!
        }
      }
    }
  } 
  
  
    
  float _off = 0.5;
  movingXOffset += offsetMove;
  movingYOffset += offsetMove;
 
  xOff = movingXOffset; 
  zAxis = new float[width+xSpacing+1][height+ySpacing+1];
  for (int i = 0; i <= width; i += xSpacing) {
    yOff = movingYOffset; 
    for (int j = 0; j <= height; j += ySpacing) {
      zAxis[i][j] = map(noise(xOff,yOff),0,1,-50,200) + zBasis;
      yOff += _off;
    }
    xOff += _off;
  }    
    
  beginShape(TRIANGLES);
  for (int i = 0; i <= width; i += xSpacing) {
    for (int j = 0; j <= height; j += ySpacing) {
      // 1st
      vertex(i,j,zAxis[i][j]);
      vertex(i,j+ySpacing,zAxis[i][j+ySpacing]);
      vertex(i+xSpacing,j+ySpacing,zAxis[i+xSpacing][j+ySpacing]);
      // 2nd
      vertex(i,j,zAxis[i][j]);
      vertex(i+xSpacing,j,zAxis[i+xSpacing][j]);
      vertex(i+xSpacing,j+ySpacing,zAxis[i+xSpacing][j+ySpacing]);
    }
  }
  endShape(); 
  
}

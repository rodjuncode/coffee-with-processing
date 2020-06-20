
import peasy.*;

PeasyCam cam;

final int xSpacing = 30;
final int ySpacing = 30;
float[][] zAxis;
final int zDelta = 50;
final float zBasis = 50;


float xOff = 0;
float yOff = 0;
float movingXOffset = 0;
float movingYOffset = 0;
float offsetMove = 0.001;

String path;
long lastFileSize = 0;

void setup() {
  //size(580,500,P3D);
  fullScreen(P3D);
  
  path = sketchPath();

  //cam = new PeasyCam(this, 100);
  //cam.setMinimumDistance(50);
  //cam.setMaximumDistance(2000);

}

void draw() {
  background(50);
  lights();  
  
  fill(0,0,255);
  stroke(0,0,200);

  float _off = 0.5;

  File[] files = listFiles(path); // list of files
  for (int i = 0; i < files.length; i++) {
    File f = files[i];    
    if (f.getName().equals("keyLog.txt")) {
      if (f.length() > lastFileSize) {
        lastFileSize = f.length();
        offsetMove = 0.03;
      } else {
        offsetMove = 0.001;
      }
    }
  }  
  
  //if (mousePressed) {
  //  offsetMove = 0.01; 
  //} else {
  //  offsetMove = 0.001;
  //}
  
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
      // triangulo A
      vertex(i,j,zAxis[i][j]);
      vertex(i,j+ySpacing,zAxis[i][j+ySpacing]);
      vertex(i+xSpacing,j+ySpacing,zAxis[i+xSpacing][j+ySpacing]);
      // triangulo B
      vertex(i,j,zAxis[i][j]);
      vertex(i+xSpacing,j,zAxis[i+xSpacing][j]);
      vertex(i+xSpacing,j+ySpacing,zAxis[i+xSpacing][j+ySpacing]);
    }
  }
  endShape();
  
  
}

// TODO1: acceleration of wave movement
// TODO2: colors!

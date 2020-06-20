
import peasy.*;

PeasyCam cam;

final int xSpacing = 30;
final int ySpacing = 30;
float[][] zAxis;
final int zDelta = 50;

float xOff;
float yOff;

void setup() {
  //size(500,500,P3D);
  
  fullScreen(P3D);

  //cam = new PeasyCam(this, 100);
  //cam.setMinimumDistance(50);
  //cam.setMaximumDistance(2000);

  xOff = 0;
  yOff = 0;
}

void draw() {
  background(50);
  //ambientLight();
  lights();  
  
  fill(0,0,255);
  stroke(0,0,200);

  float offSet = 0.1;
  zAxis = new float[width+xSpacing+1][height+ySpacing+1];
  for (int i = 0; i <= width; i += xSpacing) {
    for (int j = 0; j <= height; j += ySpacing) {
      //zAxis[i][j] = random(-zDelta,zDelta)+50;
      zAxis[i][j] = map(noise(xOff,yOff),0,1,0,100);
      yOff += offSet;
    }
    xOff += offSet;
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

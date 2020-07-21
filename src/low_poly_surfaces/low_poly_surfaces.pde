import processing.sound.*;

// low poly surface movement
final int xSpacing = 30;
final int ySpacing = 30;
final int zDelta = 50;
final float zBasis = 50;
final float maxOffsetMove = 0.03;
final float minOffsetMove = 0.003;
final float offsetForce = 0.01;
float[][] zAxis;
float offsetMove = minOffsetMove;
float xOff = 0;
float yOff = 0;
float movingXOffset = 0;
float movingYOffset = 0;

// keyboard listener
final String KEYBOARD_LISTENER_FILE = "key_log.txt";
String path;
long lastFileSize;

// dynamic color palette
final String PALETTES_FILE = "palettes.txt";
String palette;
int paletteTimer = 0;
int paletteInterval = 10*60*1000; // 10 minutes
ColorTripper surfaceColor;
BufferedReader paletteReader;

// audio listener
FFT fft;
AudioIn in;
int bands = 512;
float[] spectrum = new float[bands];


void setup() {
  //size(700,700,P3D);
  fullScreen(P3D);
  
  // keyboard listener
  initKeyBoardListener();
  
  // first palette
  surfaceColor = new ColorTripper();
  surfaceColor.addColor(new PVector(116, 0, 184));
  surfaceColor.addColor(new PVector(105, 48, 195));
  surfaceColor.addColor(new PVector(94, 96, 206));
  surfaceColor.addColor(new PVector(83, 144, 217));
  surfaceColor.addColor(new PVector(78, 168, 222));
  surfaceColor.addColor(new PVector(72, 191, 227));
  surfaceColor.addColor(new PVector(86, 207, 225));
  surfaceColor.addColor(new PVector(100, 223, 223));
  surfaceColor.addColor(new PVector(114, 239, 221));
  surfaceColor.addColor(new PVector(128, 255, 219));

  // audio listener
  fft = new FFT(this, bands);
  in = new AudioIn(this, 0);
  in.start();
  fft.input(in);

}

void draw() {
  // basics
  lights();
  fill(surfaceColor.getColor().x,surfaceColor.getColor().y,surfaceColor.getColor().z);
  stroke(constrain(surfaceColor.getColor().x,80,255),
         constrain(surfaceColor.getColor().y,80,255),
         constrain(surfaceColor.getColor().z,80,255));
  //noStroke();
  
  offsetMove = minOffsetMove;
  fft.analyze(spectrum);
  float maxSound = 0;
  float minSound = 1000;
  for(int i = 0; i < bands; i++){
    if (spectrum[i] > maxSound) maxSound = spectrum[i];
    if (spectrum[i] < minSound) minSound = spectrum[i];
  } 
  offsetMove += maxSound*0.5;
  
  surfaceColor.move();
  //listenToKeyboard();
  drawLowPolySurface();
  if (millis() > paletteTimer + paletteInterval) {
    grabNewPalette(); //<>//
    paletteTimer = millis();
  }
}


// ###################### low poly surface movement

void drawLowPolySurface() {
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


// ###################### keyboard listener

void initKeyBoardListener() {
  path = sketchPath();
  File[] files = listFiles(path); // list of files  
  for (int i = 0; i < files.length; i++) {
    File f = files[i];    
    if (f.getName().equals(KEYBOARD_LISTENER_FILE)) {
      lastFileSize = f.length();
      break;
    }
  }  
}

void listenToKeyboard() {
  File[] files = listFiles(path); // list of files
  for (int i = 0; i < files.length; i++) {
    File f = files[i];    
    if (f.getName().equals(KEYBOARD_LISTENER_FILE)) {
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
}


// ###################### dynamic color palette

void grabNewPalette() {
  String newPalette = null;
  try {
    paletteReader = createReader(PALETTES_FILE);
    if (paletteReader != null) {
    newPalette = paletteReader.readLine();
    if (newPalette != null) {
        surfaceColor.reset();
        String[] colors = split(newPalette, ",");
        for (int i = 0; i < colors.length; i++) {
          // convert to rgb
          int r = Integer.valueOf(colors[i].substring(1, 3), 16);
          int g = Integer.valueOf(colors[i].substring(3, 5), 16);
          int b = Integer.valueOf(colors[i].substring(5, 7), 16);
          surfaceColor.addColor(new PVector(r,g,b)); // adds new color
        }
        paletteReader.close();
      }
    }
  } catch (IOException e) {
    e.printStackTrace();
  }
}

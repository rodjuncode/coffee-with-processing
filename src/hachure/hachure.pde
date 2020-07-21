import processing.pdf.*;

ArrayList<HatchingTile> hatching;
float size = 10;

float xOff = 0;
float yOff = 0;

int chaos = 2;

PImage originalImg;
int[] contrastImg;
ArrayList<HatchingTile> hatchImg;

void setup() {
  size(1500,500,FX2D);
  noLoop();
      
  //int w = 70;
  //hatchImg = new ArrayList<HatchingTile>();
  //originalImg = loadImage("monroe.jpg");
  //originalImg.loadPixels();
  //int maxBrightness = 255;
  //int minBrightness = 0;
  //for (int p = 0; p < originalImg.pixels.length; p++) {
  //  float b = brightness(originalImg.pixels[p]);
  //  if (b > maxBrightness) {
  //    maxBrightness = (int) Math.floor(brightness(originalImg.pixels[p]));
  //  }
  //  if (b < minBrightness) {
  //    minBrightness = (int) Math.floor(brightness(originalImg.pixels[p]));     
  //  }
  //}
  //for (int p = 0; p < originalImg.pixels.length; p++) {
  //  int j = (int) Math.floor(p/w);
  //  int i = p % w;
  //  int value = (int) Math.floor(map(brightness(originalImg.pixels[p]),minBrightness,maxBrightness,8.99,0));
  //  float c = map((i+j),0,2*w,0,1);      
  //  float easinC = map(easin(c),0,1,0,2*w);
  //  HatchingTile h = new HatchingTile(new PVector(i*size,j*size),size,value,2);
  //  hatchImg.add(h);
  //}
      
  hatching = new ArrayList<HatchingTile>(); //<>//
  int tilesQtyX = 135;
  int tilesQtyY = 35;
  for (int i = 0; i <= tilesQtyX; i++) {
    for (int j = 0; j <= tilesQtyY; j++) {
      float n = noise(xOff,yOff);
      int value = (int) Math.floor(map(n,0,1,0,8.99));
      float c = map((i+j),0,tilesQtyX+tilesQtyY,0,1);      
      float easinC = map(easin(c),0,1,0,tilesQtyX+tilesQtyY);
      HatchingTile h = new HatchingTile(new PVector(i*size,j*size),size,value,chaos + easinC);
      hatching.add(h); //<>//
      yOff += 0.15;      
    }
    xOff += 0.001;
  }
  
  beginRecord(PDF, "hachure.pdf");
  
}


void draw() {
  background(255);
  translate(50,62);
  noFill();
  
  for (int i = 0; i < hatching.size(); i++) {
    //this.hatching.get(i).chaos = chaos;
    //this.hatchImg.get(i).updateStrokes();
    hatching.get(i).show(); 
  }
  
  //chaos += 1;
  //println(frameRate);
  //image(originalImg, 0, 0);
  
  endRecord();
}

float easin(float x) {
  return 1 - sqrt(1 - pow(x, 2));
  //return 1 - cos((x * PI) / 2);
  //return x * x;
}

// REFERENCES
// * https://easings.net/
// * https://processing.org/reference/environment/ (CTRL+F "FX2D")
// Alexandre Villares (Noite de Processing)
// Berin

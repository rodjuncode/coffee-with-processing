float flagSize = 150;

void setup() {
  size(700,700);
}

void draw() {
  background(255); 
  
  Flag f1 = 
    new Flag(true, new PVector(0,0), flagSize, color(#ee4266));
  Flag f2 = 
    new Flag(false, new PVector(flagSize,0), flagSize, color(#ee4266));

  f1.show();
  f2.show();
 
}

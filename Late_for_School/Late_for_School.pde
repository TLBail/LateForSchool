PFont f;

void setup() {
  size(640, 360); 
  noStroke();
  rectMode(CENTER);
  
   // Create the font
  printArray(PFont.list());
  f = createFont("SourceCodePro-Regular.ttf", 24);
  textFont(f);
  textAlign(RIGHT);
}

void draw() {
  background(51); 
  fill(255, 204);
  rect(mouseX, mouseY, width/8, height/4);
  text("Late for school",width/2 , height/8);
  
}

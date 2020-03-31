PFont f;
PImage imgs;
PImage bg;

void setup() {
  bg = loadImage("bg.png");
  size(1080, 720); 
  noStroke();
  rectMode(CENTER);
  
   // Create the font
  printArray(PFont.list());
  f = createFont("SourceCodePro-Regular.ttf", 24);
  textFont(f);
  textAlign(RIGHT);
  
  //load images
  imgs = requestImage("racingcar.png");
 
}

void draw() {
  background(bg); 
  fill(255, 204);
  text("Late for school",width/2 , height/8);
  image(imgs, mouseX-imgs.width/10, height/2, imgs.width/5, imgs.height/5);
}

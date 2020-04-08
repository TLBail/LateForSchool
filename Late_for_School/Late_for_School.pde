PFont f;
PImage voiture ,bg ,tree ,lamp, lampinv; // declarartion nom image


//apelle des class
VoitureJoueur voitureJoueur = new VoitureJoueur();
RouteAnimation[] animation = new RouteAnimation[20];
ArbreAnimation[] arbreAnimation = new ArbreAnimation[3];
LampAnimation[] lampAnimation = new LampAnimation[4];

 //animation variable init
 int state;

void setup() {
  
  size(1920, 1080, P2D); 
  noStroke();
  rectMode(CENTER);
  
   // Create the font
  printArray(PFont.list());
  f = createFont("SourceCodePro-Regular.ttf", 24);
  textFont(f);
  textAlign(RIGHT);
  textSize(40);
  
  //load images
  voiture = requestImage("racingcar.png");
  bg = loadImage("bg.png");
  tree = loadImage("tree.png");
  lamp = loadImage("lamp.png");
 
 //animation route init
 for(int i = 0;i != animation.length;i++){
   animation[i] = new RouteAnimation(i*200);
  
 }
 
 
 //animation arbre init
 for(int i = 0;i != arbreAnimation.length;i++){
   arbreAnimation[i] = new ArbreAnimation(i*tree.height+400);
  
 }
 
 //animation lamp init
 for(int i = 0;i != lampAnimation.length;i++){
   lampAnimation[i] = new LampAnimation(i*lamp.height+200);
  
 }
 
 
 //creation image inversé de lamp
 
   
  loadPixels(); 
  lampinv = createImage(lamp.width, lamp.height, ARGB);
  lampinv.loadPixels();
  lamp.loadPixels();
  for (int y = 1; y < lamp.height; y++) {
    for (int x = 1; x < lamp.width; x++) {
      
      int loc = x + y*lamp.width;
      float a = alpha(lamp.pixels[loc]);
      float r = red(lamp.pixels[loc]);
      float g = green(lamp.pixels[loc]);
      float b = blue(lamp.pixels[loc]);
      
      int newloc = lamp.width-x + y*lamp.height;
      lampinv.pixels[newloc] = color(r, g, b, a);
    }
  }
  lampinv.updatePixels();
}

void draw() {
  
  
  //display title
  fill(255, 204, 100);
  text("Late for school",width/2 , height/8);
  
  //display background
  background(bg); 
  
  
  //animation route
  for (RouteAnimation animate : animation) {
    animate.Animate();
    
  }
  
  //animation arbre
  for (ArbreAnimation arbreAnimate : arbreAnimation) {
    arbreAnimate.Animate();
    
  }


  for (LampAnimation lampAnimate : lampAnimation) {
    lampAnimate.Animate();
    
  }

  //deplace la voiture du joueur
  voitureJoueur.SuivreSouri();
  
  
}

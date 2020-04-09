import processing.sound.*;

SoundFile file;
  
//put your audio file name here
String audioName = "data/sample.mp3";
String path;
  
  
PFont f;
PImage voiture ,bg ,tree ,lamp, lampinv ,casette; // declarartion nom image


//apelle des class
VoitureJoueur voitureJoueur = new VoitureJoueur();
RouteAnimation[] animation = new RouteAnimation[20];
ArbreAnimation[] arbreAnimation = new ArbreAnimation[4];
LampAnimation[] lampAnimation = new LampAnimation[2];
Spotlight[] spotlight = new Spotlight[2];

 //animation variable init
 int state;
 int speed;

void setup() {
  
  // for more info about sketchPath, go to https://processing.org/discourse/beta/num_1229443269.html
    path = sketchPath(audioName);
    file = new SoundFile(this, path);
    file.play();
    
    
    
  size(1920, 1080, P3D); 
  
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
  casette = loadImage("casette.png");

 
 //animation route init
 for(int i = 0;i != animation.length;i++){
   animation[i] = new RouteAnimation(i*200);
  
 }
 
 
 //animation arbre init
 for(int i = 0;i != arbreAnimation.length;i++){
   arbreAnimation[i] = new ArbreAnimation(i*1000);
  
 }
 
 //animation lamp init
 for(int i = 0;i != lampAnimation.length;i++){
   lampAnimation[i] = new LampAnimation(i*4000);
  
 }
 
 
 //animation lumiere init
 for(int i = 0;i != spotlight.length;i++){
   spotlight[i] = new Spotlight(i*4000);
  
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
  
  speed = (height-mouseY)/40;
  if(speed < 20){
    speed = 20;
    
  }
    
  //ambientLight(200,200,255);
  
  pointLight(50, 50, 50, width/2, height/2, 600);
  

  for (Spotlight spotlightz : spotlight) {
      spotlightz.Lightning();
    
  }
  
  
  //display background
  background(255,255,255); 
  image(bg,0,0,bg.width ,bg.height);

  
  
  
  //animation route
  for (RouteAnimation animate : animation) {
    animate.Animate();
    
  }
  
  //animation arbre
  for (ArbreAnimation arbreAnimate : arbreAnimation) {
    arbreAnimate.Animate();
    
  }


   

  //deplace la voiture du joueur
  voitureJoueur.SuivreSouri();
  
  for (LampAnimation lampAnimate : lampAnimation) {
    lampAnimate.Animate();
    
  }
  
  //display title
  fill(255, 204, 100);
  text("Late for school",width/2 , height/8);
  text("By Théo Le Bail",width-100 , height-30);
  
  image(casette,500,500,casette.width/2 ,casette.height/2);

  
}

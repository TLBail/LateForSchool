import processing.sound.*;

SoundFile file;
  
//put your audio file name here
String audioName = "data/sample.mp3";
String path; 


PFont f;


PImage bg; // declarartion nom image


//apelle des class
VoitureJoueur voitureJoueur = new VoitureJoueur();
RouteAnimation[] animation = new RouteAnimation[20];
ArbreAnimation[] arbreAnimation = new ArbreAnimation[4];
LampAnimation[] lampAnimation = new LampAnimation[1];
Spotlight[] spotlight = new Spotlight[1];

//animation variable init
final int speed = 20;

 
 boolean gomusic = true;
 
// This will keep track of whether the thread is finished
boolean finished = false;
// And how far along
float percent = 0;

void loadData(){
  finished = false;
   path = sketchPath(audioName);
  file = new SoundFile(this, path);
  percent++;
  //load images
  bg = loadImage("bg.png");
  percent++;
  tree = loadImage("tree.png");
  percent++;
  lamp = loadImage("lamp.png");
  percent++;
  casette = loadImage("casette.png");
  percent++;
  casette2 = loadImage("casette2.png");
  percent++;
  f = createFont("SourceCodePro-Regular.ttf", 24);
  percent++;
  svoiture = loadShape("Chevrolet_Camaro_SS_Low.obj");
  svoiture.translate(0,0,10);
  svoiture.rotateX(1.2);
  percent++;
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
  percent++;
 
  finished = true;

 }
 
 
void setup0() {
  
  // for more info about sketchPath, go to https://processing.org/discourse/beta/num_1229443269.html
  file.loop();

  noStroke();
  rectMode(CENTER);
  
   // Create the font
  printArray(PFont.list());
  textFont(f);
  textAlign(RIGHT);
  textSize(40);
  
  //animation route init
  for(int i = 0;i != animation.length;i++){
    animation[i] = new RouteAnimation(i*200);
  
  }
 
 
  //animation arbre init
  for(int i = 0;i != arbreAnimation.length;i++){
    arbreAnimation[i] = new ArbreAnimation(i*1000);
  
  }
 
  //animation lamp init animation lumiere init
  for(int i = 0;i != lampAnimation.length;i++){
    lampAnimation[i] = new LampAnimation(i*4000);
    spotlight[i] = new Spotlight(i*4000);
  
  }
}

void draw0() {
  pointLight(50, 50, 50, width/2, height/2, 600);
  
  //animation lumiere
  for (Spotlight spotlightz : spotlight) {
      spotlightz.Lightning();  
  }//for
  
  //display background
  background(255,255,255); 
  image(bg,0,0,bg.width ,bg.height);
  
  //animation route
  for (RouteAnimation animate : animation) {
    animate.Animate();
  }//for
  
  //animation arbre
  for (ArbreAnimation arbreAnimate : arbreAnimation) {
    arbreAnimate.Animate(); 
  }//for
  
  //deplace la voiture du joueur
  voitureJoueur.SuivreSouri();
  //animation lampadaire
  for (LampAnimation lampAnimate : lampAnimation) {
    lampAnimate.Animate();
  }//for
  
  title(); 
  CasetteAnim();
  infoEnPlus();
  
}

//variable pour l'état de la casette
int imgstate = 0;
PImage casette, casette2;

void CasetteAnim(){
  
  if(mousePressed && mouseX > 1650 && mouseX < 1650+casette.width && mouseY > 800 && mouseY < 800+casette.width){
    if(gomusic){
    gomusic = false;
    }else{
      gomusic = true;
      file.loop();
    }      
  }  
  if(!gomusic){
    image(casette,1650,800,casette.width/2 ,casette.height/2);
    file.stop();
    
  }else{
    imgstate++;
    if(imgstate < 5){
      image(casette,1650,800,casette.width/2 ,casette.height/2);
    }
    if(imgstate >= 5){
      image(casette2,1650,800,casette.width/2 ,casette.height/2);
    }
    if(imgstate >= 10 ){
      imgstate = 0; 
    }
  }
    
}


void title(){
  //display title
  fill(255, 204, 100);
  text("Late for school",width/2 , height/8);
  text("By Théo Le Bail",width-100 , height-30);
}


void infoEnPlus(){
  if(key == 'a' && keyPressed){
    fill(255, 204, 100);
  text(  mouseX + " : mouseX"  , 500, height-100);
  text(mouseY +" : mouseY" , 500, height-200);
  }
} 

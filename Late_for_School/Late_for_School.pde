PFont f;
PImage imgs ,bg ,tree;

//apelle des class
VoitureJoueur voitureJoueur = new VoitureJoueur();
RouteAnimation[] animation = new RouteAnimation[20];
ArbreAnimation[] arbreAnimation = new ArbreAnimation[3];

 //animation variable init
 int state;

void setup() {
  
  size(1920, 1080); 
  noStroke();
  rectMode(CENTER);
  
   // Create the font
  printArray(PFont.list());
  f = createFont("SourceCodePro-Regular.ttf", 24);
  textFont(f);
  textAlign(RIGHT);
  textSize(40);
  
  //load images
  imgs = requestImage("racingcar.png");
  bg = loadImage("bg.png");
  tree = loadImage("tree.png");
 
 //animation
 for(int i = 0;i != animation.length;i++){
   animation[i] = new RouteAnimation(i*200);
  
 }
 
 for(int i = 0;i != arbreAnimation.length;i++){
   arbreAnimation[i] = new ArbreAnimation(i*tree.height+400);
  
 }
 
 
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


  //deplace la voiture du joueur
  voitureJoueur.SuivreSouri();
  
  
}

class Voiture  {
  float posx;
  float posy;
  int sizeFactor;
  
  void Move(float newposx, float newposy) {
    posx = newposx;
    posy = newposy;
  }
  
  void Size (int newSizeFactor){
    sizeFactor = newSizeFactor;
  }
  
}

class VoitureJoueur extends Voiture{
  
  VoitureJoueur(){
    posy = height*8;
    sizeFactor = 4;
  }
  
  void SuivreSouri(){
    posx = mouseX;
    if(mouseX <= 400){
      posx = 400;
    }
    if(mouseX >= width-400){
      posx = width-400;
    }
    
    image(imgs, posx, posy, imgs.width/sizeFactor, imgs.height/sizeFactor);
    
  }
  
}

class Decor{
  int speed = 10;
  int state;
  
  
  void Speed(int newspeed){
    speed = newspeed;
    
  }
}



class RouteAnimation extends Decor{
  
  
  RouteAnimation(int newstate){
    state = newstate;
  }
  
  void Animate(){
    state = state + speed;
    fill(255,204,100);
    rect(width/2, state, 50, 100);
    fill(0 , 0, 0);
    rect(width/2, state+100, 50 ,100);
    if(state >= height){
      state = -160;
      
    }
  
  }
}




class ArbreAnimation extends Decor{
  
  ArbreAnimation(int newstate){
    state = newstate;
  }
  
  void Animate(){
    state = state + speed;
    image(tree, 100, state, imgs.width/2, imgs.height/2);
    image(tree, width-300, state, imgs.width/2, imgs.height/2);
    if(state >= height){
      state = -160;
      
    }
    
  }
  
}

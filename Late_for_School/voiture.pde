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
    
    image(voiture, posx, posy, voiture.width/sizeFactor, voiture.height/sizeFactor);
    
  }
  
}

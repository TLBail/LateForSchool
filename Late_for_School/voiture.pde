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
<<<<<<< HEAD
<<<<<<< HEAD
    
   // posx = mouseX-50;
    
    
    if(mouseX-posx >= 50 || posx-mouseX >= 50){
      acceleration = acceleration + 0.1;
      
    }else if(mouseX-posx <= 50 || posx-mouseX <= 50){
       acceleration = acceleration - 0.1;
       
    }

    
    if(acceleration > 10){
       acceleration = 10;
       
=======
    posx = mouseX;
    if(mouseX <= 400){
      posx = 400;
>>>>>>> parent of fe740ce... lumiere music et bord corrigé
=======
    posx = mouseX;
    if(mouseX <= 400){
      posx = 400;
>>>>>>> parent of fe740ce... lumiere music et bord corrigé
    }
    if(mouseX >= width-400){
      posx = width-400;
    }
    
    image(voiture, posx, posy, voiture.width/sizeFactor, voiture.height/sizeFactor);
    
  }
  
}

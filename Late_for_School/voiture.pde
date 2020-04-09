class Voiture  {
  float posx;
  float posy;
  int sizeFactor;
  float acceleration = 0;
  
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
    
   // posx = mouseX-50;
    float dif = mouseX-posx;
    
    if(dif >= 100){
      acceleration = acceleration + 0.2;
      
    }
    
    if( dif <= 7){
      acceleration = acceleration - 0.2;
      
    }
    
    if(dif <= 100 && dif >= 50){
       acceleration = acceleration + 0.1;
       
    }
    if(dif <= 50 && dif >= 7){
       acceleration = acceleration - 0.1;
       
    }
    
    if(acceleration > 8){
       acceleration = 8;
       
    }


      
    if(mouseX-50 >= posx){
      posx = posx + acceleration;
      
    }
    
    if(mouseX-50 <= posx){
      posx = posx + acceleration;
      
    }
    
    if(posx <= 550){
      posx = 550;
      if(acceleration < -1){
        acceleration = -1;
        
      }
    }
    
    
    if(posx >= width-600){
      posx = width-600;
      if(acceleration > 1){
        acceleration = 1;
        
      }
    }
    
    image(voiture, posx, posy, voiture.width/sizeFactor, voiture.height/sizeFactor);
    
    fill(255, 204, 100);
    text(dif,400, 400);
    
  }
  
}

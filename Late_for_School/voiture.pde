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
    
    
    if(mouseX-posx >= 50 || posx-mouseX >= 50){
      acceleration = acceleration + 0.1;
      
    }else if(mouseX-posx <= 50 || posx-mouseX <= 50){
       acceleration = acceleration - 0.1;
       
    }

    
    if(acceleration > 10){
       acceleration = 10;
       
    }


      
    if(mouseX-50 >= posx){
      posx = posx + acceleration;
      
    }
    
    if(mouseX-50 <= posx){
      posx = posx - acceleration;
      
    }
    
    if(mouseX <= 600 && posx <= 650){
      posx = 550;
    }
    
    
    if(mouseX >= width-550 && posx >= width-600){
      posx = width-600;
    }
    
    image(voiture, posx, posy, voiture.width/sizeFactor, voiture.height/sizeFactor);
    
  }
  
}

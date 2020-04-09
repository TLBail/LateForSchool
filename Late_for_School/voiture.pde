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
    
    // ON Recupere la difference entre la souris et la position de la voiture
    float dif = mouseX-posx;
    
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////acceleration a droite ou a gauche en fonction de la position de la souris ////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
    
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////LIMITE POUR L4ACCELERATION ///////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if(acceleration > 8){
       acceleration = 8;
       
    }  
    
    if(acceleration < -8){
       acceleration = -8;
       
    }
    
     //////////////////////////////////////////////////////////////////////////////////////////////////////////////
     ///////////ON APPLIQUE LACCELERATION A LA POSITION DE LA VOITURE//////////////////////////////////////////////
     //////////////////////////////////////////////////////////////////////////////////////////////////////////////


    posx = posx + acceleration;
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////LIMITE POUR LA VOITURE///////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////Affichage de la voiture///////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////
    image(voiture, posx, posy, voiture.width/sizeFactor, voiture.height/sizeFactor);
    
    fill(255, 204, 100);
    text(acceleration,400, height-200);
    text(posx,400, height-300);
    
  }
  
}

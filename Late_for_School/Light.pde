class Light{
  int state;
  
}


class Spotlight extends Light{
  
  
  Spotlight(int newstate){
    state = newstate;
    
  }
  
  
  
  void Lightning(){
     state = state + 20;
     /*
     pointLight(255, 255, 20, 300, state, 1);
     pointLight(255, 255, 20, 1800, state, 60);
     
     */
     spotLight(243, 124, 19, 500, state, 3915, 0, 0, -1, PI/2, 58); 
     spotLight(243, 124, 19, 1450, state, 3915, 0, 0, -1, PI/2, 58); 
    
     if(state >= height*5){
      state = -height*5;
      
     }
     
     
     spotLight(243, 200, 19, voitureJoueur.posx+50, 700, map(1600, 0, width, 0, 1000), 0, -0.4, -1, PI/2, map(600, 0, height, 0, 10)); 
   
  }
  
  
  
}

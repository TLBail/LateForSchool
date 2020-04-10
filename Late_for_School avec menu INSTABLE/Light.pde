class Light{
  int state;
  
}


class Spotlight extends Light{
  
  
  Spotlight(int newstate){
    state = newstate;
    
  }
  
  
  
  void Lightning(){
     state = state + 20;
     pointLight(255, 255, 20, 300, state, 60);
     pointLight(255, 255, 20, 1800, state, 60);
     
     if(state >= height*3){
      state = -4000;
      
    }
   
  }
  
}

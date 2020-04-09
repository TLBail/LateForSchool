class Decor{
  int speed = 20;
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
    image(tree, 100, state, tree.width/2, tree.height/2);
    image(tree, width-300, state, tree.width/2, tree.height/2);
    if(state >= 4000){
      state = -tree.height;
      
    }
    
  }
  
}

class LampAnimation extends Decor {
  
  
  LampAnimation(int newstate){
    state = newstate;
    
  }
  
  void Animate(){
    state = state + speed;
    
   
    
    image(lamp, 300, state, lamp.width/2, lamp.height/2);
    image(lampinv, 1450, state, lamp.width/2, lamp.height/2);
    
    
     
    if(state >= height*3){
      state = -4000;
      
    }
    
  }
  
}

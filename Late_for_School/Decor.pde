PImage tree ,lamp, lampinv;

class Decor{
  
  int state;
}



class RouteAnimation extends Decor{
  
  
  RouteAnimation(int newstate){
    state = newstate;
  }
  
  void Animate(){
    state = state + speed;
    fill(255,255,200);
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
    
    fill(255,225,20,50);
    circle(500, state+100, 200);
    circle(1450, state+100, 200);
     
    if(state >= height*5){
      state = -height*5;
      
    }
    
  }
  
}

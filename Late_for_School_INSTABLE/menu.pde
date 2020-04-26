// states -------------------------------
// consts: possible values 
final int normal = 0;
final int program0 = 1;
final int program1 = 2;
final int program2 = 3;
final int load = 4;
int states = normal; // var: current value
 
// buttons --------------------------
Button[] buttons;
  

import processing.video.*;
Movie myMovie;


void movieEvent(Movie m) {
  m.read();
}

public void settings() {
  size(1920, 1080, "processing.opengl.PGraphics3D");
}
void setup() {
  
  
  // these are local vars (their scope is only setup()
  int countButton = 3;
  int sizeButton = 120;
  
  
  
  // declare the array of the buttons
  buttons = new Button[countButton]; 
   myMovie = new Movie(this, "synthbg.mp4");
   myMovie.loop();
   
   
  // creating the buttons ---------------------------
  for (int i = 0; i < countButton; i++) {
    buttons[i] = new Button(i*width/3+sizeButton, height-200, 
    sizeButton, 
    color(255, 0, 0), color(0, 255, 0), color(0, 0, 255), 
    i);
  } // for 
  
  
  thread("loadData");
  //
} // func 
 
void draw() {
  background(0,0,0);
  image(myMovie, 0, 0, width , height);
  // eval state 
  if (states==normal) {
    textSize(60);
    text("LATE FOR SCHOOOL", width/2, height/4);
    // short version of a for-loop
    for (Button but : buttons) {
      but.update();
      but.display();
    }
  } else if (states==program0) {
    draw0();
  }else if (states==load) {
     background(0);
  
    // If we're not finished draw a "loading bar"
    // This is so that we can see the progress of the thread
    // This would not be necessary in a sketch where you wanted to load data in the background
    // and hide this from the user, allowing the draw() loop to simply continue
    if (!finished) {
      stroke(255);
      noFill();
      rect(width/2-150, height/2, 300, 10);
      fill(255);
      // The size of the rectangle is mapped to the percentage completed
      float w = map(percent, 0, 10, 0, 300);
      rect(width/2-150, height/2, w, 10);
      textSize(14);
      textAlign(CENTER);
      fill(255);
      text("Loading", width/2, height/2+30);
    }else {
      textAlign(CENTER);
      textSize(24);
      fill(255);
      text("Finished loading.", width/2, height/2);
      setup0(); 
      states=program0;
    }
  } else {
    // error 
    println ("Unknown state (error #965)");
  }
  
} // func 
 
//-------------------------------------------------
// Inputs 
 
void mousePressed() {
  if (states==normal) {
    for (Button but : buttons) {
      but.press();
      if (but.pressed) {
          states = 4;
        break; // Other buttons won't be pressed, just stop
      } // if
    } // for
  }
} // func 
 
void evalButton(Button but) {
  println(but.index);
  if (but.index==0) { 
    setup0(); 
    states=program0;
  } else {
    println ("Unknown button index (error #1165)");
  }
} // func 
 
void mouseReleased() {
  for (Button but : buttons) {
    but.release();
  }
} // func
 
// ------------------------------------------
// classes 
 
class Button {
 
  int x, y; // The x- and y-coordinates
  int size; // Dimension (width and height)
  color baseGray; // Default gray value
  color overGray; // Value when mouse is over the button
  color pressGray; // Value when mouse is over and pressed
  boolean over = false; // True when the mouse is over
  boolean pressed = false; // True when the mouse is over and pressed
  int index; // index
 
  // the constructor (the underscore _ says I'm temp)
  Button(int xp_, int yp_, 
  int s_, 
  color b_, 
  color o_, 
  color p_, 
  int index_ ) {
    x = xp_;
    y = yp_;
    size = s_;
    baseGray = b_;
    overGray = o_;
    pressGray = p_;
    index=index_;
  } // the constructor 
 
  // Updates the over field every frame
  void update() {
    if ((mouseX >= x) && (mouseX <= x + size) &&
      (mouseY >= y) && (mouseY <= y + size)) {
      fill(255,255,20);
      rect(x,y,size,size);
      over = true;
    } else {
      fill(255,20,255);
      rect(x,y,size,size);
      over = false;
    }
  }
 
  boolean press() {
    if (over == true) {
      pressed = true;
      return true;
    } else {
      pressed = false;
      return false;
    }
  }
 
  void release() {
    pressed = false;
  }
 
  void display() {
    fill(0, 255, 0);
    textSize(30);

    if(index == 0){
      text("LETS GOOO", x+size+17, y+size/2);
      
    }
    if(index == 1){
      text("OPTION", x+size+17, y+size/2);
      
    }
    if(index == 2){
      text("QUIT", x+size+17, y+size/2);
      
    }

  }
}
// ==============================================

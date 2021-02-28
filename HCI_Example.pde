// Use COLORS function to save colors
// USE SHAPE FUNCTION TO SAVE SHAPE
// s = createShape()
// s.beginShape()
// s.noStroke(); exmaple
// s.vertex(0, 0) ...
// ... 
// s.endShape()

//look at examples from Shape()

// arc() function to do timer countdown shape

//mouseY and mouseX as well as pmouseX? (for previous frame pos)
// also a lot of mouse variables and action (mouseClick, etc)

// function to getCurrentTime() ??

// import ControlP5.*; for a lot of features (slides, dropdowns, buttons, etc) [or create widgets yourself]

// create different classes for each feature (button, menu, etc)

// OVERALL PLANNING
// Use setup() to draw static objects that do not change
// mouseCapture function to determine coordinate of mouse click and its desired function (which button was pressed)
// user feedback (sound)
// animation? door opening 


int timer = 0;
float countdown = 2 * PI;

int button_input_global = 0;

boolean running = false;
int[] input = {0,0,0,0};
int inp_cnt = 3;

color white = color(255,255,255);
color background_gray = color(76,76,76);

// setup is called on startup
void setup() {
  size(900, 525);
  
  background(background_gray);
  frameRate(1);
  
  // GUI / door border
  fill(white);
  stroke(0,0);
  rect(575,0,10,525);
  
  // static buttons
  num_pad();
  start_button();
  stop_button();
  

  
}


// draw is called after setup
void draw() {
  println(mouseX + "," + mouseY);
  
  fill(200);
  arc(745, 80, 80, 80, 0, 2*PI, PIE);
  fill(0, 200, 0);
  noStroke();
  countdown_arc(countdown);
  //countdown = countdown - ((2*PI)/100);
  
  //timer
  fill(background_gray);
  String minsec[] = countdown();
  textSize(24);
  text(minsec[0] + ":" + minsec[1], 712, 90);
  
  

   if (mousePressed) {
     fill(255);

   } /*else {
     fill(255);
   }*/
   //ellipse(mouseX, mouseY, 80, 80);
   
}

void start_button(){
  stroke(0,0,0);
  fill(50,175,50);
  rect(780, 450, 80, 40);
  
  fill(255,255,255);
  textSize(20);
  text("START", 790, 478);
}

void stop_button(){
  stroke(0,0,0);
  fill(175,50,50);
  rect(620, 450, 80, 40);
  
  fill(255,255,255);
  textSize(20);
  text("STOP", 630, 478);
}

void num_pad() {
  int numpad_x;
  int numpad_y;
  int num_x;
  int num_y;
  int count = 1;
  
  // buttons for 1-9
  
  numpad_y = 180;
  num_y = 187;
  for(int i = 0; i < 3; i++){
    numpad_x = 666;
    num_x = 661;
    numpad_y += 75;
    num_y += 75;
    for(int j = 0; j < 3; j++){
      stroke(255, 255, 255);
      fill(100, 100, 100);
      ellipse(numpad_x, numpad_y, 50, 50);
      
      textSize(19);
      fill(255, 255, 255);
      text(count++, num_x, num_y);
      numpad_x += 75;
      num_x += 75;
    }
  }
  // 0 button
  
  stroke(255, 255, 255);
  fill(100, 100, 100);
  ellipse(741, 472, 50, 50);
  textSize(19);
  fill(255, 255, 255);
  text("0", 736, 479);  
  
  
}

String[] countdown(){
  int mins = timer/60;
  int secs = timer%60;
  //String str_mins = String.valueOf(mins);
  //String str_secs = String.valueOf(secs);
  
  String str_mins = String.valueOf(input[0]) + String.valueOf(input[1]);
  String str_secs = String.valueOf(input[2]) + String.valueOf(input[3]);
  if (timer > 0)
    timer--;
    
  if (secs < 10)
    str_secs = "0" + secs;
  if (mins < 10)
    str_mins = "0" + mins;
    
  String minsec[] = {str_mins,str_secs};
  if(str_mins == "0" && str_secs == "0") { running = false; }
  return minsec;
  
  
  
}

void countdown_arc(float countdown) {
  
  arc(745, 80, 80, 80, 0, countdown, PIE);
  
  
  
}

void increase_30() {
  timer += 30; 
}

void mouseClicked() {
 int mY = mouseY;
 int mX = mouseX;
 
 
 int button_pressed = 0;
 
 
 int row_input = 0;
 // numpad coords detected
 if (640 < mX && mX < 840) {
   if (220 < mY && mY < 510) {
     if(220 < mY && 280 > mY) {row_input = 1;}
     else if (295 < mY && 365 > mY) {row_input = 2;}
     else if (375 < mY && 440 > mY) {row_input = 3;}
     else if (440 < mY && 510 > mY) {row_input = 4;}
     
   }
 }
 switch(row_input) {
       case 1:
         if (640 < mX && mX < 690) {button_pressed = 1;}
         else if (710 < mX && mX < 770) {button_pressed = 2;}
         else if (790 < mX && mX < 845) {button_pressed = 3;}
         break;
       case 2:
         if (640 < mX && mX < 690) {button_pressed = 4;}
         else if (710 < mX && mX < 770) {button_pressed = 5;}
         else if (790 < mX && mX < 845) {button_pressed = 6;}
         break;
       case 3:
         if (640 < mX && mX < 690) {button_pressed = 7;}
         else if (710 < mX && mX < 770) {button_pressed = 8;}
         else if (790 < mX && mX < 845) {button_pressed = 9;}
         break;
       case 4:
         if (620 < mX && mX < 700) {button_pressed = 10;}
         else if (710 < mX && mX < 770) {button_pressed = 0;}
         else if (780 < mX && mX < 860) {button_pressed = 11;}
         break;
     }
 if(button_pressed == 11) { running = true; }
 println(button_pressed);
 
 if(running == false) {input[inp_cnt--] = button_pressed;}
 
 button_input_global = button_pressed;
 
 
}

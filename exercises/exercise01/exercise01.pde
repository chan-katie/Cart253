// variable for circle speed
final int CIRCLE_SPEED = 7; 
// variable fill color of circle
final color NO_CLICK_FILL_COLOR = color(250, 100, 100);
// variable fill color when you click on the circle  
final color CLICK_FILL_COLOR = color(100, 100, 250); 
// variable background of the sketch
final color BACKGROUND_COLOR = color(250, 150, 150); 
// variable for stroke color of the circle
final color STROKE_COLOR = color(250, 150, 150); 
// variable for size of the circle 
final int CIRCLE_SIZE = 50; 

// variable for x location of circle
int circleX; 
// variable for y location of circle
int circleY; 
// variable for speed on x axis
int circleVX; 
// varaible for speed on y axis 
int circleVY;


  // setup()
  //
  // sets the inital size, background etc. 
  
void setup() { 
  // set screen size to 640px by 480px
  size(640, 480); 
  // set the inital x coordinate for location of the ball
  circleX = width/2; 
  // set intial y coordinate for location of the ball
  circleY = height/2; 
  // set values of the circleVX variable
  circleVX = CIRCLE_SPEED; 
  // set values of the circleVY variable
  circleVY = CIRCLE_SPEED;
  // set stroke color of circle
  stroke(STROKE_COLOR);
  // set intial fill color of circle
  fill(NO_CLICK_FILL_COLOR);
  // set inital the background color
  background(BACKGROUND_COLOR);
}

//draw()
//loops code forever untill you tell it to stop 
//make sure the circles stay on the screen and change fill color if the mouse touches a circle 

void draw() {
  
  // if/else statement
  //if specific conditions are meant execute a certain code if not run another code
  // if the mouse touches the circle change the fill color to variable CLICK_FILL_COLOR
  // else keep the fill color the variable NO_CLICK_FILL_COLOR
  
    if (dist(mouseX, mouseY, circleX, circleY) < CIRCLE_SIZE/2) {
    fill(CLICK_FILL_COLOR);
  }
  else {
    fill(NO_CLICK_FILL_COLOR);
  }
  // draw a circle each frame based on values set by variables  
  ellipse(circleX, circleY, CIRCLE_SIZE, CIRCLE_SIZE);
  
  //add circleVX to the circle  
  
  //change the x location of the circle in each frame to move it across the screen
  circleX += circleVX;
  //change the y location of the circle in each frame to move it across the screen
  circleY += circleVY;
  
  //if statement
  //if specific conditions are meant execute a certain code 
  // make sure the circles don't go off the screen on the x axis
  if (circleX + CIRCLE_SIZE/2 > width || circleX - CIRCLE_SIZE/2 < 0) {
    circleVX = -circleVX;
  }
  //if statement
  //if specific conditions are meant execute a certain code 
  // make sure the circles don't go off the screen on the y axis
  if (circleY + CIRCLE_SIZE/2 > height || circleY - CIRCLE_SIZE/2 < 0) {
    circleVY = -circleVY;
  }
}

//mousePressed()
// when the mouse button goes down 
// change the background color

void mousePressed() {
  //change background color to variable BACKGROUND_COLOR 
  background(BACKGROUND_COLOR);
}
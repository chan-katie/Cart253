//Jump
//
// An endless vertical scrolling game, where players have to keep
// the character on the screen by jumping up on the platforms. 
// If they miss a platform they lose and the game is over
//
// By: Katie Chan 

// Global variables for the cube and platforms
Platform leftPlatform; 
Platform rightPlatform; 


// consts for states  
final int stateGame=0;
final int stateMenu=1;
// current state 
int state = stateMenu;

// The background image 
PImage start;

// setup()
//
// Sets the size and creates the paddles and ball

void setup() {
  //set the size 
  size(375, 665);

//load startscreen image
  start = loadImage("imgs/start.jpg");
  
 // Create the ball at the centre of the screen
  leftPlatform = new Platform(100,500,70,10);
  rightPlatform = new Platform(210,500,70,10);
}

// draw()
//
// loops forever, makes the cube and platforms move

void draw() {
 //when state is stateMenu runMenu()
  switch(state) {
  case stateMenu:
    runMenu();
    break;
  }
 //when state is stateGame runGame()
  switch(state) {
  case stateGame:
    runGame();
    break;
  }
}

// runMenu()
//
//show menu here

void runMenu() {
  background(start);
  if (key==' ') {
    runGame();
  }
}

// runGame()
//
//show game here

void runGame() {
  background(175, 195, 219);
    leftPlatform.display();
    rightPlatform.display();
}


// keyPressed()
//
// The cube needs to know if it should move based on a keypress
// so when the keypress is detected in the main program we need to
// tell the cube
void keyPressed() {
}
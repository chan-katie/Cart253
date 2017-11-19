//Jump
//
// An endless vertical scrolling game, where players have to keep
// the character on the screen by jumping up on the platforms. 
// If they miss a platform they lose and the game is over
//
// By: Katie Chan 

// consts for states  
final int stateGame=0;
final int stateMenu = 1;
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

  start = loadImage("imgs/start.jpg");
}

// draw()
//
// loops forever, makes the cube and platforms move

void draw() {
  switch(state) {
  case stateMenu:
    runMenu();
    break;
  }
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
}


// keyPressed()
//
// The cube needs to know if it should move based on a keypress
// so when the keypress is detected in the main program we need to
// tell the cube
void keyPressed() {
}
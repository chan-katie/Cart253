//Jump
//
// An endless vertical scrolling game, where players have to keep
// the character on the screen by jumping up on the platforms. 
// If they miss a platform they lose and the game is over
//
// By: Katie Chan 

// Global variables for the cube and platforms
//Platform leftPlatform; 
//Platform rightPlatform; 

ArrayList<Platform> platforms = new ArrayList();

// consts for states  
final int stateGame=0;
final int stateMenu=1;
// current state 
int state = stateMenu;

// The background image 
PImage start;

//platform 
int y;
int spacing=60;

// setup()
//
// Sets the size and creates the cube and platforms

void setup() {
  //set the size 
  size(375, 665);

  //load startscreen image
  start = loadImage("imgs/start.jpg");

  for (int y=60; y<=550; y+=spacing) {
    // Create the platforms
    Platform leftPlatform = new Platform(95, y, 70, 10);
    Platform rightPlatform = new Platform(210, y, 70, 10);

    platforms.add(leftPlatform );
    platforms.add(rightPlatform);
  }
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

  //for
  for (Platform p1 : platforms) {
    p1.display();
  }
}


// keyPressed()
//
// The cube needs to know if it should move based on a keypress
// so when the keypress is detected in the main program we need to
// tell the cube
void keyPressed() {
}
//Jump
//
// An endless vertical scrolling game, where players have to keep
// the character on the screen by jumping up on the platforms. 
// If they miss a platform they lose and the game is over
//
// By: Katie Chan 

// Global variables for the cube and platforms
Cube cube; 

ArrayList<Platform> platforms = new ArrayList<Platform>();

// consts for states  
final int stateGame=0;
final int stateMenu=1;
// current state 
int state = stateMenu;

// The background image 
PImage start;

//platform 
int yPlatform;
int xPlatform;
int spacing=60;

// setup()
//
// Sets the size and creates the cube and platforms

void setup() {
  //set the size 
  size(375, 665);

  //load startscreen image
  start = loadImage("imgs/start.jpg");

  cube = new Cube(205, 600);

  platforms.add(new Platform( 205, 620, 70, 10));

  for (int yPlatform=560; yPlatform>0; yPlatform-=spacing) {

    //chose 95 or 210 
    int xPlatform=random(1)>0.5?140:255;  

    platforms.add(new Platform(xPlatform, yPlatform, 70, 10));
  }
}

// draw()
//
// loops forever, makes the cube and platforms move

void draw() {
  runGame();
  ////
  ////when state is stateMenu runMenu()
  //  switch(state) {
  //  case stateMenu:
  //    runMenu();

  //  }
  //  //when state is stateGame runGame()
  //  switch(state) {
  //  case stateGame:
  //    runGame();

  //  }
  //}

  // //runMenu()
  //// 
  ////show menu here

  //void runMenu() {
  //  background(start);
  //  if (key==' ') {
  //    runGame();
  //  }
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
  cube.checkHit(platforms); 
  cube.display();
  cube.update();
  //cube.collide();
}


// keyPressed()
//
// The cube needs to know if it should move based on a keypress
// so when the keypress is detected in the main program we need to
// tell the cube
void keyPressed() {

  cube.keyPressed();
}

// keyReleased()
//
// As for keyPressed, except for released!

void keyReleased() {

  //cube.keyReleased();
}
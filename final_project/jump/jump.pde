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
int numberOfPlatforms =20;

//scrolling background 
final int GRID_SIZE = 60;
int halfScreen;
int speed=1;
int currentPos;
int scrollPos = 1;

// setup()
//
// Sets the size and creates the cube and platforms

void setup() {
  //set the size 
  size(375, 665);

  //load startscreen image
  start = loadImage("imgs/start.jpg");

  //the middle of the screen
  halfScreen = height / GRID_SIZE / 2;
  
  //where you are in the array
  currentPos = numberOfPlatforms-halfScreen;
  
  //adding the cube
  cube = new Cube(205, 600);
  
 

  int yPlatform=560;

  //for making 200 platforms 
  for (int i=0; i<numberOfPlatforms; i++) {

    //chose 95 or 210 
    int xPlatform=random(1)>0.5?140:255; 
    
    //add all platforms 
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
  //looping through the a segment of the array and adjusting the Y of the platforms 
  for (int i = currentPos - halfScreen, j = 0; i < currentPos + halfScreen; i++, j++) {
 int index = i;
    if(i<0){
      index = numberOfPlatforms +i;
   
 }
    //setting the y by offsetting it by the scroll position and display. 
    //If it is above it bring it down, if its below bring it up
    
    platforms.get(index%numberOfPlatforms).y=scrollPos + (j) * GRID_SIZE;
    platforms.get(index%numberOfPlatforms).display();
  }

 cube.y = cube.y + scrollPos;
  //increment by 1 
  scrollPos++;
  
  
  //if statement 
  //if scrollPos is equal to the GRID_SIZE currentPos is negative making it go up 
  if (scrollPos == GRID_SIZE) {

    currentPos--;
   
    //setting it back to 1 
    scrollPos = 1;
    
   //if statement
   //if curre
    if (currentPos < 0 ) {
      currentPos=numberOfPlatforms + currentPos;
    }// End
  }
  
  cube.checkHit(platforms); 
  cube.display();
  cube.update();
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
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

// state  
int screen = 0;

//screens
PImage start;
PImage failFill;

// font
PFont Roboto;

//platforms
int yPlatform;
int xPlatform;
int spacing=60;
int numberOfPlatforms =20;

//scrolling background 
final int GRID_SIZE = 60;
int halfScreen;
int currentPos;
int scrollPos = 1;

String str1 = "Score: ";
int score=0;




// setup()
//
// Sets the size and creates the cube and platforms

void setup() {
  //set the size 
  size(375, 665);
  //load startscreen image
  start = loadImage("imgs/start.jpg");

  reset();
}

// reset()
//
// sets the size and creates the cube and platform
// call this to reset the game 

void reset() {

  score=0;
  //the middle of the screen
  halfScreen = height / GRID_SIZE / 2;

  //where you are in the array
  currentPos = numberOfPlatforms-halfScreen;


  //for making 200 platforms 
  for (int i=0; i<numberOfPlatforms; i++) {

    //chose 95 or 210 
    int xPlatform=random(1)>0.5?140:255; 

    //add all platforms 
    platforms.add(new Platform(xPlatform, 70, 10));
  }

  //adding the cube
  cube = new Cube(platforms.get(platforms.size()-1).x, halfScreen*2-1);
}

// draw()
//
// loops forever, makes the cube and platforms move

void draw() {
  
  //setting the background  
   background(175, 195, 219);

  if (screen == 0) {
    // menu

    background(start);
  }

  if (screen == 1) {
    //run
    runGame();
  }
}


// runGame()
//
//show game here

void runGame() {
 
  //setting roboto font 
  Roboto = loadFont("Roboto-Light-20.vlw");
  textFont(Roboto);

  text(str1+score, 10, 30) ;

  //for
  //looping through a segment of the array and adjusting the Y of the platforms 
  for (int i = currentPos - halfScreen, j = 0; i < currentPos + halfScreen; i++, j++) {
    int index = i;
    // adding 
    if (i<0) {
      index = numberOfPlatforms +i;
    }
    //setting the y by offsetting it by the scroll position and display. 
    //If it is above it bring it down, if its below bring it up
    platforms.get(index%numberOfPlatforms).y=scrollPos + (j) * GRID_SIZE;
    platforms.get(index%numberOfPlatforms).display();
  }

  //update cube position 
  cube.updateY(scrollPos, GRID_SIZE);


  //increment by 1 
  scrollPos++;


  //if statement 
  //if scrollPos is equal to the GRID_SIZE currentPos is negative making it go up 
  if (scrollPos == GRID_SIZE) {

    cube.gridY++;

    currentPos--;

    //setting it back to 1 
    scrollPos = 1;

    //if statement
    //if currentPos is greater then 0 add another set of platforms 
    if (currentPos < 0 ) {
      currentPos=numberOfPlatforms + currentPos;
    }// End
  }

  //check if platform and cube hit
  cube.checkHit(platforms); 

  //display cube
  cube.display();
}


//runFail()
//
// Failed gamescreen, called when you loose the game
void runFail() {

  // The fail game screen and roboto font;
  failFill=loadImage("imgs/end.jpg");
  Roboto = loadFont("Roboto-Light-20.vlw");

  cube.x=-900;
  cube.y=-900;

  textFont(Roboto); 
  textAlign(CENTER);
  background(failFill);
  text(str1+(score), 187.5, 400);
}


// keyPressed()
//
// The cube needs to know if it should move based on a keypress
// so when the keypress is detected in the main program we need to
// tell the cube
void keyPressed() {

  //start game when press spacebar
  if ((screen==0) && (key==' ')) {
    screen = 1;
  }

  //control cube with keypressed in game screen 
  if (screen==1) {

    cube.keyPressed();
    if ((cube.y > halfScreen*2-1)) {
      score++;
    }
  }


  //press r to reset the game 
  if (key=='r') {
    screen=1;
    //reset the game 
    reset();
    loop();
  }
}
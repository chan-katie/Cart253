//Jump
//
// An endless vertical scrolling game, where players have to keep
// the character on the screen by jumping up on to 
// the platforms using the left and right arrow keys 
// If they miss a platform they lose and the game is over
//
// By: Katie Chan 

import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim; 
AudioPlayer beats;
BeatDetect music = new BeatDetect();

// Global variables for the cube, sound and platforms
Cube cube; 
Sound sound;
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
int numberOfPlatforms;

//platform spacing
final int GRID_SIZE=60;

//scrolling background 
int halfScreen;
int currentPos;
int scrollPos;
int speed=60;


//scores
int score;
int highScore;

// setup()
//
// Sets the size and creates the cube and platforms

void setup() {

  //set the size 
  size(375, 665);


  //  load the music 
  minim = new Minim(this); // Make the Minim manager class into an object
  beats = minim.loadFile("data/POL-chubby-cat-short.wav", 1024);

  //set the frameRate
  frameRate(80);

  //load startscreen image
  start = loadImage("imgs/start.jpg");

  failFill=loadImage("imgs/end.jpg");

  //play and loop the beat
  beats.play();
  beats.loop();

  reset();
}

// reset()
//
// sets the size and creates the cube and platform
// call this to reset the game 

void reset() {

  //setting the number of platforms 
  numberOfPlatforms=50;

  //score starts at 0
  score=0;

  //modified scrolling background code from PhiLho 

  //the middle of the screen
  halfScreen = height / GRID_SIZE / 2;

  //where you are in the array
  currentPos = numberOfPlatforms-halfScreen;

  //end modified scrolling background code from PhiLho

  //for making platforms 
  for (int i=0; i<numberOfPlatforms; i++) {

    loop();
    //chose 140 or 255 for platform position 
    int xPlatform=random(1)>0.5?140:255; 

    //add all platforms 
    platforms.add(new Platform(xPlatform, 70, 10));
  }

  //adding the cube
  cube = new Cube(platforms.get(platforms.size()-1).x, halfScreen*2-1);

  sound = new Sound(20, 645, 30, 25);
}


// draw()
//
// loops forever, makes the cube and platforms move

void draw() {

  if (screen == 0) {
    // menu
    background(start);

    //display sound
    sound.display();
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

  //setting the background  
  background(175, 195, 219);

  //setting roboto font and text alignment
  Roboto = loadFont("Roboto-Light-20.vlw");
  textFont(Roboto);
  fill(34, 53, 66);
  textAlign(LEFT, CENTER);
  text("Score: "+score, 10, 20);

  //modified scrolling background code from PhiLho

  //for
  //looping through a segment of the array and adjusting the Y of the platforms 
  for (int i = currentPos - halfScreen, j = 0; i < currentPos + halfScreen; i++, j++) {
    int index = i;
    // adding platforms again once it goes through the array
    if (i<0) {
      index = numberOfPlatforms+i;
    }
    //setting the y by offsetting it by the scroll position and display. 
    //If it is above it bring it down, if its below bring it up
    platforms.get(index%numberOfPlatforms).y=(scrollPos+ 5 + (j) * GRID_SIZE);
    platforms.get(index%numberOfPlatforms).display();
  }

  //update cube position, making it move
  cube.updateY(scrollPos, GRID_SIZE);

  //increment by 1 
  scrollPos++;


  //if statement 
  //if scrollPos is equal to the GRID_SIZE currentPos is negative making it go up 
  if (scrollPos == GRID_SIZE) {

    //moving the cube up on y axis
    cube.gridY++;

    //negative making it go up 
    currentPos--;

    //setting it back to 1 to reloop again from the start 
    scrollPos = 1;

    //if statement
    //if currentPos is greater then 0 add another set of platforms 
    if (currentPos < 0 ) {
      currentPos=numberOfPlatforms + currentPos;
    }// End
  }

  //end of modified scrolling background code from PhiLho

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
  Roboto = loadFont("Roboto-Light-20.vlw");
  background(failFill);

  //cube position
  cube.x=-900;
  cube.y=-900;

  //align and format the text 
  textFont(Roboto); 
  textAlign(CENTER, CENTER);
  fill(34, 53, 66);

  //if statement
  //
  //if the score is greater then highscore make that the new highscore
  if (score > highScore)
  {
    highScore=score;
  } 

  //text to be displayed score and highscore
  text("Score: "+score, 187.5, 400);
  text("Best: "+highScore, 187.5, 430);
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
    //if statement
    //
    //if the cube moves start counting the score
    if ((cube.y > halfScreen*2-1)) {

      //score going up
      score++;
    }
  }

  //press r to reset the game 
  if (key=='r') {
    //reset the game and values
    screen=1;
    score=0;
    
    //calling reset function
    
    reset();
    frameRate(80);
    loop();
  }
}

// mouseClicked()
//
// What to do when the mouse is clicked
void mouseClicked() {

  //controlling the sound buttons 
  sound.mouseClicked();
}
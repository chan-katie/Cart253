class Cube {

  /////////////// Properties ///////////////

  // Default values for size
  int HEIGHT=30;
  int WIDTH=30;
  int SIZE=30;


  // The location of the cube
  int x;
  int y;
  int gridY;

  // The fill of the cube
  PImage cubeFill=loadImage("imgs/cube.jpg");

  /////////////// Constructor ///////////////


  Cube( int _x, int _y) {
    x = _x;
    gridY = _y;
  }

  /////////////// Methods ////////////////

  //checkHit();
  //
  // checking to see if the cube hits the platform
  void checkHit(ArrayList<Platform> platforms) {

    boolean platformHit=false;

    //for
    //going through each platform and checking for a collison

    for (Platform p1 : platforms) {

      // println("cube "+x+","+y+"  plat1 "+p1.x+","+p1.y+" "+dist(x, y, p1.x, p1.y));

      //if the cube and platform touch 
      if ((dist(x, y, p1.x, p1.y) <= SIZE/2 + p1.platformH/2 ) ) {
        platformHit=true; 
        break;
      }
    }
    //if does not touch move back to starting point 
    if (!platformHit) {

      //minus 1 cause the last wrong jump isnt included
score--;
      if(score==-1){
  score=0;}
  
        if((score==0)){
  score=0;}
      runFail();
      //pause the game 
      noLoop();
    }
  }

  //updateY()
  //
  //update the y position of the cube based on scrolling background
  void updateY(int scrollPos, int gridSize) {
    y = gridY*gridSize +scrollPos - SIZE/2;
  }

  // display()
  //
  // Draw the cube at its position

  void display() {
    // Set up the appearance of the ball (no stroke, a fill, and imageMode as CENTER)
    noStroke();
    imageMode(CENTER);

    // Draw the image platforms
    image(cubeFill, x, y, WIDTH, HEIGHT);
  }


  // keyPressed()
  //
  // Called when keyPressed is called in the main program
  void keyPressed() {

    // Check if the key is our left key
    if (keyCode== LEFT) {
      // If so we want a positive y velocity
      //jump to the left
      x=140;
      gridY-=1;
    } // Otherwise check if the key is our right key 
    else if (keyCode == RIGHT) {
      // If so we want a negative y velocity
      //jump to the right
      x=255;
      gridY-=1;
    }
  }
}
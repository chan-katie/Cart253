//class Cube {

//  /////////////// Properties ///////////////

//  // Default values for speed and size
//  int SPEED = 5;
//  int HEIGHT = 35;
//  int WIDTH =16;

//  // The velocity of the cube
//  int vx;
//  int vy;

//  // The location of the cube
//  int x;
//  int y;

//  // The fill of the cube
//  PImage cubeFill;
  
//    // The characters used to make the paddle move up and down, defined in constructor
//  char leftKey;
//  char rightKey;

//  /////////////// Constructor ///////////////


//  Cube( int _x, int _y, char _leftKey, char _rightKey) {
//    x = _x;
//    y = _y;
//    leftKey = _leftKey;
//    rightKey = _rightKey;
//  }


//  /////////////// Methods ////////////////

//  void update() {
//  }

//  void display() {
//    // Set up the appearance of the ball (no stroke, a fill, and imageMode as CENTER)
    
//    cubeFill = loadImage("paddle.png");

//    noStroke();
//    imageMode(CENTER);
    
//    // Draw the image platforms
//    image(cubeFill, x, y, WIDTH, HEIGHT);
//  }
  
//  void keyPressed() {
//    // upKey = keyCode; Check if the key is our up key
//    if (key == leftKey) {
//      // If so we want a negative y velocity
//      vy = -SPEED;
//    } // Otherwise check if the key is our down key 
//    else if (key == rightKey) {
//      // If so we want a positive y velocity
//      vy = SPEED;
//    }
//  }

//  // keyReleased()
//  //
//  // Called when keyReleased is called in the main program

//  void keyReleased() {
//    // Check if the key is our up key and the paddle is moving up
//    if (key == leftKey && vy < 0) {
//      // If so it should stop
//      vy = 0;
//    } // Otherwise check if the key is our down key and paddle is moving down 
//    else if (key == rightKey && vy > 0) {
//      // If so it should stop
//      vy = 0;
//    }
//  }
//}
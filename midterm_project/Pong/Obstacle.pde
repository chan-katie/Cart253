// Ball
//
// A class that defines a ball that can move around in the window, bouncing
// of the top and bottom, and can detect collision with a paddle and bounce off that.

class Obstacle {
  /////////////// Properties ///////////////

  int obstacleWidth;
  int obstacleHeight;

  // The location of the ball
  int x;
  int y;

// The fill of the ball
  color ballFill = color(0);

 /////////////// Constructor ///////////////

  // Obstacle(int _x, int _y)
  //
  // The constructor sets the variable to their starting values
  // x and y are set to the arguments passed through (from the main program)

  Obstacle(int _x, int _y, int _w, int _h) {
    x = _x;
    y = _y;
   obstacleWidth= _w;
  obstacleHeight = _h;
}

/////////////// Methods ////////////////

// display()
  //
  // Draw the obstacle at its position

  void display() {
// Set up the appearance of the ball (no stroke, a fill, and imageMode as CENTER)
    noStroke();
    rectMode(CENTER);
    rect( x, y, obstacleWidth, obstacleHeight);
  }

}
class Platform {

  /////////////// Properties ///////////////

  int obstacleWidth;
  int obstacleHeight;

  // The location of the ball
  int x;
  int y;

  // The fill of the ball
  color ballFill = color(0);

  /////////////// Constructor ///////////////


  Platform(int _x, int _y, int _w, int _h) {
    x = _x;
    y = _y;
    obstacleWidth= _w;
    obstacleHeight = _h;
  }


  /////////////// Methods ////////////////

  void update() {
  }

  void display() {
    // Set up the appearance of the ball (no stroke, a fill, and imageMode as CENTER)
    noStroke();
    fill(0);

    // Draw the image platforms
    rect(x, y, obstacleWidth, obstacleHeight);
  }
}
class Platform {

  /////////////// Properties ///////////////

  int obstacleWidth;
  int obstacleHeight;

  // The location of the platform
  float x;
  int y;

  // The fill of the platform
  color platformFill = color(34, 53, 66);

  /////////////// Constructor ///////////////


  Platform(float _x, int _y, int _w, int _h) {
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
    fill(platformFill);
    rectMode(CENTER);
    // Draw the image platforms
    rect(x, y, obstacleWidth, obstacleHeight);
  }
}
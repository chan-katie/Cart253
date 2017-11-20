class Platform {

  /////////////// Properties ///////////////

  int platformW;
  int platformH;

  // The location of the platform
  int x;
  int y;

  // The fill of the platform
  color platformFill = color(34, 53, 66);

  /////////////// Constructor ///////////////


  Platform(int _x, int _y, int _w, int _h) {
    x = _x;
    y = _y;
    platformW= _w;
    platformH = _h;
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
    rect(x, y, platformW,platformH);
  }
}
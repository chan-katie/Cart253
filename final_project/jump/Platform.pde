class Platform {

  /////////////// Properties ///////////////

  int platformW;
  int platformH;

  // The location of the platform
  int x;
  int y=0;
  
  int gridY;

  // The fill of the platform
  color platformFill = color(34, 53, 66);

  /////////////// Constructor ///////////////


  Platform(int _x, int _w, int _h) {
    x = _x;
    platformW= _w;
    platformH = _h;
  }


  /////////////// Methods ////////////////

  // display()
  //
  // Draw the plaforms at there positions
  void display() {
    // Set up the appearance of the platforms
    noStroke();
    fill(platformFill);
    rectMode(CENTER);
    // Draw the image platforms
    rect(x, y, platformW,platformH);
  }
}
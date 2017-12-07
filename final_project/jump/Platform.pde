class Platform {

  /////////////// Properties ///////////////

  int platformW;
  int platformH;

  // The location of the platform
  int x;
  int y=0;
  //// The fill of the platform

  // random color code from asimes

  // create a random value for R, G, and B
  color r1 = color(random(255), random(255), random(255));

  // randomly pick a color among the 3 options
  int selected = (int)random(0, 3);
  int choicesR[] = {34, 242, 146};
  int choicesG[] = {53, 110, 183};
  int choicesB[] = {66, 86, 220};

  color platformFill = color(choicesR[selected], choicesG[selected], choicesB[selected]);

  //end of code from asimes

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
    rect(x, y, platformW, platformH);
  }
}
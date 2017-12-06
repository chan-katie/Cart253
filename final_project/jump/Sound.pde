class Sound {

  /////////////// Properties ///////////////

  int w=30;  
  int h=25;

  // The location of the sound control
  int x;
  int y;


  // The fill of the ball
  PImage soundFill;
  /////////////// Constructor ///////////////


  Sound(int _x, int _y, int _w, int _h) {
    x = _x;
    y=_y;
    w= _w;
    h = _h;
  }

  /////////////// Methods ////////////////

  // update()
  //
  // update when you click it 
  update() {
  }
  // display()
  //
  // Draw the sound at its position
  void display() {

    soundFill= loadImage("imgs/play.png");

    // Set up the appearance of the sound
    noStroke();
    imageMode(CENTER);

    // Draw the sound
    image(soundFill, x, y, w, h);
  }
}
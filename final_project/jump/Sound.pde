class Sound {

  /////////////// Properties ///////////////

  int w=30;  
  int h=25;

  // The location of the sound buttons
  int x;
  int y;

  // The fill of the sound buttons 
  PImage soundFill;
  PImage muteFill;

  // for the on/off button 
  boolean onOff = false;
  /////////////// Constructor ///////////////


  Sound(int _x, int _y, int _w, int _h) {
    x = _x;
    y=_y;
    w= _w;
    h = _h;
  }

  /////////////// Methods ////////////////

  // display()
  //
  // Draw the sound at its position
  void display() {
    
    // Set up the appearance of the sound
    noStroke();
    imageMode(CENTER);

    //loading the images for sound buttons 
    soundFill= loadImage("imgs/play.png");
    muteFill= loadImage("imgs/mute.png");

    // on/off button code from Jesse Scott

    //if statement
    //
    //mute and unmute the sound based on boolean mouseclick 
    if (onOff == true) {
      image(muteFill, x, y, w, h);
      beats.mute();
    } else {
      image(soundFill, x, y, w, h);
      beats.unmute();
    }

    // end of on/off button code from Jesse Scott
  }

  // mouseClicked()
  //
  // What to do when the mouse is clicked
  void mouseClicked() {

    // on/off button code from Jesse Scott

    //switching to the on/off states
    onOff= !onOff ;

    // end of on/off button code from Jesse Scott
  }
}
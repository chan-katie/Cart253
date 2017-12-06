class Sound {

  /////////////// Properties ///////////////

  int w=30;  
  int h=25;

  // The location of the sound control
  int x;
  int y;


  // The fill of the ball
  PImage soundFill;
  PImage muteFill;


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

    soundFill= loadImage("imgs/play.png");

    // Set up the appearance of the sound
    noStroke();
    imageMode(CENTER);


    soundFill= loadImage("imgs/play.png");
    muteFill= loadImage("imgs/mute.png");

    if (onOff == true) {
      image(muteFill, x, y, w, h);
      beats.pause();
    } else {

      image(soundFill, x, y, w, h);
      beats.play();

      //loop the music once it stops 
    beats.loop();
    }
  }


  void mouseClicked() {
    onOff= !onOff ;// this switches it to the opposite state
    println(onOff); // just to check...
  }
}
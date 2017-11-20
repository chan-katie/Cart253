class Cube {

  /////////////// Properties ///////////////

  // Default values for speed and size
  int SPEED = 5;
  int HEIGHT = 30;
  int WIDTH =30;
  int SIZE=30;

  // The velocity of the cube
  int vx;
  int vy;

  // The location of the cube
  int x;
  int y;

  // The fill of the cube
  PImage cubeFill;


  /////////////// Constructor ///////////////


  Cube( int _x, int _y) {
    x = _x;
    y = _y;
  }


  /////////////// Methods ////////////////

  void update() {
    // Update position with velocity (to move the paddle)
    x += vx;
    y += vy;
  }

  void checkHit(Platform platforms) {
    
     //if the cube and platform touch 
     if((dist(x, y, platforms.x, platforms.y) <= SIZE/2 + platforms.platformH/2 )){
     //do nothing 
     }
     //if they dont touch THIS IS WHAT YOU NEED
     else if((dist(x, y, platforms.x, platforms.y) >= SIZE/2 + platforms.platformH/2 )){
     background(0);
     }


  
  }

  void display() {
    // Set up the appearance of the ball (no stroke, a fill, and imageMode as CENTER)

    cubeFill = loadImage("imgs/cube.jpg");

    noStroke();
    imageMode(CENTER);

    // Draw the image platforms
    image(cubeFill, x, y, WIDTH, HEIGHT);
    
    println(y);
  }



  void keyPressed() {
    // upKey = keyCode; Check if the key is left up key
    if (keyCode== LEFT) {
      // If so we want a negative y velocity
      //vy = -SPEED;
      x=140;
      y-=60;
    } // Otherwise check if the key is our right key 
    else if (keyCode == RIGHT) {
      // If so we want a positive y velocity
     //vy = SPEED;
      x=255;
      y-=60;
    }
  }

  // keyReleased()
  //
  // Called when keyReleased is called in the main program

  //void keyReleased() {
  //  // Check if the key is our left key and the cube is moving left
  //  if (keyCode == LEFT && vx < 0) {
  //    // If so it should stop
  //    vy = 0;
  //  } // Otherwise check if the key is our right key and paddle is moving right 
  //  else if (keyCode == RIGHT && vx > 0) {
  //    // If so it should stop
  //    vy = 0;
  //  }
  //}
}
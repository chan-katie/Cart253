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
  float x;
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

  void collide(Platform platform) {

    //boolean insideLeft = (x + SIZE/2 > platform.x - platform.obstacleWidth/2);
    //   boolean insideRight = (x - SIZE/2 < platform.x + platform.obstacleWidth/2);
    //   boolean insideTop = (y + SIZE/2 > platform.y - platform.obstacleHeight/2);
    //   boolean insideBottom = (y - SIZE/2 < platform.y + platform.obstacleHeight/2);

    //   // Check if the ball overlaps with the paddle
    //   if (insideLeft && insideRight && insideTop && insideBottom) {
    //     // If it was moving to the left
    //     if (vx < 0) {
    //       // Reset its position to align with the right side of the paddle
    //       x = platform.x + platform.obstacleWidth/2 + WIDTH/2;
    //     } else if (vx > 0) {
    //       // Reset its position to align with the left side of the paddle
    //       x = platform.x - platform.obstacleWidth/2 - WIDTH/2;
    //     }
    //     // And make it bounce
    //     vx = -vx;
    //     };
  }

  void display() {
    // Set up the appearance of the ball (no stroke, a fill, and imageMode as CENTER)

    cubeFill = loadImage("imgs/cube.jpg");

    noStroke();
    imageMode(CENTER);

    // Draw the image platforms
    image(cubeFill, x, y, WIDTH, HEIGHT);
  }



  void keyPressed() {
    // upKey = keyCode; Check if the key is left up key
    if (keyCode== LEFT) {
      // If so we want a negative y velocity
      //vx = -SPEED;
      x=140;
      y-=60;
    } // Otherwise check if the key is our right key 
    else if (keyCode == RIGHT) {
      // If so we want a positive y velocity
      //vx = SPEED;
      x=255;
      y-=60;
    }
  }

  // keyReleased()
  //
  // Called when keyReleased is called in the main program

  void keyReleased() {
    // Check if the key is our left key and the cube is moving left
    if (keyCode == LEFT && vx < 0) {
      // If so it should stop
      vx = 0;
    } // Otherwise check if the key is our right key and paddle is moving right 
    else if (keyCode == RIGHT && vx > 0) {
      // If so it should stop
      vx = 0;
    }
  }
}
// Ball
//
// A class that defines a ball that can move around in the window, bouncing
// of the top and bottom, and can detect collision with a paddle and bounce off that.

class Ball {

  /////////////// Properties ///////////////

  // Default values for speed and size
  int SPEED = 5;
  int SIZE = 35;

  // The location of the ball
  int x;
  int y;

  // The velocity of the ball
  int vx;
  int vy;

  // The fill of the ball
  PImage ballFill;

  // tracks the score for both players
  int scoreLeft=0;
  int scoreRight=0;
  char restart='r';

 //The number of times the ball hits the paddle during the game
  int paddleHit = 0;


  /////////////// Constructor ///////////////

  // Ball(int _x, int _y)
  //
  // The constructor sets the variable to their starting values
  // x and y are set to the arguments passed through (from the main program)
  // and the velocity starts at SPEED for both x and y 
  // (so the ball starts by moving down and to the right)
  // NOTE that I'm using an underscore in front of the arguments to distinguish
  // them from the class's properties

  Ball(int _x, int _y) {
    x = _x;
    y = _y;
    vx = SPEED;
    vy = SPEED;
  }


  /////////////// Methods ////////////////

  //score()
  //This is called by the main program once per frame. To calculate the score.
  //Once game is over a Game Over screen pops up prompting user to restart game 
  //and gives information about who won the game. 

  void score() {
    fill(0);
    textSize(15); 
    textAlign(CENTER);
    text("Player 1 Score: "+scoreLeft, 160, 50);
    text("Player 2 Score: "+scoreRight, 460, 50);

    if (x > 640 ) {
      scoreLeft++;
      reset();
    } else if (x < 0 ) {
      scoreRight++;
      reset();
    } else if (scoreLeft == 5 ) {
      vx=0;
      vy=0;
      background(loadImage("one-win.jpg"));
    } else if (scoreRight == 5 ) {
      vx=0;
      vy=0;
      background(loadImage("two-win.jpg"));
    }
  }

  // update()
  //
  // This is called by the main program once per frame. It makes the ball move
  // and also checks whether it should bounce of the top or bottom of the screen
  // and whether the ball has gone off the screen on either side.

  void update() {
    // First update the location based on the velocity (so the ball moves)
    x += vx;
    y += vy;

    // Check if the ball is going off the top of bottom
    if (y - SIZE/2 < 0 || y + SIZE/2 > height) {
      // If it is, then make it "bounce" by reversing its velocity
      vy = -vy;
    }
  }

  // reset()
  //
  // Resets the ball to the centre of the screen.
  // Note that it KEEPS its velocity

  void reset() {
    x = width/2;
    y = int(random(50,430));

  }

  // isOffScreen()
  //
  // Returns true if the ball is off the left or right side of the window
  // otherwise false
  // (If we wanted to return WHICH side it had gone off, we'd have to return
  // something like an int (e.g. 0 = not off, 1 = off left, 2 = off right)
  // or a String (e.g. "ON SCREEN", "OFF LEFT", "OFF RIGHT")

  boolean isOffScreen() {
    return (x + SIZE/2 < 0 || x - SIZE/2 > width);
  }

  // collide(Paddle paddle)
  //
  // Checks whether this ball is colliding with the paddle passed as an argument
  // If it is, it makes the ball bounce away from the paddle by reversing its
  // x velocity

  void collide(Paddle paddle) {
    // Calculate possible overlaps with the paddle side by side
    boolean insideLeft = (x + SIZE/2 > paddle.x - paddle.WIDTH/2);
    boolean insideRight = (x - SIZE/2 < paddle.x + paddle.WIDTH/2);
    boolean insideTop = (y + SIZE/2 > paddle.y - paddle.HEIGHT/2);
    boolean insideBottom = (y - SIZE/2 < paddle.y + paddle.HEIGHT/2);

    // Check if the ball overlaps with the paddle
    if (insideLeft && insideRight && insideTop && insideBottom) {
      // If it was moving to the left
      if (vx < 0) {
        // Reset its position to align with the right side of the paddle
        x = paddle.x + paddle.WIDTH/2 + SIZE/2;
      } else if (vx > 0) {
        // Reset its position to align with the left side of the paddle
        x = paddle.x - paddle.WIDTH/2 - SIZE/2;
      }
      // And make it bounce
      vx = -vx;
      paddleHit++;
      
      if (paddleHit==3){

      }
    } 
  }
  
    void checkHit() {
      //Calculate possible overlaps with the paddle side by side
    boolean Left = (x + SIZE/2 >  obstacle.x - obstacle.obstacleHeight/2);
    boolean Right = (x - SIZE/2 < obstacle.x + obstacle.obstacleHeight/2);
    boolean Top = (y + SIZE/2 > obstacle.y - obstacle.obstacleWidth/2);
    boolean Bottom = (y - SIZE/2 < obstacle.y + obstacle.obstacleWidth/2);

  // Check if the ball overlaps with the paddle
    if (Left && Right && Top && Bottom) {
  
   
     vx = -vx;
    
    }
}

  // display()
  //
  // Draw the ball at its position

  void display() {

    ballFill = loadImage("pizza-ball.png");

    // Set up the appearance of the ball (no stroke, a fill, and imageMode as CENTER)
    noStroke();
    imageMode(CENTER);

    // Draw the image ball
    image(ballFill, x, y, SIZE, SIZE);
  }

  // keyPressed()
  //
  // Called when keyPressed is called in the main program

  void keyPressed() {
    //if the 'r' key is pressed run setup() which will restart game
    if (key == 'r') {
      setup();
   
    }
  }
}
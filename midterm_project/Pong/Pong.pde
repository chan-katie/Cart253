//Pong
//
// A simple version of Pizza Pong using object-oriented programming.
// Allows to people to bounce a ball back and forth between
// two paddles that they control.
//
// Players play untill one scores 5 points then they can restart the game!


// Global variables for the paddles and the ball
Paddle leftPaddle; 
Paddle rightPaddle;
Ball ball;
Obstacle obstacle;
Obstacle obstacleTwo;

// The distance from the edge of the window a paddle should be
int PADDLE_INSET = 11;

// The background colour during play (black)
//color backgroundColor = color(0);

// The background image 
PImage bg;

// setup()
//
// Sets the size and creates the paddles and ball

void setup() {
  // Set the size
  size(640, 480);
  
   bg = loadImage("board.jpg");

  // Create the paddles on either side of the screen. 
  // Use PADDLE_INSET to to position them on x, position them both at centre on y
  // Also pass through the two keys used to control 'up' and 'down' respectively
  // NOTE: On a mac you can run into trouble if you use keys that create that popup of
  // different accented characters in text editors (so avoid those if you're changing this)
  leftPaddle = new Paddle(PADDLE_INSET, height/2, '2', 'w');
  rightPaddle = new Paddle(width - PADDLE_INSET, height/2, '0', 'p');

  // Create the ball at the centre of the screen
  ball = new Ball(width/2, height/2);
  
  obstacle = new Obstacle(200, 200, 30, 100);
  obstacleTwo = new Obstacle(400, 400, 30, 100);
}

// draw()
//
// Handles all the magic of making the paddles and ball move, checking
// if the ball has hit a paddle, and displaying everything.

void draw() {
  // Fill the background each frame so we have animation
   background(bg);
   
// Update the paddles and ball by calling their update methods
  leftPaddle.update();
  rightPaddle.update();
  ball.update();
 

  // Check if the ball has collided with either paddle
  ball.collide(leftPaddle);
  ball.collide(rightPaddle);
  

  ball.checkHit();
  
  // Check if the ball has gone off the screen
  if (ball.isOffScreen()) {
   // If it has, reset the ball
    ball.reset();
  }

  // Display the paddles and the ball
  leftPaddle.display();
  rightPaddle.display();
  ball.display();
  obstacle.display();
  
  //display the score of the game 
  ball.score();
}

// keyPressed()
//
// The paddles and the ball need to know if they should move based on a keypress
// so when the keypress is detected in the main program we need to
// tell the paddles and the ball

void keyPressed() {
  // Just call both paddles' own keyPressed methods
  leftPaddle.keyPressed();
  rightPaddle.keyPressed();
  
  //Calling the balls' own keyPressed methods 
  ball.keyPressed();
}

// keyReleased()
//
// As for keyPressed, except for released!

void keyReleased() {
  // Call both paddles' keyReleased methods
  leftPaddle.keyReleased();
  rightPaddle.keyReleased();
}
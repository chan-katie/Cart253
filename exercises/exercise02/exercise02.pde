//one player pong, use the arrow keys to move the paddle and bounce the ball with a dynamic background 

// delcaring the variables
color backgroundColor = color(0);

//dynamic background variables
int numStatic = 1000;
int staticSizeMin = 1;
int staticSizeMax = 3;
color staticColor = color(200);

//paddle variables 
int paddleX;
int paddleY;
int paddleVX;
int paddleSpeed = 10;
int paddleWidth = 128;
int paddleHeight = 16;
color paddleColor = color(255);
int paddleHit = 0;

//ball variables
int ballX;
int ballY;
int ballVX;
int ballVY;
int ballSpeed = 5;
int ballSize = 16;
color ballColor = color(255);

// setup()
//
// sets the inital size, background etc. 

void setup() {
    size(640, 480);

    setupPaddle();
    setupBall();
}

// setupPaddle()
//
// sets the inital paddle size and position it's in the bottom center of the screen 
void setupPaddle() {
    paddleX = width / 2;
    paddleY = height - paddleHeight;
    paddleVX = 0;
}

// setupBall()
//
// sets the inital ball position in the center of the screen and it's speed

void setupBall() {
    ballX = width / 2;
    ballY = height / 2;
    ballVX = ballSpeed;
    ballVY = ballSpeed;

}

//draw()
//loops code forever untill you tell it to stop 
// draw background color and the functions for the dynamic background, the paddle and the ball. 

void draw() {
    background(backgroundColor);

    drawStatic();

    updatePaddle();
    updateBall();

    drawPaddle();
    drawBall();

    text(paddleHit, 20, 20);
}

//drawStatic()
// function for making dynamic background 

void drawStatic() {

    //for()
    // sequence of reptitons
    // if there are less then 1000 rectangles add some each a random size and position on the screen

    for (int i = 0; i < numStatic; i++) {
        float x = random(0, width);
        float y = random(0, height);
        float staticSize = random(staticSizeMin, staticSizeMax);
        fill(staticColor);
        rect(x, y, staticSize, staticSize);
    }
}

//updatePaddle()
// function keep paddle on the screen 


void updatePaddle() {
    paddleX += paddleVX;
    //constrain paddle to make sure it doesnt go off the screen on left or right
    paddleX = constrain(paddleX, 0 + paddleWidth / 2, width - paddleWidth / 2);
}

//updateBall()
// function control ball speed and calls functions to handle if the ball hits any wall 

void updateBall() {
    ballX += ballVX;
    ballY += ballVY;

    //calling more functions to handle the ball
    handleBallHitPaddle();
    handleBallHitWall();
    handleBallOffBottom();
    paddleSize();
}


//drawPaddle()
//function to draw paddle define stroke, color etc. 

void drawPaddle() {
    rectMode(CENTER);
    noStroke();
    fill(paddleColor);
    rect(paddleX, paddleY, paddleWidth, paddleHeight);
}

//drawBall()
// function to draw ball define stroke, color etc. 

void drawBall() {
    rectMode(CENTER);
    noStroke();
    fill(ballColor);
    rect(ballX, ballY, ballSize, ballSize);

    //CHANGED
    // add 10 random balls on the screen in different positions 
    for (int i = 0; i < 11; i++) {
        int ballX = int(random(0, width));
        int ballY = int(random(0, height));
        rect(ballX, ballY, ballSize, ballSize);
        //CHANGED

    }

}

//handleBallHitPaddle()
// function what to do when the ball touches the paddle

void handleBallHitPaddle() {

    //if statement calling the function ballOverlapsePaddle waiting on the return 
    // if ball touches the paddle reverse its path by reversing its speed sending it in the other direction

    if (ballOverlapsPaddle()) {
        ballY = paddleY - paddleHeight / 2 - ballSize / 2;
        ballVY = -ballVY;

        //CHANGED
        //make ball a random color whene
        ballColor = color(random(100, 255), random(100, 255), random(100, 255));
        //CHANGED

        //CHANGED
        //count how many times ball hits the paddle
        paddleHit++;

        //CHANGED
    }
}

//CHANGED 
//change paddle width based on how many times the ball hits the paddle 
void paddleSize() {

    if (paddleHit == 5) {
        paddleWidth = 108;
    }

    if (paddleHit == 10) {
        paddleWidth = 88;
    }

    if (paddleHit == 15) {
        paddleWidth = 68;
    }

    if (paddleHit == 20) {
        paddleWidth = 48;
    }

    if (paddleHit == 25) {
        paddleWidth = 28;
    }

}

//CHANGED

// ballOverlapsPaddle
// boolean on the function which will return a true or false 

boolean ballOverlapsPaddle() {

    // if statement 
    // if ball is within the paddle width 

    if (ballX - ballSize / 2 > paddleX - paddleWidth / 2 && ballX + ballSize / 2 < paddleX + paddleWidth / 2) {

        //if statement 
        //if ball is below the paddle 

        if (ballY > paddleY - paddleHeight / 2) {

            //the ball has hit the paddle 
            return true;
        }
    }

    //the ball has not hit the paddle 
    return false;

}

// handleBallOffBottom()
// check if the ball is off the grid
void handleBallOffBottom() {

    //if statement calling the function balloffBottom waiting for the return
    //if the ball is off the screen return it to the starting point in the middle of the screen
    if (ballOffBottom()) {
        ballX = width / 2;
        ballY = height / 2;
    }
}

// boolean on the function which will return a true or false 

boolean ballOffBottom() {
    //if the ball is above the height return true or false 
    return (ballY - ballSize / 2 > height);
}

// handleBallHitWall()
//what to do if ball hits the wall. 
void handleBallHitWall() {

    //if statement 
    //if ball hits left side reverse its speed sending it in the other direction

    if (ballX - ballSize / 2 < 0) {
        ballX = 0 + ballSize / 2;
        ballVX = -ballVX;
    }

    //else if ball hits right side reverse its speed sending it in the other direction
    else if (ballX + ballSize / 2 > width) {
        ballX = width - ballSize / 2;
        ballVX = -ballVX;
    }
    //if statement 
    //if ball hits the top reverse its speed sending it in the other direction
    if (ballY - ballSize / 2 < 0) {
        ballY = 0 + ballSize / 2;
        ballVY = -ballVY;
    }
}


//keyPressed()
//function when a key is pressed on the keyboard

void keyPressed() {
    //if statement 
    //if left key is pressed change speed to negative moving the paddle left
    if (keyCode == LEFT) {
        paddleVX = -paddleSpeed;
        //else if the right key is pressed change the speed to positive moving the paddle right 
    } else if (keyCode == RIGHT) {
        paddleVX = paddleSpeed;
    }
}

//keyReleased
//function when key is released

void keyReleased() {
    //if statement
    //if left key is released stop moving the paddle
    if (keyCode == LEFT && paddleVX < 0) {
        paddleVX = 0;
        //else if the right key is released stop moving the paddle 
    } else if (keyCode == RIGHT && paddleVX > 0) {
        paddleVX = 0;
    }
}
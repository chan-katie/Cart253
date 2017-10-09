//calling the class Bouncer 
class Bouncer {
  //defining the properties of class 
  int x;
  int y;
  int vx;
  int vy;
  int size;
  color fillColor;
  color defaultColor;
  color hoverColor;

  //constructor Bouncer with arguments setting up the variables for the lines 
  Bouncer(int tempX, int tempY, int tempVX, int tempVY, int tempSize, color tempDefaultColor, color tempHoverColor) {
    x = tempX;
    y = tempY;
    vx = tempVX;
    vy = tempVY;
    size = tempSize;
    defaultColor = tempDefaultColor;
    hoverColor = tempHoverColor;
    fillColor = defaultColor;
  }

  //update()
  //function to make the lines move within the screen and bounce off the walls 
  void update() {
    x += vx;
    y += vy;

    handleBounce();
    handleMouse();
  }

  //handleBounce()
  //ensures the lines stay on the screen 

  void handleBounce() {
    //if statement
    //if the line hits the left or right walls reverse it speed
    if (x - size/2 < 0 || x + size/2 > width) {
      vx = -vx;
      //Exercise 03 - change position//
      //change the x location if bouncer hits left or right walls
      x = 320;
      //Exercise 03 - change position//
    }
    //if statement 
    //if the line hits the top or bottom walls reverse its speed
    if (y - size/2 < 0 || y + size/2 > height) {
      vy = -vy;
      //Exercise 03 - change position//
      //change y location if the bouncer hits top or bottom walls 
      y=240;
      //Exercise 03 - change position//
    }

    //contrain x value so circle never goes off the screen on the x axis  
    x = constrain(x, size/2, width-size/2);

    //contrain y value so circle never goes off the screen on the y axis 
    y = constrain(y, size/2, height-size/2);
  }

  //handleMouse()
  //what the mouse does  
  void handleMouse() {
    //if statement 
    //if the mouse touches the circle change the fill color
    //else keep it the default color 
    if (dist(mouseX, mouseY, x, y) < size/2) {
      fillColor = hoverColor;
    } else {
      fillColor = defaultColor;
    }
  }

  //Exercise 03 - mouse click action//
  //mouseCheck()
  //if the mouse has been clicked change the background color and the color of both bouncers 
  void mouseCheck() {
    background(0);
    defaultColor = color(random(100, 255), random(100, 255), random(100, 255), 50);
    hoverColor= color(random(100, 255), random(100, 255), random(100, 255), 50);
  }
  //Exercise 03 - mouse click action //
  
  //draw()
  //loops code untill you tell it to stop
  //drawing the circles 

  void draw() {
    noStroke();
    fill(fillColor);
    ellipse(x, y, size, size);
  }
}
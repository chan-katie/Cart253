//red and blue lines that move along the screen and bounce off the walls. Fill of circles change when the mouse touches them

//delcaring variable and object variables 
color backgroundColor = color(200,150,150);
Bouncer bouncer;
Bouncer bouncer2;

// setup()
// sets the inital size, background and initilizes the objects which have arguments. 

void setup() {
  size(640,480);
  background(backgroundColor);
  bouncer = new Bouncer(width/2,height/2,2,2,50,color(150,0,0,50),color(255,0,0,50));
  bouncer2 = new Bouncer(width/2,height/2,-2,2,50,color(0,0,150,50),color(0,0,255,50));
}

//draw()
//loops code forever untill you tell it to stop and calls methods on the objects. 

void draw() {
  bouncer.update();
  bouncer2.update();
  bouncer.draw();
  bouncer2.draw();
}
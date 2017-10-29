// Exercise 05
// by Katie Chan


int dotSize = 20;

dot[] dots = new dot[200];

// setup()
//
// Set up the window and the dots

void setup() {
   // Set up the window
  size(500,500);

    // initialize each dot in the dot array. 
    for (int i = 0; i < dots.length; i++) {
    int x = floor(random(0, width/dotSize));
    int y = floor(random(0, height/dotSize));
    dots[i] = new dot(x * dotSize, y * dotSize, dotSize);
  }
}

// draw()
//
// Update all the griddies, check for collisions between them, display them.
void draw() {
    background(0);
    
 

    // Display the dots
    dot.display();
 
  

  
}
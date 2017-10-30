// Exercise 05
// by Katie Chan

int dotSize = 5;
int size = 20;

dot[] dots = new dot[100];


// setup()
//
// Set up the window and the dots

void setup() {
  // Set up the window
  size(500, 500);

  // initialize each dot in the dot array. 
  //code taken from exercise 04 by Pippin Barr
  for (int i = 0; i < dots.length; i++) {
    int x = floor(random(0, width/dotSize));
    int y = floor(random(0, height/dotSize));
    dots[i] = new dot(x*dotSize, y*dotSize, dotSize);
  }
  //code taken from exercise 04 by Pippin Barr
}

// draw()
//
// Update all the dots
void draw() {
  background(0);

//code taken from exercise 04 by Pippin Barr
  // We need to loop through all the dots one by one
  for (int i = 0; i < dots.length; i++) {
//code taken from exercise 04 by Pippin Barr

    // Update the griddies
    dots[i].update();

    // Display the dots
    dots[i].display();

    dots[i].mouseClicked();
  }
}
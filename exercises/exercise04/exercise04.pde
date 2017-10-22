// Griddies
// by Pippin Barr
// MODIFIED BY: Katie Chan
//
// A simple artificial life system on a grid. The "griddies" are squares that move
// around randomly, using energy to do so. They gain energy by overlapping with
// other griddies. If a griddie loses all its energy it dies.

// The size of a single grid element
int gridSize = 20;
// An array storing all the griddies
Griddie[] griddies = new Griddie[100];
NewThing[] newThings = new NewThing[3];

// setup()
//
// Set up the window and the griddies

void setup() {
  // Set up the window size and framerate (lower so we can watch easier)
  size(640, 480);
  frameRate(10);

  // QUESTION: What does this for loop do?
  // initialize each griddie in the gridde array. 
  // to a new gridde object with a random x and y within the screen size
  for (int i = 0; i < griddies.length; i++) {
    int x = floor(random(0, width/gridSize));
    int y = floor(random(0, height/gridSize));
    griddies[i] = new Griddie(x * gridSize, y * gridSize, gridSize);
  }

  // initialize each newThings in the newThings array. 
  // to a new newThings object with a random x and y within the screen size
  for (int i = 0; i < newThings.length; i++) {
    int x = floor(random(0, width/gridSize));
    int y = floor(random(0, height/gridSize));
    newThings[i] = new NewThing(x * gridSize, y * gridSize, 3, gridSize);
  }
}

// draw()
//
// Update all the griddies, check for collisions between them, display them.

void draw() {
  background(50);

  // We need to loop through all the griddies one by one
  for (int i = 0; i < griddies.length; i++) {

    // Update the griddies
    griddies[i].update();

    // Now go through all the griddies a second time...
    for (int j = 0; j < griddies.length; j++) {
      // QUESTION: What is this if-statement for?
      // its checking to see is i and j are not looking at the same gridde
      if (j != i) {
        // QUESTION: What does this line check?
        // if gridde at i collided with gridde at j 
        griddies[i].collide(griddies[j]);
      }
    }

    // Display the griddies
    griddies[i].display();
  }

  // We need to loop through all the newThings one by one
  for (int i = 0; i < newThings.length; i++) {

    // Update the newThings
    newThings[i].update();

    //See if the newThings collide with the griddies
    for (int j = 0; j < griddies.length; j++) {
      newThings[i].collide(griddies[j]);
    }


    // Display the newThings
    newThings[i].display();
  }
}
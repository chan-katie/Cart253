// NewThing
//
// A class defining the behaviour of a single NewThing
// which can move randomly in the window (within the grid),
// kills griddies if they overlap it 


class NewThing {

  // Position, size, energy, and fill color
  int x;
  int y; 
  int size; 
  color fill = color(66, 226, 244);
  int gridSize;


  // NewThing(x, y, size, gridSize)
  //
  // Set up the Griddie with the specified location and size
  // Initialise energy to the maximum

  NewThing (int x, int y, int size, int gridSize) {
    this.x = x ;
    this.y = y ;
    this.size = size ;
    this.gridSize = gridSize;
  }

  // update()
  //
  // Update NewThing color and ensure it stays on the screen 

  void update() {

    fill = color(random(100, 255), random(100, 255), random(100, 255));

    //if the gridde goes off the screen on x or y reverse its direction.
    while (x < 0) {
      x += gridSize;
    }
    while (x >= width-((size-1)*gridSize)) {
      x -= gridSize;
    }
    while (y < 0) {
      y += gridSize;
    }
    while (y >= height-((size-1)*gridSize)) {
      y -= gridSize;
    }
  }

  // display()
  //
  // Draw the NewThing on the screen as a rectangle

  void display() {

    fill(fill); 
    noStroke();
    rect(x, y, size*gridSize, size*gridSize);
  }

  // collide(griddie)
  //
  // Checks for collision with the Griddie
  // and updates the color of the newThing 

  void collide(Griddie griddie) {

    if (griddie.energy == 0) {
      return;
    }

    // if the griddie is inside the newThing, the newThing eats it
    if (griddie.x >= x && griddie.x < x+size && griddie.y >= y && griddie.y < y+size) {
      // eat griddie yum! 
      griddie.energy = 0;
    }
  }
}
//dot 
// A class defining the behaviour of a single dot

class dot {

  //Position, Size, Fill Color
  float tx = random(100);
  float ty = random(100);
  float x;
  float y; 
  float size;
  color fill = color(random(100, 255), random(100, 255), random(100, 255));


  //dot 
  // Set up the dot with the specified location and size
  dot(int tempX, int tempY, int tempSize) {
    x = tempX;
    y = tempY;
    size = tempSize;
  }


  // display()
  //
  // Draw the dot on the screen as a cricle
  //code taken from Slide 31 of Powerpoint 07-Math-tricks by Pippin Barr
  void display() {
    x= width*noise(tx);
    y= height*noise(ty);
 //code taken from Slide 31 of Powerpoint 07-Math-tricks by Pippin Barr
    strokeWeight(1);
    stroke(fill);
    line(x, y, mouseX, mouseY);
  }

  // update()
  //
  // update tx and ty to move lines
  void update() {
  //code taken from Slide 31 of Powerpoint 07-Math-tricks by Pippin Barr
    tx+=0.02;
    ty+=0.02;
  //code taken from Slide 31 of Powerpoint 07-Math-tricks by Pippin Barr
  }

  void mouseClicked() {
  }
}
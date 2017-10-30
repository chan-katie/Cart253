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

  float yoff = 0.0;   

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

    //code taken from Slide 31 of Powerpoint 07-Math-tricks by Pippin Barr
    tx+=0.02;
    ty+=0.02;
    //code taken from Slide 31 of Powerpoint 07-Math-tricks by Pippin Barr
  }


  // update()
  //
  // update tx and ty to move lines
  void update() {

    if (mouseX >  width/2) {

      //code taken from Noise Wave by Daniel Shiffman. 
      //modified float y, yoff and xoff

      background(255);
      fill(0);
      noStroke();
      beginShape(); 

      float xoff = 0;       

      for (float x = 0; x <= width; x += 10) {
        // Calculate a y value according to noise, map to 
        float y = map(noise(xoff, yoff), 0, 1, 150, 350); 

        // Set the vertex
        vertex(x, y); 
        // Increment x dimension for noise
        xoff += 0.5;
      }
      // increment y dimension for noise
      yoff += 0.8;
      vertex(width, height);
      vertex(0, height);
      endShape(CLOSE);

      //code taken from Noise Wave by Daniel Shiffman.
    }
  }
}
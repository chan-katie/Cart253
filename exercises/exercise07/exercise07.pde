// Exercise 07
// by Katie Chan

import processing.sound.*;

// The SoundFile class comes with the library, it allows us to store
// a sound in a variable (similar to PImage storing an image)
SoundFile beats;

// setup()
//
// Set up the window and the elements 

void setup() {
  // Set up the window
  size(500, 500);

  //  load the music 
  beats = new SoundFile(this, "sounds/adventures.mp3");
  
    // play the sound 
  beats.play();
}

// draw()
//
//loops code forever untill you tell it to stop 
void draw() {
  
  background(0);


}
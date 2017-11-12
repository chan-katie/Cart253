// Exercise 07
// by Katie Chan

import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim; // Minim has a special class to handle sound tasks
AudioPlayer beats;
BeatDetect music = new BeatDetect();
FFT  fft;


// setup()
//
// Set up the window and the elements 

void setup() {
  // Set up the window
  size(500, 500);

  //  load the music 
  minim = new Minim(this); // Make the Minim manager class into an object
  beats = minim.loadFile("sounds/adventures.mp3", 1024);
  fft = new FFT( beats.bufferSize(), beats.sampleRate() );
}

// draw()
//
//loops code forever untill you tell it to stop 
void draw() {
  background(0);
  music.detect( beats.right );
}

void keyPressed() {

  if (keyCode == ' ') {
    // play the sound 
    beats.play();

    // code from TfGuy44 
    if ( music.isOnset() ) {
      noFill();
      stroke(255);
      ellipseMode(RADIUS);
      ellipse(width/2, height/2, 50, 50);
      // code from TfGuy44
    }

    stroke(19, 191, 239);

    // code from TfGuy44 
    // perform a forward FFT on the samples in jingle's mix buffer,
    // which contains the mix of both the left and right channels of the file

    fft.forward( beats.right );

    for (int i = 0; i < fft.specSize(); i++)
    {
      // draw the line for frequency band i, scaling it up a bit so we can see it
      line( i, 300, i, 300 - fft.getBand(i)*5 );
    }
    // code from TfGuy44
  }
}

void keyReleased()
{

  beats.pause();
}
// Exercise 07
// by Katie Chan

import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim; // Minim has a special class to handle sound tasks
AudioPlayer beats;
AudioPlayer beats2;
AudioPlayer beats3;
BeatDetect music = new BeatDetect();
FFT fft;


// setup()
//
// Set up the window and the elements 

void setup() {
  // Set up the window
  size(500, 500);

  //  load the music 
  minim = new Minim(this); // Make the Minim manager class into an object
  beats = minim.loadFile("sounds/adventures.mp3", 1024);
  beats2 = minim.loadFile("sounds/vibes.mp3", 1024);
  beats3 = minim.loadFile("sounds/showMe.mp3", 1024);
  fft = new FFT( beats.bufferSize(), beats.sampleRate() );
}

// draw()
//
//loops code forever untill you tell it to stop 
void draw() {
  background(0);
  music.detect( beats.right );
  keyPressed();
}

// keyPressed()
//
//when keyboard keys are pressed do stuff
void keyPressed() {

  beats.pause();
  beats2.pause();
  beats3.pause();


  //if statment
  //if up arrow is pressed do a line visualizer with the music 
  if (keyCode==UP) {

    beats2.pause();
    beats3.pause();

    // play the sound 
    beats.play();

    // code from TfGuy44 
    if ( music.isOnset() ) {
      noFill();

      // code from TfGuy44
    }

    stroke(19, 191, 239);

    // code from TfGuy44 
    // perform a forward FFT on the samples in jingle's mix buffer,
    // which contains the mix of both the left and right channels of the file
    fft.forward( beats.mix);


    for (int i = 0; i < fft.specSize(); i=i+5)
    {
      // draw frequency band i
      line( i, i, i, i - fft.getBand(i)*10);
    }
    // code from TfGuy44

    //else if statment
    //if left arrow is pressed do a square visualizer with the music
  } else if (keyCode== LEFT) {

    beats.pause();
    beats3.pause();

    // play the sound 
    beats2.play();

    // code from TfGuy44 
    if ( music.isOnset() ) {
      noFill();
      // code from TfGuy44
    }

    stroke(143, 91, 234);

    // code from TfGuy44 
    // perform a forward FFT on the samples in jingle's mix buffer,
    // which contains the mix of both the left and right channels of the file
    fft.forward( beats2.mix );

    for (int i = 0; i < fft.specSize(); i++)
    {
      // draw frequency band i
      noFill();
      rectMode(CENTER);
      rect( 250, 250, i - fft.getBand(i)*10, i - fft.getBand(i)*10);
    }
    // code from TfGuy44


    //else if statment
    //if right arrow is pressed do a circle visualizer with the music
  } else if (keyCode== RIGHT) {

    beats.pause();
    beats2.pause();

    // play the sound 
    beats3.play();

    // code from TfGuy44 
    if ( music.isOnset() ) {
      noFill();

      // code from TfGuy44
    }

    stroke(73, 237, 73);

    // code from TfGuy44 

    // perform a forward FFT on the samples in jingle's mix buffer,
    // which contains the mix of both the left and right channels of the file
    fft.forward( beats3.mix );

    for (int i = 30; i < fft.specSize(); i=i+10)
    {
      // draw frequency band i
      noFill();
      ellipse( 250, 250, i - fft.getBand(i)*5, i - fft.getBand(i)*5);
    }
    // code from TfGuy44
  }
}
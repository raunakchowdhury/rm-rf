//file that plays a theme using the minim package 
//Minim is a sound package that automatically comes with Processing, so it's safe to use
//this is a template file to play music in the future; just change the String filename
//maintain the invariate that the file is in the same directory as the Processing file
//the JavaSound minim error is just that it can't recognize the publisher; ignore it

import ddf.minim.*;

AudioPlayer bosstheme;
Minim minim; //set up the minim object for playback

void setup() {
  minim = new Minim(this); 
  bosstheme = minim.loadFile("zombossMusic.mp3");
  bosstheme.loop(); //loop indefinitely
}

void draw() {
}

//close music
void stop(){
  bosstheme.close();
  minim.stop();
}
import processing.video.*;
// https://github.com/extrapixel/gif-animation
import gifAnimation.*;
import java.util.Map;

// TODO: several lines of text: quotes, posters 
// TODO: speed montage
// TODO: publish github, webpage

void setup() {
  frameRate(7);
  //fullScreen();
  size(800,600);
  
  setupInterface();
  setupVideos();
  setupFonts();
}

void draw() {
  drawVideos();
  drawLetters();
  
  if (interfaceSettings.get("interfaceFadeWhite")) background(255);
  else if (interfaceSettings.get("interfaceFadeBlack")) background(0);
}

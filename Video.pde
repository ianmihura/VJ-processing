Gif mainGif;
Gif overlayGif;
Movie mainMovie;
Movie overlayMovie;

GifMaker gifExport;
ArrayList<String> aFileNames = new ArrayList<String>();
boolean isGifMain;
boolean isGifOverlay;

int overlayAlpha = 0;
int montageVelocity = 1;

void setupVideos() {
  tint(255, 175);
  
  addFiles();
  importVid(7, true);
}

void addFiles() {
  File data = new File(sketchPath() + "\\data");
  File[] dataFiles = data.listFiles();
  
  for (int i = 0; i < dataFiles.length; i++) {
    aFileNames.add(dataFiles[i].getName());
  }
}

void importVid(int key, boolean firstPass) {
  if (aFileNames.size() < key+1) return;
  String currentFile = aFileNames.get(key);
  
  // workaround : comparing only last character of ".gif"
  isGifMain = isGifOverlay 
    = (char) currentFile.charAt(currentFile.length() - 1) == 'f';
  
  if (interfaceSettings.get("interfaceOverlay") || firstPass) {
    if (isGifOverlay) {
      overlayGif = new Gif(this, currentFile);
      overlayGif.play();
    } else {
      overlayMovie = new Movie(this, currentFile);
      overlayMovie.play();
    }
  } 
  if (interfaceSettings.get("interfaceChageSource") || firstPass) {
    if (isGifMain) {
      mainGif = new Gif(this, currentFile);
      mainGif.play();
    } else {
      mainMovie = new Movie(this, currentFile);
      mainMovie.play();
    }
  }
}

void drawVideos() {
  //Main
  tint(255, 175);
  if (isGifMain) { image(mainGif, 0, 0, width, height); } 
  else { image(mainMovie, 0, 0, width, height); }
  
  //Overlay
  tint(255, overlayAlpha);
  if (isGifOverlay) { image(overlayGif, 0, 0, width, height); } 
  else { image(overlayMovie, 0, 0, width, height); }

  tint(255, 255);
  if (interfaceSettings.get("interfaceExport")) exportGif(2);
}

//TODO: fix export error on opacity of characters
void exportGif(int state) {
  // first frame
  if (state == 1) { 
    gifExport = new GifMaker(this, "export" + (int) (100 * random(10)) + ".gif");
    gifExport.setRepeat(0);
  }
  // last frame
  else if (state == 0) gifExport.finish();
  
  // all middle frames
  else {
    gifExport.addFrame();
    gifExport.setDelay(0);
  }
}

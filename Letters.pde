ArrayList<PFont> fonts = new ArrayList<PFont>();
ArrayList<String> texts = new ArrayList<String>();
ArrayList<Integer> colors = new ArrayList<Integer>();

char altLetter = '\0';
char controlLetter = '&';
int fontSize = 300;
int textColor = 10;

void setupFonts() {
  textAlign(CENTER);
  textSize(fontSize);
  fill(255, 255, 255);
  
  texts.add("This");
  texts.add("is");
  texts.add("your");
  texts.add("God");
  
  fonts.add(createFont("BemboStd", fontSize)); // serif
  fonts.add(createFont("Zilla Slab", fontSize)); // slab serif
  fonts.add(createFont("OCRAStd", fontSize)); // monospace
  fonts.add(createFont("Old London", fontSize)); // gothic
  fonts.add(createFont("GillSans-Heavy", fontSize)); // extra bold
  fonts.add(createFont("VCR OSD Mono", fontSize)); // pixelated
  fonts.add(createFont("Olivia-Regular", fontSize)); // cursive
  fonts.add(createFont("Bodoni* 24", fontSize)); // bodoni
  fonts.add(createFont("HelveticaLTStd-Roman", fontSize)); // helvetica
  fonts.add(createFont("HelveticaLTStd-Roman", fontSize)); // helvetica
  textFont(fonts.get(3));
  
  colors.add(color(127,127,127));
  colors.add(color(255,0,0));
  colors.add(color(0,255,0));
  colors.add(color(0,0,255));
  colors.add(color(255,255,0));
  colors.add(color(255,0,255));
  colors.add(color(0,255,255));
  colors.add(color(255,255,255));
  colors.add(color(0,0,0));
  colors.add(color(255,0,100));
}

char getCurrentLetter() {
  char currentChar = (char) int(random(33, 127));
  if (interfaceSettings.get("interfaceControlLetter")) currentChar = controlLetter;
  else if (altLetter != '\0') currentChar = altLetter;
  return currentChar;
}

String getCurrentText() {
  String currentText = texts.get(int(random(4)));
  if (interfaceSettings.get("interfaceControlLetter")) 
    currentText += controlLetter;
  return currentText;
}

void setColor(int colorKey) {
  fill(colors.get(colorKey));
}

void drawLetters() {
  textSize(fontSize);
  text(getCurrentText(), width/2, 2*height/3);
  
  textSize(100);
  //text("20 de Mayo", width/2, 4*height/5);
  //text(getCurrentLetter(), width/2, 2*height/3);
}

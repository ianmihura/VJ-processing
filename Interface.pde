//TODO: all boolean to an arraylist of booleans
HashMap<String, Boolean> interfaceSettings = new HashMap<String, Boolean>();

void setupInterface() {
  interfaceSettings.put("interfaceChangeFont", false);
  interfaceSettings.put("interfaceOverlay", false);
  interfaceSettings.put("interfaceChageSource", false);
  interfaceSettings.put("interfaceExport", false);
  interfaceSettings.put("interfaceControlLetter", false);
  interfaceSettings.put("interfaceAltLetter", false);
  interfaceSettings.put("interfaceColor", false);
  interfaceSettings.put("interfaceFadeWhite", false);
  interfaceSettings.put("interfaceFadeBlack", false);
}

void keyPressed() {
  if (interfaceSettings.get("interfaceControlLetter") 
      || interfaceSettings.get("interfaceAltLetter")) {
    if (keyCode == ALT || keyCode == CONTROL) {
      offSettings();
      return;
    }
    controlLetter = key;
    altLetter = key;
    return;
  }
  
  if (key == 't') { // text
    offSettings();
    onSetting("interfaceChangeFont");
  } else if (key == 's') { // source-clip
    offSettings();
    onSetting("interfaceChageSource");
  } else if (key == 'o') { // overlay
    offSettings();
    onSetting("interfaceOverlay");
  }  else if (keyCode == CONTROL) { // controll all letters
    offSettings();
    switchSetting("interfaceAltLetter");
  } else if (keyCode == ALT) { // alternative letters
    offSettings();
    switchSetting("interfaceControlLetter");
  } else if (key == 'c') { // color
    offSettings();
    onSetting("interfaceColor");
  }
  
  else if (key == 'e') { // export
    switchSetting("interfaceExport");
    
    int interfaceInteger = interfaceSettings.get("interfaceExport") ? 1 : 0;
    exportGif(interfaceInteger);
  } 
  
  else if (key == 'w') { 
    background(255); // white flash
  } else if (key == 'q') { 
    background(0); // black flash
  } else if (key == 'W') { 
    offSettings();
    switchSetting("interfaceFadeWhite"); // fade white
  } else if (key == 'Q') { 
    offSettings();
    switchSetting("interfaceFadeBlack"); // fade black
  }
  
  if (isBetween((int) key, 48, 57))  // is a number
    if (interfaceSettings.get("interfaceChageSource") 
        || interfaceSettings.get("interfaceOverlay")) 
      importVid(Character.getNumericValue(key), false);  
    else if (interfaceSettings.get("interfaceChangeFont")) 
      textFont(fonts.get(Character.getNumericValue(key)));  
    else if (interfaceSettings.get("interfaceColor"))
      setColor(Character.getNumericValue(key));

  if (key == CODED && interfaceSettings.get("interfaceOverlay")) {
    if (keyCode == UP) {
      overlayAlpha += 5;
    } else if (keyCode == DOWN) {
      overlayAlpha -= 5;
    } else if (keyCode == LEFT) {
      overlayAlpha -= 20;
    } else if (keyCode == RIGHT) {
      overlayAlpha += 20;
    }
  }
  
  log();
}

void keyReleased() {
   altLetter = '\0';
}

boolean isBetween(int x, int lower, int upper) {
  return lower <= x && x <= upper;
}

void offSettings(){
  for (Map.Entry<String, Boolean> entry : interfaceSettings.entrySet()) {
    if (entry.getKey() == "interfaceExport") continue; // keep recording while we play
    interfaceSettings.replace(entry.getKey(), false);
  }
}

void onSetting(String interfaceKey) {
  interfaceSettings.replace(interfaceKey, true);
}

void switchSetting(String interfaceKey) {
    interfaceSettings.replace(interfaceKey, !interfaceSettings.get(interfaceKey));
}

void log() {
  String func = "";
  
  if (interfaceSettings.get("interfaceChangeFont")) func = "font";
  else if (interfaceSettings.get("interfaceOverlay")) func = "overlay";
  else if (interfaceSettings.get("interfaceChageSource")) func = "source";
  else if (interfaceSettings.get("interfaceColor")) func = "color";
  
  print("Interface> ", func, key, "\n");
}

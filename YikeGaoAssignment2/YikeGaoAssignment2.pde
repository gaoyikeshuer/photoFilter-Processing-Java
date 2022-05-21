PImage picture, loadImage, background, foreground,img1;
PImage backgroundPicture, foregroundPicture;
PImage grayscaleIcon,thresholdIcon,invertIcon,brightenIcon,darkenIcon,blueIcon,saturationIcon,blendIcon,maskIcon,subtractIcon;
String path, ovLoadImage ="off", onLoad ="off", status ="off";
String overBackground, overForeground, multiStatus1 ="off", multiStatus2 ="off";
  Boolean selectImg1 = false,selectImg2 = false,selectImg = false;
char keychar = '1';
void setup() {
  size(1200, 1000);
  background(255, 255, 255);
  loadImage = loadImage("add-image.png");
  background = loadImage("background.png");
  foreground = loadImage("foreground.png");
  grayscaleIcon = loadImage("grayscaleIcon.png");
  thresholdIcon = loadImage("thresholdIcon.png");
  invertIcon = loadImage("invertIcon.png");
  brightenIcon =loadImage("brightenIcon.png");
  darkenIcon = loadImage("darkenIcon.png");
  blueIcon = loadImage("blueIcon.png");
  saturationIcon = loadImage("saturationIcon.png");
  blendIcon = loadImage("blendIcon.png");
  maskIcon = loadImage("maskIcon.png");
  subtractIcon = loadImage("subtractIcon.png");
}

void keyPressed() {
  keychar = key;
}
void draw() {
  
  switch(keychar) {
  case '1':
  background(255);
  text("key'1' and key'2' can switch modes. Click the button to load the image first and then apply the filter ",100,50);
  text(" Now is single picture mode.",100,80);
  textSize(20);
  fill(0);
    image(loadImage, 25, 25, 50, 50);
    image(grayscaleIcon, 25, 75,50,50);
    image(thresholdIcon, 25,125,50,50);
    image(invertIcon,25,175,50,50);
    image(brightenIcon,25,225,50,50);
    image(darkenIcon,25,275,50,50);
    image(blueIcon,25,325,50,50);
    image(saturationIcon,25,375,50,50);
    singleMode();
    
    break;

  case '2':
   background(255);
   text("key'1' and key'2' can switch modes. First button: upload background picture. Second button: upload foreground picture.",100,50);
  text(" Now is two pictures mode.",100,80);
  textSize(20);
  fill(0);
  image(background, 25, 25, 50,50);
  image(foreground, 25, 75, 50, 50);
  image(blendIcon,25,125,50,50);
  image(maskIcon,25,175,50,50);
  image(subtractIcon,25,225,50,50);
  multiMode();

  
    break;
  }
}
void multiMode(){
  if(onLoad == "on" && selectImg1){//if the user has already selected the picture, upload it 
   image(backgroundPicture, 125,100,800,800);
  }
  if(onLoad == "on" && selectImg2){
  image(foregroundPicture, 125,100,800,800);
  }
  if(selectImg1&&selectImg2){
    switch(status){
  case "blendImage":
  PImage blendImage = blendImage(backgroundPicture,foregroundPicture,0.5);
  image(blendImage, 125,100,800,800);
  break;
  
  case "maskImage":
  PImage maskImage = maskImage(backgroundPicture,foregroundPicture);
  image(maskImage,125,100,800,800);
  break;
  
  case "subtractImage":
  PImage subtractImage = subtractImage(backgroundPicture,foregroundPicture);
  image(subtractImage,125,100,800,800);
  }
  
  }

}

void singleMode() {
  if (onLoad =="on" && selectImg) {
    image(picture, 125, 100,800,800);
      switch (status){
    
    case "grayscale":
     PImage greyScale = greyscale(picture);
    image(greyScale, 125, 100,800,800);
    break;  
    
    case "threshold":
    
    PImage threshold = threshold(picture);
    image(threshold, 125,100,800,800);
    break;
    
    case "invert":
    PImage invert = invert(picture);
    image(invert,125,100,800,800);
    break;
    
    case "brighten":
    PImage brighten = brighten(picture);
    image(brighten,125,100,800,800);
    break;
    
    case"darken":
    PImage darken = darken(picture);
    image(darken,125,100,800,800);
    break;
    
    case"colorizeBlue":
    PImage colorizeBlue = colorizeBlue(picture);
    image(colorizeBlue,125,100,800,800);
    break;
    case"highSaturation":
    PImage highSaturation = highSaturation(picture);
    image(highSaturation,125,100,800,800);
    break;
    
    }


}
    

   

   
  
}

void mousePressed() {
  int x = mouseX;
  int y = mouseY;
//if user click on the icon, the program will execute corresponding function
 if (keychar == '1' && x>25 && x<75 && y>25 &&y<75) {
    status = "loadSinglePicture";
    
  }
  else if(keychar == '1' && x>25 && x<75 && y>75 && y <125){
  status = "grayscale";
  }
  else if(keychar =='1' && x>25 && x<75 && y>125 && y<175){
  status = "threshold";
  }
  else if(keychar == '1' && x>25 && x<75 && y>175 && y<225){
  status = "invert";
  }
   else if(keychar == '1' && x>25 && x<75 && y>225 && y<275){
  status = "brighten";
  }
   else if(keychar == '1' && x>25 && x<75 && y>275 && y<325){
  status = "darken";
  }
   else if(keychar == '1' && x>25 && x<75 && y>325 && y<375){
  status = "colorizeBlue";
  }
     else if(keychar == '1' && x>25 && x<75 && y>375 && y<425){
  status = "highSaturation";
  }
 else if (keychar == '2' && x>25 && x<75 && y>25 &&y<75) {
    multiStatus1 = "loadBackgroundPicture";
    multiStatus2 = "off";
    addImage();
    onLoad ="off";
  }
   else if (keychar == '2' && x>25 && x<75 && y>75 &&y<125) {
     multiStatus1 = "off";
    multiStatus2 = "loadForegroundPicture";
    addImage();
    onLoad= "off";
  }  
  else if(keychar == '2' && x>25 && x<75 && y>125 && y<175){
  status = "blendImage";
  }
    else if(keychar == '2' && x>25 && x<75 && y>175 && y<225){
  status = "maskImage";
  }
     else if(keychar == '2' && x>25 && x<75 && y>225 && y<275){
  status = "subtractImage";
  }
  switch(status) {
  case "loadSinglePicture":
    addImage();
    onLoad = "off";
    break;
    case "off":
    break;
  }
  

  
}



void fileSelected(File selection) {
  if (selection  == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    if(status == "loadSinglePicture" ){
    picture = (loadImage(selection.getAbsolutePath(), "png"));
    selectImg = true;
    status = "off";
  }
    if(multiStatus1 == "loadBackgroundPicture"){  
      backgroundPicture =  loadImage(selection.getAbsolutePath(), "png");
       selectImg1 = true;
       multiStatus1 ="off";
    }
    if( multiStatus2 == "loadForegroundPicture"){
      foregroundPicture = loadImage(selection.getAbsolutePath(), "png");
      selectImg2 = true;
      multiStatus2 = "off";
    }
  
    onLoad ="on"; //complete upload function
  }
}

void addImage() {
  selectInput("Select a file to process:", "fileSelected");
}

import processing.video.*;

// Step 2. Declare a Capture object
Capture video;

void setup() {  
  size(320, 240);  
  
  // Step 3. Initialize Capture object via Constructor
  video = new Capture(this, 320, 240);  
  video.start();
}
  
// An event for when a new frame is available
void captureEvent(Capture video) {  
  // Step 4. Read the image from the camera.  
  video.read();
}

void draw(){
  image(video,0,0);
  loadPixels();
  video.loadPixels();
  
  
  if(mouseX>0 && mouseX<160){
    tint(255,0,0);
  }
  
  if(mouseX>160 && mouseX<320){
    tint(0,255,0);
  }
  
  if(mouseY>100 && mouseY<240){
    tint(0,0,255);
  }
  
  if(mouseX>= 300 && mouseY>200){
    noTint();
  }
  
  for( int i=0; i<width*height;i++){
    color p= pixels[i]; //Read color from screen
    float r= red(p);
    float g= green(p);
    float b= blue(p);
    r=constrain(r+mouseX/10,0,255);
    g=constrain(g+mouseX/10,0,255);
    b=constrain(b+mouseX/10,0,255);
    pixels[i]= color(r,g,b); //Assing modified value
  }
  
  updatePixels();
  line(mouseX,0,mouseX,height);
  line(0,mouseY,width,mouseY);
}
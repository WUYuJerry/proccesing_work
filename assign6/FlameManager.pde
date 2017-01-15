class FlameManager {
  int numFrames = 5;
  int currentFrame;
  int f = 0;
  float flameX,flameY;
  boolean flameDetected = false;
  PImage[] flame = new PImage[numFrames];
  
  FlameManager(){
    for (int i=0; i<numFrames; i++){
      flame[i] = loadImage("img/flame"+(i+1)+".png");
    }
    currentFrame = 0;
    frameRate(60);
  }
 


  void display () {
    if(flameDetected == true){
       image(flame[f], flameX, flameY);
       if (frameCount % (60/10)==0){
          currentFrame++;
          f = currentFrame % numFrames;
          if(f==0){flameDetected=false;}
       }
     }
  }


  void add (float x, float y) {

  }
}
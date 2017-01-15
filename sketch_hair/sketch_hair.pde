float centerX,centerY;

void setup(){
  size (640,480);
  centerX = width/2;
  centerY = height/2;
  
  //nose
  ellipse (centerX,centerY,50,50);
  
  //eyes
  ellipse (centerX/2.5,centerY/2.5,20,20);
  ellipse (640-centerX/2.5,centerY/2.5,20,20);
  
  //mouth
  noFill();
  arc(centerX, centerY, height, height, 0 ,PI);
  
}

void draw(){
  line(centerX,0,mouseX,mouseY);
  
  
  
}
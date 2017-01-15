float speedX, speedY;
float ballX,ballY;
float r, g, b;
boolean isPlaying;

void setup(){
  size(600,600);
  speedX=random(-5,5);
  speedY=random(-5,5);
  ballX = width/2;
  ballY = height/2;
  
  isPlaying = true;
  
}

void draw(){
  if(isPlaying){ 
    background(0);
   //ball
    noStroke();
    fill(r,g,b);
    ellipse(ballX,ballY,50,50);
      
   //speed
    ballX += speedX;
    ballY += speedY;
    
   //mousePressed
    if(mousePressed){
      ballX = mouseX;
      ballY = mouseY;
      speedX=random(-5,5);
      speedY=random(-5,5);
      r = random(256);
      g = random(256);
      b = random(256);
    }
    
    
    //boundary detection
     if(ballX<0||ballX > width){
       speedX=speedX*(-1);}
     if(ballY<0||ballY > height){
       speedY=speedX*(-1);}
     
  }
}

void keyPressed(){
  isPlaying = ! isPlaying;
}
class Animal {
  float x, y, xSpeed, ySpeed;
  int size;
  PImage img;
    
  Animal(String filename) {
    img = loadImage("img/" + filename + ".png");
    size = floor(random(1)+1)*100;
    x = random(width-size);
    y = btnH;  
  }
  void move() {
   
   }
  void move(float yValue, float sizeValue) {
    x += xSpeed;
    if(x<0 || x>width-size) { 
      xSpeed *= -1;
    }
    if(y<btnH || y>height-sizeValue) { 
      ySpeed *= yValue; 
    }
  }
  
  void display(){
    
  }
  
  void display(float value) { 
    boolean hDirection = (xSpeed > 0) ? true : false;
    if(hDirection) {
      pushMatrix();
      translate(x,y);
      scale(1, 1);
      image(img, 0, 0, size, value);
      popMatrix();      
    } else {
      pushMatrix();
      translate(x,y);
      scale(-1, 1);
      image(img, -size, 0, size, value);
      popMatrix();
    }
  }
  

  void moveToFeed() {
    if(feed != null) {
      if(x <= feed.x){
        x += abs(xSpeed);
      }else{
        x -= abs(xSpeed);
      }
    
    // if animal ate the feed
    if(feed.x<x+size && feed.x>x && feed.y<y+size && feed.y>y){
      feed = null;
    }
    }
  }
  
  void fed() {
    
    // feed will disappear 
    // animal will grow up
    
  }
  
}
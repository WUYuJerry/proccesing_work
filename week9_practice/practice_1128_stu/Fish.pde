class Fish{
  //properties
  float x, y, xSpeed, ySpeed, size;
  PImage fishImg;
  static final float S = 80;
  static final float M = 130;
  static final float L = 200;
  
  //Constructor
  Fish(){
    int fishSpecies = (floor(random(4))+1);
    size = (random(1)+1)*100;
    x = random(width-size);
    y = btnH;
    xSpeed = random(6)-3;
    ySpeed = random(6)-3;
    fishImg = loadImage("img/" + fishSpecies + ".png");
  }
  
  Fish(float size){
    int fishSpecies = (floor(random(4))+1);
    this.size = size;
    x = random(width-size);
    y = btnH;
    xSpeed = random(6)-3;
    ySpeed = random(6)-3;
    fishImg = loadImage("img/" + fishSpecies + ".png");
  }
  
  //Method
  void move(){
    x += xSpeed;
    y += ySpeed;
    if(x<0 || x>width-size) { 
      xSpeed *=-1;
    }
    if(y<btnH || y>height-size) { 
      ySpeed *=-1; 
    }
  }
  
  void display(){
    println("create a fish");
    boolean hDirection = (xSpeed > 0) ? true : false;
    if(hDirection) {
      pushMatrix();
      translate(x,y);
      scale(1, 1);
      image(fishImg, 0, 0, size, size);
      popMatrix();      
    } else {
      pushMatrix();
      translate(x,y);
      scale(-1, 1);
      image(fishImg, -size, 0, size, size);
      popMatrix();
    }
  }
  
}
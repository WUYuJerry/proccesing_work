class Turtle extends Animal {
  
  
  // constructor
  Turtle(){
    super("turtle");
    xSpeed = random(6)-3;
    ySpeed = random(3)+1;
    
  }
  

  // method
  void move(){
    if(y >= height-size/2){
      super.move(1,size/2);
    }else{
      y += ySpeed;
      x += xSpeed;
      super.move(-1,size/2);
    }
  }
  
  void display() {
    super.display(size/2);
  }
  
  void moveToFeed() {
  
  }
}
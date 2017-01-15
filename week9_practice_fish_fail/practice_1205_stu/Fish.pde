class Fish extends Animal {
  // constructor
  Fish() {
    super(str(floor(random(4))+1));
    xSpeed = random(9)-3;
    ySpeed = random(9)-3;
  }


  // method
  void move(){
    super.move(-1,size);
    y += ySpeed;
  }
  
  void display() {
    super.display(size);
  }
  
  void moveToFeed() {
    if(feed != null) {
    super.moveToFeed();
    
      if(y <= feed.y){
        y += abs(ySpeed);
      }else{
        y -= abs(ySpeed);
      }
    }
  }
}
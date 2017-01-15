class Turtle extends Aquatic{

  Turtle(){
    super("turtle");
     y = height-h;
  }
  void swim() {
    x += xSpeed;
    
    if(x<0 || x>width- w ){ 
      xSpeed *=-1;
    }
    if(y<0 || y>height- h){ 
      ySpeed *=-1; 
    }
  }
  void followMouse(){
    x = constrain(mouseX-hitX,0,width-w);
  }
  
}
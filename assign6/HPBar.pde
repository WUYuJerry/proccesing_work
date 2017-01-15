class HPBar {
  int x, y ;
  PImage img;
  
  
  HPBar(int x, int y){
    this.x = x ;
    this.y = y ;
    img=loadImage("img/hp.png");
  }
  
  void display(int hp){
    fill(255,0,0);
    rectMode(CORNER);
    rect(x,y,hp,30);
    image(img,10,10);
  }
  
}
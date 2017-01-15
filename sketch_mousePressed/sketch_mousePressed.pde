void setup(){
  size(500,500);
  background(255);
  
}

void draw(){
  if(mousePressed){
    if(mouseButton == LEFT)
      {stroke(255,0,0);    }
    else{stroke(0,255,0);}
    
    
    line(pmouseX,pmouseY,mouseX,mouseY);
  }
}
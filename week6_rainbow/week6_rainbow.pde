void setup(){
  
size(400,300);
colorMode(HSB);

}

void draw(){
  background(0);
    for(float x=0; x<width; x+=20){
        if(x<mouseX && x>mouseX-20){
          continue;        
        }
        float h = x/width*255;
        fill(h,255,255);
        noStroke();
        rect(x,0,20,height);
        
      }
}
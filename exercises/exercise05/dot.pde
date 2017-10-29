//dot 

class dot {
  
  //Position, Size, Fill Color
  float t1 = random(0,400);
  float x;
  int y; 
  int size;
  color fill = color(random(100,255),random(100,255), random(100,255));
  
  
  //dot (
  dot(int tempX, int tempY, int tempSize) {
    x = tempX;
    y = tempY;
    size = tempSize;
  }
  
void display() {
    x = width*noise(t1);
    
    fill(fill); 
    noStroke();
    ellipse(x,y,size,size);
    
    t1+= 0.01;
  }
  
}
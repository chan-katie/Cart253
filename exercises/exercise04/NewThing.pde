

class NewThing {

int x;
int y; 
int size; 
color fill = color(66, 226, 244);


 NewThing (int x, int y, int size) {
    this.x = x ;
    this.y = y ;
    this.size = size ;

  }

 void update() {
 
 
}
 
void display(){
  
   fill(fill); 
   noStroke();
   rect(x, y, size, size);
 
}

void collide(Griddie griddies){
  

}


}
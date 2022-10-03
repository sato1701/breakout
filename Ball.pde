class Ball extends Object{
  PVector vector;
  float speed;
  float size;
  Bar bar;
  
  Ball(float size, Bar bar){
    this.size = size;
    speed = 4;
    fillColor = color(0, 255, 0);
    vector_set(random(-5, 5), random(8, 10));
    this.bar = bar;
  }
  
  void print(){
    setColor();
    ellipse(x, y, size, size);
  }
  
  void init(){
    this.x = width/2; this.y = bar.y-bar.size_y/2-size/2;
  }
  
  void move(boolean isStart){
    if(!isStart){
      x = bar.x;
      return ;
    }
    //x=mouseX; y=mouseY; DEBUG
    if(x-size/2 <= 0 || width <= x+size/2)  
      vector_set(-vector.x, vector.y);
    if(y-size/2 <= 0)  
      vector_set(vector.x, -vector.y);
    if(bar.isCollision(x, y, size)){
      vector_set(
        PVector.add(bar.bounceAngle(x),
        new PVector(vector.x, -vector.y))
      );
    }
    switch(blocks.isCollision(x+vector.x, y+vector.y, size)){
      case 1: 
      case 2: vector_set(vector.x, -vector.y);
              break;
      case 3:
      case 4: vector_set(-vector.x, vector.y);
              break;
      case 5:
              vector_set(-vector.x, -vector.y);
              break;
    }
    
    x += vector.x;
    y += vector.y;
  }
  
  void vector_set(float x, float y){
    vector = new PVector(x, y).normalize().mult(speed);
  }
  void vector_set(PVector vector){
    this.vector = vector.normalize().mult(speed);
  }
  
  boolean isFallen(){
    if(y >= height+size*2) return true;
    return false;
  }
}

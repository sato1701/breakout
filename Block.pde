class Block extends Object{
  float size_x, size_y;
  int blocktime = 0;
  boolean collided;
  
  Block(float size_x, float size_y){
    this.size_x = size_x; this.size_y = size_y;
    fillColor = color(0);
    strokeColor = color(64);
    collided = false;
  }
  
  void init(float x, float y){
    this.x = x; this.y = y;
  }
  
  void print(){
    if(collided) return;
    setColor();
    rect(x, y, size_x, size_y);
  }
  
  int isCollision(float ball_x, float ball_y, float size){
    if(collided) return 0;
    if(dist(x, y, ball_x, ball_y) >= size+size_x+size_y) return 0;
    
    collided = true;
    if(x-size_x/2 < ball_x && ball_x < x+size_x/2){
      if(ball_y-size <= y+size_y/2 && y < ball_y)
        return 2;
      
      if(ball_y+size >= y-size_y/2 && y > ball_y)
        return 1;
    }
    
    if(y-size_y/2 < ball_y && ball_y < y+size_y/2){
      if(ball_x-size <= x+size_x/2 && x < ball_x)
        return 4;
      
      if(ball_x+size >= x-size_x/2 && x > ball_x)
        return 3;
    }
    
    if(dist(ball_x, ball_y, x+size_x/2, y+size_y/2) <= size/2)
      return 5;
    if(dist(ball_x, ball_y, x+size_x/2, y-size_y/2) <= size/2)
      return 5;
    if(dist(ball_x, ball_y, x-size_x/2, y+size_y/2) <= size/2)
      return 5;
    if(dist(ball_x, ball_y, x-size_x/2, y-size_y/2) <= size/2)
      return 5;
    
    //up:1 down:2 left:3 right:4    
    collided = false;
    return 0;
  }
}

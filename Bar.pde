class Bar extends Object{
  float size_x, size_y;
  int dir; 
  float speed;
  
  Bar(float size_x, float size_y){
    speed = 5;
    this.size_x = size_x; this.size_y = size_y;
    dir = 0;
    fillColor = color(255, 0, 0);
  }
  
  void print(){
    setColor();
    rect(x, y, size_x, size_y);
  }
  
  void init(){
    this.x = width/2; this.y = height*(9.0/10);
  }
  
  void move(){
    if(dir == LEFT && 0 < x) x-=speed;
    if(dir == RIGHT && x < width) x+=speed;
  }
  
  boolean isCollision(float x, float y, float size){
    if(this.y-size_y/2  <= y+size/2 && y+size/2 <= this.y+size_y/2 &&
       this.x-size_x/2 <= x && x <= this.x+size_x/2)
       return true;
    return false;
  }
  
  PVector bounceAngle(float x){
    return PVector.fromAngle( (this.x + size_x/2 -x)/size_x*(-PI)).mult(speed/2);
  }
}

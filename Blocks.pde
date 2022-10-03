class Blocks extends Object{ //<>//
  float x, y;
  int num, num_x, num_y;
  Block[] block;
  
  Blocks(float x, float y, float size_x, float size_y, int num_x, int num_y){
    this.num_x = num_x; this.num_y = num_y;
    num = num_x*num_y;
    block = new Block[num];
    
    for(int i=0; i<num_y; i++){
      for(int j=0; j<num_x; j++){
        block[i*num_x+j] = new Block(size_x, size_y);
        block[i*num_x+j].init(x +size_x*((-num_x+1)/2.0 +j), y +size_y*(-(num_y-1)/2.0 +i));
      }
    }
  }
  
  void init(float x, float y){
    this.x = x; this.y = y;
  }
  
  void print(){
    for(int i=0; i<num; i++) block[i].print();
  }
  
  int isCollision(float ball_x, float ball_y, float size){
    int ret = 0;
    
    for(int i=0; i<num_y; i++){
      for(int j=0; j<num_x; j++){
        ret = block[i*num_x+j].isCollision(ball_x, ball_y, size);
        if(ret != 0) return ret;
      }
    }
    return 0;
  }
}

class Picture{
  PImage[] face;
  PImage[][] body;
  PGraphics heart = new PGraphics();
  PGraphics arrow[] = new PGraphics[2];
  
  int[][] blocks = {
    {300, 350, 30, 15, 10, 20},
    {},
    {},
    {}
  };
  
  void load_pic(){
    title = loadImage(path_pic + "title.png");
    title.resize(width, height/2);
  
    face = new PImage[num_face];
    for(int i=0; i<num_face; i++){
      face[i] = loadImage(path_pic+path_face[i]);
      face[i].resize(width/3, height/4);
    }
    
    body = new PImage[num_face][4];
    for(int i=0; i<num_face; i++){
      for(int j=0; j<4; j++){
        body[i][j] = loadImage(path_pic+path_body[i][j]);
        body[i][j].resize(width, height);
      }
    }
    make_heart();
    make_arrow();
  }
  
  void print_body(int num1, int num2){
    image(body[num1][num2], width/2, height/2);
  }
  
  void make_heart(){
    heart = createGraphics(400, 400);
    heart.beginDraw();
      heart.background(0, 0, 0, 0);
      heart.fill(255, 0, 0);
      heart.noStroke();
      heart.smooth();
      float x, y;
      for(int i=1; i<=1000; i++){
        x = 16*sin(i)*sin(i)*sin(i);
        y = 13*cos(i)-5*cos(2*i)-2*cos(3*i)-cos(4*i);
        heart.circle(8*x+200, -8*y+200, 8);
      }
    heart.endDraw();
  }
  
  void make_arrow(){
    for(int i=0; i<2; i++){
      arrow[i] = createGraphics(400, 400);
      float w = arrow[i].width, h = arrow[i].height;
      arrow[i].beginDraw();
        arrow[i].rectMode(CENTER);
        arrow[i].background(0, 0, 0, 0);
        arrow[i].fill(255, 0, 0);
        arrow[i].noStroke();
        
        arrow[i].rect(w/2, h/2, 50, 20);
        if(i==0)
          arrow[i].triangle(w/2+20, h/2+20, w/2+20, h/2-20, w/2+40, h/2);
        if(i==1)
          arrow[i].triangle(w/2-20, h/2-20, w/2-20, h/2+20, w/2-40, h/2);
      arrow[i].endDraw();
    }
  }
}

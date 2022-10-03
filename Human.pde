class Human{
  String path_face;
  String path_body[];
  int blocks[];
  PImage face;
  PImage body[];
  
  Human(){
    face = new PImage();
    body = new PImage[num_face];
  }
  
  void load_pic(){
    for(int i=0; i<num_face; i++){
      face = loadImage(path_pic+path_face);
      face.resize(width/3, height/4);
    }
    
    for(int i=0; i<4; i++){
      body[i] = loadImage(path_pic+path_body[i]);
      body[i].resize(width, height);
    }
  }
}

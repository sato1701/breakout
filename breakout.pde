private Bar bar;
private Ball ball;
private Blocks blocks;
private boolean isStart = false;
private String path_pic = "./pictures/";
private int game_step = 0;
private PImage title;
private Picture picture;
private Human human;
private int num_face = 2;
private int choice = 0;
private int life;
private String[] path_face = 
{
  "torigoe_kao.png",
  "tenma_kao.png"
};
  
private String[][] path_body = {{
  "torigoe_haori.png",
  "torigoe_se-ra-.png",
  "torigoe_shitagi.png",
  "torigoe_hadaka.png"
},{
  "tenma_seifuku.png", 
  "tenma_seifuku.png",
  "tenma_seifuku.png",
  "tenma_seifuku.png"
}};

void setup(){ 
  size(600, 800);
  frameRate(120);
  background(0);
  textSize(60);
  textAlign(CENTER, CENTER);
  
  text("LOADING NOW", width/2, height/2);
  randomSeed(minute()*second());
  
  bar = new Bar(75, 20);
  ball = new Ball(10, bar);
  picture = new Picture();
  human = new Human();
  imageMode(CENTER);
  picture.load_pic();
  rectMode(CENTER);
  bar.init();
  ball.init();
  life = 3;
}

void draw(){
  background(255, 230, 230);
  text(frameCount, 50, 10);
  switch(game_step){
    case 0:
      title();
      break;
    case 1:
      choiceChara();
      break;
    case 2:
      playGame();
      break;
    case 3: //gameover
      gameover();
      break;
  }
}

void title(){
  background(255);
  image(title, width/2, height/4);
  if((int)(frameCount/frameRate)%2 == 0){
    fill(0);
    textSize(30);
    text("Press Space key\n" + "to Start", width/2, height*(3/4.0));
  }
}

void choiceChara(){
  image(picture.arrow[0], width*2/3, height*8/9);
  image(picture.arrow[1], width*1/3, height*8/9);
  image(face, width/4, height/4-height/15);
  image(face, width*3/4, height/4-height/15);
  image(picture.heart, 
    width*(choice%2*2+1)/4, height*(choice/2+1)/4-height/15);
}

void playGame(){
  picture.print_body(choice, 1);
  ball.print();
  bar.print();
  blocks.print();
  fill(255, 0, 0);
  text("LIFE:", width-125, 20);
  for(int i=1; i<=life; i++)
    text("♥", width-100+i*25, 20);
  
  if(!ball.isFallen()){
    bar.move();
    ball.move(isStart);
  }else{
    if(life>1){
      bar.init();
      ball.init();
      isStart=false;
      life--;
    }else{
      game_step++;
    }
  }
}

void nextGameStep(){
  game_step++;
  if(game_step == 2){
    if(choice == 0)
      blocks = new Blocks(300, 350, 30, 15, 10, 20);
  }
}

void gameover(){
  println("END!");
}

void keyPressed(){
  if(game_step == 2 && keyCode == 0x20) isStart = true;
  if(game_step == 1){
    if(keyCode == 0x20)
      nextGameStep();
    if(keyCode == LEFT && 0 < choice)
      choice--;
    if(keyCode == RIGHT && choice < num_face-1)
      choice++;
  }
  if(game_step == 0 && keyCode == 0x20) nextGameStep();
  bar.dir = keyCode;
}

void keyReleased(){
  if(!keyPressed)  bar.dir = 0;
}

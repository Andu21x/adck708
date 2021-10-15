float rectY;
int time;

//call the class and call the variables
Player player;
Enemy enemy;

void setup() {
  size(1000, 800);
  player = new Player(500, 600, 40, 40);
  enemy = new Enemy(width/2, height/2, 60, 60);
}

void draw() {
  frameRate(60);
  noStroke();

  //Street background
  fill(#4D4D4D);
  rect(300, rectY, 400, 1000);

  //Walls
  fill(#3CB424);
  rect(0, rectY, 300, 1000); //left wall
  fill(#3CB424);
  rect(700, rectY, 300, 1000); //right wall

  //Entities
  //Collision with right wall
  if (mouseX > 310 && mouseX < 670) {
    player.x = mouseX - 10;
  }

  if (mouseY > 40 && mouseY < 960){
    player.y = mouseY - 40;
  }
  
  player.draw();
  enemy.draw();
  
  
  if (rectangleIntersect(player,enemy)==true){
   time = time + 0;
   textSize(32);
   text(time, 900, 100);
   fill(255,0,0,100);
   rect(0,0,width,height);
   frameRate(1);
   textSize(128);
   text("You lost init", 100, 500);
   time = 0;
  }else{
   if (frameCount % 60 == 0){
     time += 1;
   }
   textSize(32);
   text(time, 900, 100);
  }
  
  if (frameCount % 10 == 0){
  enemy.x = random(290,640);
  enemy.y = random(740);
  }
  
  if (time == 60){
   fill(118,48,144,100);
   rect(0,0,width,height);
   fill(0,255,0);
   frameRate(0);
   textSize(100);
   text("You won, congrats!", 10, 200);
   text("if I had the money", 10, 500);
   text("I would allow you £5", 10, 600);
   text("NOOO CAPP", 200, 750);
  }
  
}

boolean rectangleIntersect(Player player, Enemy enemy) {
  //what is the dist on the x-axis
  float distX = abs((player.x+player.w/2)-(enemy.x+enemy.w/2));
  //what is the dist on the y-axis
  float distY = abs((player.y+player.h/2)-(enemy.y+enemy.h/2));
  //what is the combined half widths
  float combinedHalfWidths = player.w/2 + enemy.w/2;
  //what is the combined half heights
  float combinedHalfHeights = player.h/2 + enemy.h/2;

  //check for x-axis intersection
  if (distX < combinedHalfWidths) {
    //check on y-axis
    if (distY < combinedHalfHeights) {
      //they are intersecting
      return true;
    }
  }
  return false;
}

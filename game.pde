PVector food;
Snake snake;
int speed;
boolean isDead;
boolean isStart;

void setup(){
   size(WITDH,HEIGHT);
   isDead = false;
   isStart = false;
}

void newFood()
{
   int x,y;

   x = floor(random(width));
   y = floor(random(height));

   x = floor(x / GRID_SIZE) * GRID_SIZE;
   y = floor(y / GRID_SIZE) * GRID_SIZE;

   food = new PVector(x,y);
}

void eatFood(){
   newFood();
   snake.length++;
}

void draw(){
   background(0);
   if(!isStart)
   {
      fill(255);
      textSize(25);

      text("Welcome to snake game", 50, 50);
      textSize(30);
      text("Click to start!", 50, 100);

      textSize(25);
      fill(255, 40, 0);
      text("Made by D.A.N_3002", 50, 150);
   }else {
      if(!isDead)
      {
         fill(255);
         textSize(15);
         text("Score: " + snake.length, 0, 15);

         // check if eat food;
         if(snake.head.x == food.x && snake.head.y == food.y)
         {
            eatFood();
         }

         if(frameCount % speed == 0)
         {
            snake.update();
         }
         fill(255, 40, 0);
         rect(food.x, food.y, GRID_SIZE, GRID_SIZE);
         snake.show();
      } else {
         textSize(20);
         fill(255, 40, 0);
         text("Game Over !", 50,50);
         textSize(30);
         text("Score: " + snake.length, 50,100);
         textSize(20);
         text("Click to Restart", 50, 150);
      }
   }

}

void keyPressed() {
   if (keyCode == UP && snake.vel.y != 1) {
      snake.vel.y = -1;
      snake.vel.x = 0;
   } else if (keyCode == DOWN && snake.vel.y != -1) {
      snake.vel.y = 1;
      snake.vel.x = 0;
   }  else if (keyCode == LEFT && snake.vel.x != 1) {
      snake.vel.y = 0;
      snake.vel.x = -1;
   } else if (keyCode == RIGHT && snake.vel.x != -1) {
      snake.vel.y = 0;
      snake.vel.x = 1;
   }
}

void mousePressed() {
   if(!isStart || isDead)
   {
      isDead = false;
      snake = new Snake();
      // init food
      newFood();
      speed = 10;
      isStart = true;
   }
}
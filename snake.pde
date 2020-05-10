class Snake {
   int length;
   ArrayList<PVector> body;

   PVector head;
   PVector vel;

   Snake(){
      vel = new PVector(0,0);
      head = new PVector(0,0);
      length = 0;
      body = new ArrayList();
   }

   // update location of snake
   void update(){
      body.add(new PVector(head.x, head.y));

      head.x += vel.x * GRID_SIZE;
      head.y += vel.y * GRID_SIZE;

      head.x = (head.x + WITDH) % WITDH; // head.x % WIDTH
      head.y = (head.y + HEIGHT) % HEIGHT;

      if(length < body.size())
      {
         body.remove(0);
      }

      for(PVector vector : body)
      {
         if(vector.x == head.x && vector.y == head.y)
         {
            isDead = true;
         }
      }

   }

   void show() {
      noStroke();
      fill(255);
      rect(head.x, head.y, GRID_SIZE, GRID_SIZE);

      fill(155);
      for(PVector vector : body)
      {
         rect(vector.x, vector.y, GRID_SIZE, GRID_SIZE);
      }
   }
}
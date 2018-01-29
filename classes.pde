
class Paddle {
  float x;
  float y;
  float w;
  float h;
  int playerNum;

  Paddle(int whichPlayer) {
    playerNum = whichPlayer;
    if (whichPlayer == 0) {
      x = 30;
      y = height/2;
      w = 20;
      h = 150;
    } else if (whichPlayer == 1) {
      y = height/2;
      w = 20;
      h = 150;
      x = width-30-w;
    }
  }

  void update() {

    if (playerNum == 0) {
      if (p1Up) {
        y-=10;
      } 
      if (p1Down) {
        y+=10;
      }
    }
    if (playerNum == 1) {
      if (p2Up) {
        y-=10;
      } 
      if (p2Down) {
        y+=10;
      }
    }
  }


  void display() {
    rectMode(CORNER);
    fill(#D32511);
    rect(x, y, w, h);
    fill(#F7CB89);
    rect(x, y, w, h/3);
  }
}


class Ball {
  float x;   
  float y; 
  float dx;  
  float dy;  
  PImage bawl;


  Ball() {
    x = width/2;
    y = height/2;
    dx = 10;  //set a random velocity
    dy = random(-3, 3);
    bawl = loadImage("bawl.png");
  }


  void display() {
    noStroke();
    fill(255);
    rectMode(CENTER);
    image(bawl, x, y, 50, 50);
  }


  void update() {
    x += dx;

    if (x < 0 || x > width)
    {

      if (x < 0) 
      {
        p2Score++;
      }

      if (x > width) 
      {
        p1Score++;
      }

      x = width/2;
      y = height/2;
      dx = -dx; 
      dy = random(-3, 3);
    } 

    if (y < 0 || y > height) 
    {
      dy *= -1;
      y += dy;
    } else 
    { 
      y += dy;
    }
  }

  void checkCollisionWithPaddle(Paddle p) {
    if (x > p.x && x < p.x + p.w) {
      if (y > p.y && y < p.y + p.h) {
        dx = -dx;
        dy = random(-10, 10);
      }
    }
  }
}

float m;
int n;

int p1Score;
int p2Score;

boolean p1Up = false;
boolean p1Down = false;
boolean p2Up = false;
boolean p2Down = false;

Ball b;
Paddle p1;
Paddle p2;

void setup() {
  size(1000, 700);
  b = new Ball();
  p1 = new Paddle(0);
  p2 = new Paddle(1);
}

void draw() {
  background(0);

  pushMatrix();
  rectMode(CENTER);
  m = n / 4;
  fill(0, 0, m);
  rect(width/2, height/2, 1000, 700);
  fill(#F5D048);
  rect(100, 700, 3000, 350);
  fill(#176BFA);
  rect(400, 400, 2000, 350);
  popMatrix();
  
  n = (n + 1) % width;
  fill(#FAD608);
  ellipse(n, 70, 50, 50);
  
  fill(255);
  rect(width/2, height - 130, 30,200);
  

  //make it so that the sun moves and the background color gets darker

  b.checkCollisionWithPaddle(p1);
  b.checkCollisionWithPaddle(p2);

  b.update();
  b.display();
  p1.update();
  p1.display();
  p2.update();
  p2.display();

  textSize(36);
  fill(255);
  textAlign(CENTER, CENTER);

  text(p1Score, width/2 - 100, 50);
  text(p2Score, width/2 + 100, 50);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      p2Up = true;
    }
    if (keyCode == DOWN) {
      p2Down = true;
    }
  } else {
    if (key == 'w') {
      p1Up = true;
    }
    if (key == 's') {
      p1Down = true;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) {
      p2Up = false;
    }
    if (keyCode == DOWN) {
      p2Down = false;
    }
  } else {
    if (key == 'w') {
      p1Up = false;
    }
    if (key == 's') {
      p1Down = false;
    }
  }
}
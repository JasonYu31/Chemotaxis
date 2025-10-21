Rainbow[] colony;           
boolean follow = true; 

void setup() {
  size(1000, 1000);
  ellipseMode(CENTER);
  colony = new Rainbow[1000];
  
  for (int i = 0; i < colony.length; i++) {
    colony[i] = new Rainbow(width / 2, height / 2, color((int)(Math.random() * 255), (int)(Math.random() * 255), (int)(Math.random() * 255)));
  }
}

void draw() {
  fill(0,20);
  rect(0, 0, width, height);
  
  // Move and draw all bacteria
  for (Rainbow b : colony) {
    b.moveToward(mouseX, mouseY, follow);
    b.show();
  }
}

class Rainbow {
  float x;
  float y;
  int myColor;
  float bright;
  float size;

  Rainbow(float myX, float myY, int c) {
    x=myX;
    y=myY;
    myColor = c;
    bright = (float)(Math.random() * 1000 );
    size = (float)(Math.random() * 2 );
  }

  void moveToward(float targetX, float targetY, boolean attract) {
    float dx = targetX - x;
    float dy = targetY - y;
    float distance = dist(x, y, targetX, targetY);
    if (distance == 0)
    distance = 1;

    if (Math.random() < 0.8) {
      if (attract) {
        x += dx / distance * 5;
        y += dy / distance * 5;
      } else {
        x -= dx / distance * 5;
        y -= dy / distance * 5;
      }
    } else {
      x += (float)(Math.random() * 10 - 5);
      y += (float)(Math.random() * 10 - 5);
    }

    bright = bright - 1;
    if (bright <= 0) {
      bright = (float)(Math.random() * 1000);
      size = (float)(Math.random() * 6);
    }
  }

  void show() {
    noStroke();
    
    for (int i = 0; i < 3; i++) {
      float Size = size + i * 10;

      if (follow) {
        fill(red(myColor), green(myColor), blue(myColor));
      } else {
        fill((int)(Math.random() * 255), (int)(Math.random() * 255), (int)(Math.random() * 255));
      }
      rect(x+40, y, Size, Size); 
      rect(x+120, y, Size, Size); 
      rect(x, y+200, Size+150, Size); 
      rect(x, y+180, Size, Size); 
      rect(x+150, y+180, Size, Size); 
      rect(x+10, y-50, Size+50, Size); 
      rect(x+120, y-50, Size+50, Size); 
      ellipse(x+90, y+100, Size, Size); 
    }
  }
}

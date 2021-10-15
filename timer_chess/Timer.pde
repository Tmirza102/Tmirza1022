
void drawHand(int x, int y, int val) {
  float lx = sin(PI * val / 30.0) * 150;
  float ly = -cos(PI * val / 30.0) * 150;
  ellipse(x, y, 5, 5);
  line(x, y, x + lx, y + ly);
}

class Timer {
  private int time;
  private int x;
  private boolean paused;

  public Timer(int xpos, int minutes, int seconds, int ms) {
    seconds += minutes * 60;
    ms += seconds * 1000;
    time = ms;
    x = xpos;
    paused = true;
  }

  public void update(int timeDifference) {
    if (!paused) {
      time -= timeDifference;
      if (time < 0) time = 0;
    }

    int ms = time % 1000;
    int seconds  = time/1000;
    int minutes = seconds/60;
    String timer = nf(minutes, 2) + ":" + nf(seconds%60, 2) + "." + nf(ms%1000, 3);
    textSize(40);
    fill(0);
    float w = textWidth(timer)/2;
    text(timer, x-w, 200);

    int y = height / 2;
    fill(255);
    strokeWeight(5);
    stroke(0);
    ellipse(x, y, 340, 340);

    for (int i = 0; i < 60; i++) {
      stroke(#000000);
      
      int r0 = 155;
      int r1 = 165;
      
      if (i % 15 == 0) {
        r0 = 150;
        strokeWeight(3);
      }
      else if (i % 5 == 0) {
        strokeWeight(2);
      }
      else {
        r0 = 157;
        strokeWeight(1);
      }
      
      float vx = sin(PI * i / 30.0);
      float vy = -cos(PI * i / 30.0);
      line(x + vx * r0, y + vy * r0, x + vx * r1, y + vy * r1);
      
      if (i % 5 == 0) {
        fill(0);
        textSize(20);
        text(nf(i, 2), x + vx * 135 - 10, y + vy * 135 + 7);
      }
    }

    stroke(#000000);
    strokeWeight(4);
    drawHand(x, y, minutes);

    stroke(#ff0000);
    strokeWeight(1);
    drawHand(x, y, seconds);
  }

  public void toggle() {
    paused = !paused;
  }
}

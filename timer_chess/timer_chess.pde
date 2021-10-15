// Welcome to my chess timer project
// Start the timer by pressing spacebar and then press enter to pause the timer and switch to the next one
// press P to pause the game 
// also hello radu , hope you like the code :)
//made my Muhammad Mirza

Timer leftTimer; // creates the left variable 
Timer rightTimer; // creates the right variable 
boolean start; // true after time starts
boolean paused; // true when player presses p
int lastMillis;

void setup()
{
  size(1200,800); // size of canvas
  leftTimer = new Timer(width / 4, 15, 0, 0); // left timer is an instance of the class timer given by positioning on the x-axis and followed by the countdown of the timer 
  rightTimer = new Timer(3 * width / 4, 15, 0, 0); //// right timer is an instance of the class timer given by positioning on the x axisand followed by the countdown of the timer 
  start = false; // initialises the vaue of start
  paused = false; // initialises the value of pause
  lastMillis = 0;
}

void draw()
{
  int time = millis();
  int timeDifference = time - lastMillis;
  lastMillis = time;
  
  if (!paused) { //if its not paused then the timer runs 
    background(160); //background colour
    leftTimer.update(timeDifference); // left call update member function 
    rightTimer.update(timeDifference); // right call update member function 
  }
  else { // if key is pressed display PAUSE message
  textSize(45);
    String str = "PAUSED";
    float w = textWidth(str) / 2;
    text(str, width / 2 - w, 100); 
  }
}

void keyPressed() // this function allows us to start and pause the timer when you press a key
{
  if (keyCode == ' ' || keyCode == '\n') { // press spacebar or enter to start the left timer as player 1
    if (!start) {
      leftTimer.toggle();
      start = true;
    }
    else {
      leftTimer.toggle();
      rightTimer.toggle();
    }
  }
  else if (key == 'p') { // press p to pause the game 
    paused = !paused;
  }
  else if (key == 'q') { // press q to restart the game 
    setup();
  }
}

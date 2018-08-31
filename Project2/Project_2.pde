
float ballsX [] = new float [10];
float ballsY [] = new float [10];
float barX [] = new float [1];
float barY []= new float [1];
float BallSpeed[] = new float [10];
//Background sound
import processing.sound.*; 
SoundFile SoundBackground;
String Sound = "backgroundSound.mp3";
String BackgroundSound;
// Bouncing sound
import processing.sound.*;
SoundFile Bouncing;
String Bounce = "Sound";
String bounce;
//



void setup()
{
  size (600, 600);
  //background sound
  BackgroundSound = sketchPath("backgroundSound.mp3");
  SoundBackground = new SoundFile(this, BackgroundSound);
  SoundBackground.play();
  //bounce sound
  bounce = sketchPath("Sound.mp3");
  Bouncing = new SoundFile(this, bounce);

  for (int i=0; i<10; i++)
  {
    ballsX[i] = random(0, width);
    ballsY[i] = random(0, height);
    barX[0] = 150;
    barY[0] = 550;
    BallSpeed[i] = 2;
  }
  noStroke();
}

void draw()
{
  // background
  fill (0, 0, 0, 30);
  rect (0, 0, 600, 600);
  //bar or bouncer 
  fill (0, 0, 255);
  rect (barX[0], barY[0], 200, 20);
  // if bouncer goes out of screen
  if (barX[0] + 200 > 600)
  {
    barX[0] = 0;
  }
  if (barX[0] < 0)
  {
    barX[0] = 400;
  }
  //target or balls movement
  for (int i=0; i<10; i++)
  {

    fill (0, 255, 0);

    ellipse (ballsX[i], ballsY[i], 5, 5);
    ballsY[i] = ballsY[i] + BallSpeed[i];
    //balls repeating
    if (ballsY[i] > height)
    {
      ballsY[i] = 0;
      ballsX[i] = random(width);
    }
    // collisions
    if (ballsY[i] > barY[0])
    {
      if (barY[0] < ballsY[i]+20)
      {
        if (ballsX[i]> barX[0])
        {
          if (ballsX[i] < barX[0] + 200)
          {
            Bouncing.play();
            BallSpeed[i] = BallSpeed[i]*-4;
          }
        }
      }
    }
  }
}


void keyPressed()
{
  if (key == CODED) 
  {
    if (keyCode == RIGHT) 
    {
      barX[0] = barX[0] + 25;
    } 
    if (keyCode == LEFT) 
    {
      barX[0] = barX[0] - 25;
    }
  }
}

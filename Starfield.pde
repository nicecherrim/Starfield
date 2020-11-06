class Particle
{
  float myX, myY, mySpeed, mySize, myAngle;
  int myColor;
  
  Particle () {
    //initialize all ur vars
    myX = 250;//(float)((Math.random()*101)+200);
    myY = 250;//(float)((Math.random()*101)+200);;
    myColor = color((int)(Math.random()*156+100),(int)(Math.random()*156+100),(int)(Math.random()*256+100));
    mySize = (float)((Math.random()*11)+1);
    mySpeed = (float)(Math.random()*9+1);
    myAngle = (float)(Math.random()*(2*Math.PI)+1);
  }
  
  void show() {
    noStroke();
    fill(myColor);
    ellipse(myX,myY, mySize, mySize);
  }
  
  void move() {
  //The cos of the angle * the speed will give us the amount to move the particle in the x direction
  //The sin of the angle * the speed will give us the y amount
    myX += (float)(Math.cos(myAngle))*mySpeed;
    myY += (float)(Math.sin(myAngle))*mySpeed;
  }
  
  void wiggle() {
    myX += (float)((Math.random()*4)-2);
    myY += (float)((Math.random()*4)-2);
  }
  
  void pulse() {
    mySize += ((int)(Math.random()*3)-1);
  }
}

class OddballParticle extends Particle//inherits from Particle
{
  void show() {
    mySize = 75;
    fill(myColor);
    ellipse(myX, myY, mySize, mySize);
  }
  
  void move() {
    myX += ((int)(Math.random()*5)-2);
    myY += ((int)(Math.random()*5)-2);
    constrain(myX,-10,510);
    constrain(myY,-10,510);
  }
}

Particle [] stars;
void setup()
{
  size(500,500);
  stars = new Particle[200];
  for(int i = 0; i < stars.length; i++) {
    if(i == 0) {
      stars[i] = new OddballParticle();
    } else {
    stars[i] = new Particle();
    }
  }
}
void draw()
{
  background(0);
  for(int i = 0; i < stars.length; i++) {
    stars[i].show();
    stars[i].move();
    stars[i].wiggle();
    stars[i].pulse();
  }
}

void mousePressed() {
  redraw();
  stars = new Particle[300];
  for(int i = 0; i < stars.length; i++) {
    if(i ==0) {
      stars[i] = new OddballParticle();
    } else {
    stars[i] = new Particle();
    }
  }
}

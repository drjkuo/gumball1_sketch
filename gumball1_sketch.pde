int rectX, rectY;      // Position of square button
int circleX, circleY;  // Position of circle button
int rectSize = 50;     // Diameter of rect
int circleSize = 50;   // Diameter of circle
color rectColor, circleColor, baseColor;
color rectHighlight, circleHighlight;
color currentColor;
boolean rectOver = false;
boolean circleOver = false;


void setup() 
{
  size(800, 800) ;
  background(255) ;
  smooth() ;
  //strokeWeight(3);
  //strokeCap(ROUND);
  
  //add
  rectColor = color(255);
  rectHighlight = color(150);
  circleColor = color(255);
  circleHighlight = color(150);
  baseColor = color(102);
  currentColor = baseColor;
  circleX = 50;//width/2+circleSize/2+10;
  circleY = 50;//height/2;
  rectX = 25;//width/2-rectSize-10;
  rectY = 100;//height/2-rectSize/2;
  
  
  
  // load font
  PFont font;
  font = loadFont("BookAntiqua-48.vlw");
  textFont(font, 32);

  // Only draw once
  //noLoop();
}

void draw() {
  //add
  //update(mouseX, mouseY);
  update();
  background(currentColor);
  
  if (rectOver) {
    fill(rectHighlight);
  } else {
    fill(rectColor);
  }
  //stroke(255);
  rect(rectX, rectY, rectSize, rectSize);
  
  if (circleOver) {
    fill(circleHighlight);
  } else {
    fill(circleColor);
  }
  //stroke(0);
  ellipse(circleX, circleY, circleSize, circleSize);
  ellipseMode(CENTER);
  
  /*
  fill(0);  
  text("The Gumball Machine", 250, 60);
  PImage image = loadImage("gumball.jpg");
  image(image, (width-image.width)/2, (height-image.height)/2);  
  runTest() ;
  */
}


public void runTest() {
  GumballMachine gumballMachine = new GumballMachine(5);
  System.out.println(gumballMachine);
  gumballMachine.insertQuarter();
  gumballMachine.turnCrank();
  System.out.println(gumballMachine);
  gumballMachine.insertQuarter();
  gumballMachine.turnCrank();
  gumballMachine.insertQuarter();
  gumballMachine.turnCrank();
  System.out.println(gumballMachine);
}


//void update(int X, int Y) {
void update() {
  if ( overCircle(circleX, circleY, circleSize) ) {
    circleOver = true;
    rectOver = false;
  } else if ( overRect(rectX, rectY, rectSize, rectSize) ) {
    rectOver = true;
    circleOver = false;
  } else {
    circleOver = rectOver = false;
  }
}

void mousePressed() {
  if (circleOver) {
    //currentColor = circleColor;
    circleColor = color(0);
  }
  if (rectOver) {
    //currentColor = rectColor;
    rectColor = color(0);
  }
}

boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}
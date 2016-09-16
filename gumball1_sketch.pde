int IQX, IQY;      // Position of square button
int TCX, TCY;  // Position of circle button
int IQYSize = 50;     // Diameter of rect
int IQXSize = 220;
int TCYSize = 50;   // Diameter of circle
int TCXSize = 220; 
color IQColor, TCColor, baseColor;
color IQHighlight, TCHighlight;
color currentColor;
boolean IQOver = false;
boolean TCOver = false;

GumballMachine gumballMachine = new GumballMachine(5);



void setup() 
{
  size(800, 800) ;
  background(255) ;
  smooth() ;
  //strokeWeight(3);
  //strokeCap(ROUND);
  
  //add
  /*
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
  */
  
  IQColor = color(255);
  IQHighlight = color(150);
  TCColor = color(255);
  TCHighlight = color(150);
  baseColor = color(102);
  currentColor = baseColor;
  TCX = 0;//width/2+circleSize/2+10;
  TCY = 50;//height/2;
  IQX = 0;//width/2-rectSize-10;
  IQY = 0;//height/2-rectSize/2;
  
  
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
  
  if (IQOver) {
    fill(IQHighlight);
  } else {
    fill(IQColor);
  }
  //stroke(255);
  //fill(50);
  //text("Insert Quarter", IQX, IQY, IQSize, IQSize);
  rect(IQX, IQY, IQXSize, IQYSize);

  
  if (TCOver) {
    fill(TCHighlight);
  } else {
    fill(TCColor);
  }
  //stroke(0);
  //fill(50);
  //text("Turn Crank",TCX, TCY, TCSize, TCSize);
  rect(TCX, TCY, TCXSize, TCYSize);
  //ellipseMode(CENTER);
  
  
  //textSize(16);
  fill(220,20,60);
  text("Insert Quarter", 0+10, 0+35);
  
  //textSize(16);
  fill(220,20,60);
  text("Turn Crank", 0+10, 50+35);
  
  
  fill(0);  
  text("The Gumball Machine", 250, 60);
  PImage image = loadImage("gumball.jpg");
  image(image, (width-image.width)/2, (height-image.height)/2);  
  //runTest() ;
  
  String s = gumballMachine.toString();
  text(s,25,530);
  
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
  if ( overRect(TCX, TCY, TCXSize, TCYSize) ) {
    TCOver = true;
    IQOver = false;
    
  } else if ( overRect(IQX, IQY, IQXSize, IQYSize) ) {
    IQOver = true;
    TCOver = false;
    
  } else {
    TCOver = IQOver = false;
  }
}

void mousePressed() {
  if (TCOver) {
    //currentColor = TCColor;
    TCColor = color(0);
    gumballMachine.turnCrank();
  }
  if (IQOver) {
    //currentColor = rectColor;
    IQColor = color(0);
    gumballMachine.insertQuarter();
  }
}

/*
boolean overText(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
*/


boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

/*
boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
  
} */
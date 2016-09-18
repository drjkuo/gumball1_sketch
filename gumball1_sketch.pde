public class Button {
 public int x;
 public int y;
 public int xsize;
 public int ysize; 
 public color ocolor;
 public color hcolor;
 Button () {}
 
}

GumballMachine gumballMachine = new GumballMachine(5);
color baseColor;
color currentColor;
boolean IQOver = false;
boolean TCOver = false;
Button BI = new Button();
Button BT = new Button();

void setup() 
{
  size(800, 800) ;
  background(255) ;
  smooth() ;
  //strokeWeight(3);
  //strokeCap(ROUND);

  BI.ysize = 50;     // Diameter of rect
  BI.xsize = 220;
  BT.ysize = 50;   // Diameter of circle
  BT.xsize = 220; 
  BI.ocolor = color(255);
  BI.hcolor = color(150);
  BT.ocolor = color(255);
  BT.hcolor = color(150);
  baseColor = color(102);
  currentColor = baseColor;
  BT.x = 0;//width/2+circleSize/2+10;
  BT.y = 50;//height/2;
  BI.x = 0;//width/2-rectSize-10;
  BI.y = 0;//height/2-rectSize/2;
  
  
  // load font
  PFont font;
  font = loadFont("BookAntiqua-48.vlw");
  textFont(font, 32);

  // Only draw once
  //noLoop();
}

void draw() {
  update();
  background(currentColor);
  
  if (IQOver) {
    fill(BI.hcolor);
  } else {
    fill(BI.ocolor);
  }
  rect(BI.x, BI.y, BI.xsize, BI.ysize);
  
  if (TCOver) {
    fill(BT.hcolor);
  } else {
    fill(BT.ocolor);
  }
  rect(BT.x, BT.y, BT.xsize, BT.ysize);

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
  
  String s = gumballMachine.toString(); //text to show inventory
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
  if ( overRect(BT.x, BT.y, BT.xsize, BT.ysize) ) {
    TCOver = true;
    IQOver = false;
    
  } else if ( overRect(BI.x, BI.y, BI.xsize, BI.ysize) ) {
    IQOver = true;
    TCOver = false;
    
  } else {
    TCOver = IQOver = false;
  }
}

void mousePressed() {
  if (TCOver) {
    //currentColor = TCColor;
    BT.ocolor = color(0);
    gumballMachine.turnCrank();
    BI.ocolor = color(255);
  }
  if (IQOver) {
    //currentColor = rectColor;
    BI.ocolor = color(0);
    gumballMachine.insertQuarter();
    BT.ocolor = color(255);
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
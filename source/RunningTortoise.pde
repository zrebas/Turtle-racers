import java.util.*;
//VARIABLES
Player p1, p2;
Button go,c1,c2,c3,c4,c5,c6,c7,c8, again, exit;
List<Button> colorButtonList;
int screen;
int win =2;
PImage tlo;
PImage finish;
 class Player{
     public int x,y;
     PImage icon;
     Player(int _x, int _y, String path){
       x = _x;
       y = _y;
       icon = loadImage(path);
     }
     void display(){
       icon.resize(330,160);
       image(icon, x,y);
     }
     void changeColor(String path){
       icon = loadImage(path);
     }
 }
 class Button{
    private int x,y,w,h,s, xoff, yoff;
    private color fillColor;
    private String text;
    public int id;
    Button(int _x, int _y, int _w, int _h, color c, String _text, int _id, int _xoff, int _yoff){
      x = _x;
      y = _y;
      w = _w;
      h = _h;
      id = _id;
      fillColor = c;
      text = _text;
      xoff = _xoff;
      yoff = _yoff;
    }
    
    void display(){
      fill(fillColor);
      stroke(255);
      strokeWeight(7);
      shape(createShape(RECT, x, y, w, h));
      textSize(65);
      fill(255);
      text(text, x+xoff, y+yoff);
    }
    
    Boolean isClicked(float mousex, float mousey){
    if(mousex>x && mousex <x+w && mousey > y && mousey < y+h){
        return true;
      }
        return false;
    }
    void clicked(){fillColor = #EBB6D4;}
    void unclicked(){fillColor = #FFDCF7;}
  }
 
 void initColorButtons(){
   c1 = new Button(180, 400, 30,30,#68C181, "", 1,0,0);
   c2 = new Button(230, 400, 30,30,#C1B065, "", 2,0,0);
   c3 = new Button(280, 400, 30,30,#547BC2, "", 3,0,0);
   c4 = new Button(330, 400, 30,30,#C267AC, "", 4,0,0);
   c5 = new Button(800, 400, 30,30,#68C181, "", 5,0,0);
   c6 = new Button(850, 400, 30,30,#C1B065, "", 6,0,0);
   c7 = new Button(900, 400, 30,30,#547BC2, "", 7,0,0);
   c8 = new Button(950, 400, 30,30,#C267AC, "", 8,0,0);
   colorButtonList = Arrays.asList(c1,c2,c3,c4,c5,c6,c7,c8);
 }
 void displayColorButtons(){
   for(Button button : colorButtonList){
        button.display();
   }
 }
 void checkColorButtons(){
   for(Button button : colorButtonList){
        if(button.isClicked(mouseX, mouseY)){
          switch(button.id){
            case 1:
              p1.changeColor("zielony.png");
              break;
            case 2:
              p1.changeColor("zolty.png");
              break;
            case 3:
              p1.changeColor("niebieski.png");
              break;
            case 4:
              p1.changeColor("rozowy.png");
              break;
            case 5:
              p2.changeColor("zielony.png");
              break;
            case 6:
              p2.changeColor("zolty.png");
              break;
            case 7:
              p2.changeColor("niebieski.png");
              break;
            case 8:
              p2.changeColor("rozowy.png");
              break;
          }
        }
     }
 }
 
 void checkGo(){
   if(go.isClicked(mouseX,mouseY)){
     screen = 1;
     p1.x = 40;
     p1.y = 250;
     p2.x = 40;
     p2.y = 400;
   }
 }
 void setup(){
    size(1200, 600);
    background(#73C3BC);
    screen = 0;
    go = new Button(500, 500, 150,75,#50b4ac, "GO!", 0, 25,60);
    initColorButtons();
    p1 = new Player(120,200,"zielony.png");
    p2 = new Player(750,200,"zolty.png");
    again = new Button(350,350,200,100,#50b4ac, "AGAIN", 0, 15,70); 
    exit = new Button(650,350,200,100,#50b4ac, "EXIT", 0, 40,70); 
    tlo = loadImage("tlo.png");
    finish = loadImage("finish.png");
    tlo.resize(1200, 600);
    finish.resize(32,300);
 }
 void draw(){
   if(screen == 0){
     background(#73C3BC);
     image(tlo, 0,0);
     textSize(65);
     fill(255);
     text("PLAYER 1",150,100);
     text("PLAYER 2",770,100);
     go.display();
     displayColorButtons();
     p1.display();
     p2.display();
   }
   else if(screen == 1){
     background(#73C3BC);
     image(tlo, 0,0);
     image(finish, 1050, 280);
     p1.display();
     p2.display();
   } //game
   else if(screen == 2){
     stroke(255);
     fill(#62bcb4);
     rect(300,100,600,400);
     fill(255);
     textSize(65);
     text("PLAYER " + win +" WIN!", 400, 230);
     textSize(35);
     text("Do you want to play again?", 400, 270);
     again.display();
     exit.display();
     
   }
 }
 void mousePressed(){
   if(screen == 0){
     checkColorButtons();
     checkGo();
   } 
   if(screen == 2){
     if(exit.isClicked(mouseX,mouseY)){
         exit();
     }
     if(again.isClicked(mouseX,mouseY)){
         p1.x = 120;
         p1.y = 200;
         p2.x = 750;
         p2.y = 200;
         screen = 0;
     }
   }
 }
 
 void keyReleased(){
   if(screen == 1){
     if(key == 'd'){
         p1.x += 5;
     }
     if(keyCode == RIGHT){
       p2.x += 5;
     }
     if(p1.x >= 800){
       screen = 2;
       win = 1;
     }
     if(p2.x >= 800){
       screen = 2;
       win = 2;
     }
   }
 }

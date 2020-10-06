ArrayList<Snake> snake= new ArrayList<Snake>();
ArrayList<Snake> snake2= new ArrayList<Snake>();
boolean apple=false;
boolean death=false;
boolean death2=false;
boolean single=false;
boolean two=false;
Food a;
PImage img;
PImage App;
PImage Face;
PImage Panda;
int score=0;
void setup(){
  size(800,800);
  frameRate(144);
  snake.add(new Snake(200,400));
  snake2.add(new Snake(600,400));
  img=loadImage("Title.jpg");
  App=loadImage("Apple.jpg");
  Face=loadImage("Face.jpg");
}
void draw(){
  if(single!=true&&two!=true){
   
    background(134,123,145);
    textSize(30);
    img.resize(800,800);
     image(img, 0,0);
     text("Click on canvas and press '1' for Single player ", 100, 300);
     text("                   and '2' for Two players", 100, 350);
     text("Controls for single player are the arrow keys", 110, 600);
     text("Controls for second player are the WASD keys", 110, 650);
  }
  
  //single player mode
  if(single==true){ 
  background(150,145,190);
  fill(1,1,1);
  textSize(20);
  text("Score: " + score, 650, 30);
  if(apple==false){
  a = new Food((int)(random(50,790)), (int)(random(50,790)));
  apple = true;
  }
 a.display();
 App.resize(25,25);
 image(App,a.getX()-13,a.getY()-13);
  
  if(death==true){
    for(int i=0;i<snake.size();i++){
    snake.get(i).speed=0;
    textSize(30);
    text("Gameover",320,370);
    text("Your Score: " + score, 300, 400);
  }
  }
 for(int i=0;i<snake.size();i++){
 fill(204,50,0);
 rect(snake.get(i).getX(),snake.get(i).getY(),25,25);
 snake.get(i).update(snake.get(i).direction);
}
Face.resize(25,25);
image(Face,snake.get(0).getX(),snake.get(0).getY());
remove();
die();
  }
  
//two player mode    
  if(two==true){
  background(13,231,219);
  fill(1,1,1);
  if(apple==false){
  a = new Food((int)(random(50,790)), (int)(random(50,790)));
  apple = true;
  }
 a.display(); 
  App.resize(25,25);
 image(App,a.getX()-13,a.getY()-13);
  
  if(death==true){
    for(int i=0;i<snake.size();i++){
    snake.get(i).speed=0;
    }
    for(int i=0; i<snake2.size();i++){
    snake2.get(i).speed=0;
    }
    textSize(30);
    text("Grey Snake Wins!", 300, 400);
  }
  if(death2==true){
    for(int i=0; i<snake2.size();i++){
    snake2.get(i).speed=0;
    }    
    for(int i=0;i<snake.size();i++){
    snake.get(i).speed=0;
    }
    textSize(30);
    text("White Snake Wins!", 300, 400);
  }

//Drawing Snake 1
for(int i=0;i<snake.size();i++){
 fill(255);
 rect(snake.get(i).getX(),snake.get(i).getY(),25,25);
 snake.get(i).update(snake.get(i).direction);
}
//Drawing Snake 2
for(int i=0;i<snake2.size();i++){
  fill(155);
  rect(snake2.get(i).getX(),snake2.get(i).getY(),25,25);
  snake2.get(i).update(snake2.get(i).direction);
}
  

remove();
remove2();
die();
die2();

  }
//reads next movement once reaching the first set of x and y for Snake 1
for(int i=1; i<snake.size(); i++){
 snake.get(i).follow();
    }
//reads next movement for Snake 2
for(int i=1; i<snake2.size(); i++){
 snake2.get(i).follow();
    }  
       
}
//Snake 1 remove
public void remove(){
    if(snake.get(0).getY()<a.y+20 && snake.get(0).getY()>a.y-20 &&snake.get(0).getX()<a.x+20&&snake.get(0).getX()>a.x-20){  
       apple=false;
       grow();
       score++;
    }
}
//Snake 2 remove
public void remove2(){
    if(snake2.get(0).getY()<a.y+20 && snake2.get(0).getY()>a.y-20 &&snake2.get(0).getX()<a.x+20&&snake2.get(0).getX()>a.x-20){  
       apple=false;
       grow2();
      
    }
  }

//Snake 1 & 2 Controls
  void keyPressed(){
  if(keyCode== '1'){
    single=true;
  }
  if(keyCode== '2'){
    two=true;
  }
  if(keyCode == UP){
   if(snake.get(0).direction!="D")
      snake.get(0).direction="U";
  }
    if(keyCode== 'W')
      if(snake2.get(0).direction!="D"){
      snake2.get(0).direction="U"; 
      }
  if(keyCode == DOWN){
    if(snake.get(0).direction!="U")
      snake.get(0).direction="D";
  }
  if(keyCode== 'S'){
    if(snake2.get(0).direction!="U")
      snake2.get(0).direction="D"; 
  }
  if(keyCode == LEFT){
    if(snake.get(0).direction!="R")
      snake.get(0).direction="L";
  }
  if(keyCode== 'A'){
    if(snake2.get(0).direction!="R")
      snake2.get(0).direction="L";
  }
  if(keyCode == RIGHT){
    if(snake.get(0).direction!="L")
      snake.get(0).direction="R";
  }
  if(keyCode == 'D'){
    if(snake2.get(0).direction!="L")
      snake2.get(0).direction="R";
  }
      //adds direction change to the snakes
  if(keyCode==RIGHT||keyCode==LEFT||keyCode==DOWN||keyCode==UP){
    for(int i=1; i<snake.size(); i++)
      snake.get(i).change(snake.get(0).getX(),snake.get(0).getY(),snake.get(0).direction);
  }
  if(keyCode=='D'||keyCode=='A'||keyCode=='S'||keyCode=='W'){
    for(int i=1; i<snake2.size();i++)
    snake2.get(i).change(snake2.get(0).getX(),snake2.get(0).getY(),snake2.get(0).direction);
  }
}
//Snake 1  grow
  public void grow(){
     if(snake.get(snake.size()-1).direction.equals("R")){
    Snake b= new Snake(snake.get(snake.size()-1).getX()-20,snake.get(snake.size()-1).getY());
      snake.add(b);
    }

    if(snake.get(snake.size()-1).direction.equals("U")){
    Snake b= new Snake(snake.get(snake.size()-1).getX(),snake.get(snake.size()-1).getY()+20);
      snake.add(b);
    }

    if(snake.get(snake.size()-1).direction.equals("D")){
    Snake b= new Snake(snake.get(snake.size()-1).getX(),snake.get(snake.size()-1).getY()-20);
      snake.add(b);
    }

    if(snake.get(snake.size()-1).direction.equals("L")){
    Snake b= new Snake(snake.get(snake.size()-1).getX()+20,snake.get(snake.size()-1).getY());
      snake.add(b);
    }
   
    snake.get(snake.size()-1).direction=snake.get(snake.size()-2).direction;
    snake.get(snake.size()-1).head=snake.get(snake.size()-2).head;

  }
//Snake 2 grow
public void grow2(){
     if(snake2.get(snake2.size()-1).direction.equals("R")){
    Snake b= new Snake(snake2.get(snake2.size()-1).getX()-20,snake2.get(snake2.size()-1).getY());
      snake2.add(b);
    }  
     if(snake2.get(snake2.size()-1).direction.equals("U")){
    Snake b= new Snake(snake2.get(snake2.size()-1).getX(),snake2.get(snake2.size()-1).getY()+20);
      snake2.add(b);
    }     
    if(snake2.get(snake2.size()-1).direction.equals("D")){
    Snake b= new Snake(snake2.get(snake2.size()-1).getX(),snake2.get(snake2.size()-1).getY()-20);
      snake2.add(b);
    }    
    if(snake2.get(snake2.size()-1).direction.equals("L")){
    Snake b= new Snake(snake2.get(snake2.size()-1).getX()+20,snake2.get(snake2.size()-1).getY());
      snake2.add(b);
    }
    snake2.get(snake2.size()-1).direction=snake2.get(snake2.size()-2).direction;
    snake2.get(snake2.size()-1).head=snake2.get(snake2.size()-2).head;    
}
//Snake 1 death
public void die(){
  if(snake.get(0).getX()+25>width||snake.get(0).getX()<0||snake.get(0).getY()+25>height||snake.get(0).getY()<0){
    death=true;
  }
  for(int i=1; i<snake2.size();i++){
    if(snake.get(0).getY()<snake2.get(i).getY()+20 && snake.get(0).getY()>snake2.get(i).getY()-20 &&snake.get(0).getX()<snake2.get(i).getX()+20&&snake.get(0).getX()>snake2.get(i).getX()-20){
      death=true;
    }
  }

}
//Snake 2 death
public void die2(){
  if(snake2.get(0).getX()+25>width||snake2.get(0).getX()<0||snake2.get(0).getY()+25>height||snake2.get(0).getY()<0){
    death2=true;
  }
    for(int i=1; i<snake.size();i++){
    if(snake2.get(0).getY()<snake.get(i).getY()+20 && snake2.get(0).getY()>snake.get(i).getY()-20 &&snake2.get(0).getX()<snake.get(i).getX()+20&&snake2.get(0).getX()>snake.get(i).getX()-20){
      death2=true;
    }
    }
}

public class Circle extends Shape{
  private int radius;
public Circle(int x, int y, int r){
super(x,y);
r=radius;
}
public int getRadius(){
  return radius;
}
public void display(){
  ellipse(getX(),getY(),r,r);
  fill(r,g,b);
}
}
public class Food implements Getters{
private int x;
private int y;
public int r;
public int g;
public int b;
  public Food(int xc, int yc){
  x=xc;
  y=yc;
  r=25;
  g=25;
  b=25;
  }
    public int getX(){
    return x;
  }
  public int getY(){
    return y;
  }
    public void display(){
     ellipse(x,y,r,r);
  fill(r,g,b);
  }
}
public interface Getters{
  public int getX();
  public int getY();
}
public class  Rectangle extends Shape{
  private int w, h;
  public Rectangle(int x, int y, int wi, int he){
    super(x,y);
    w=wi;
    h=he;
  }
  public int getWidth(){
    return w;
  }
  public int getHeight(){
    return h;
  }
  public void display(){
    rectMode(CENTER);
    rect(getX(),getY(),w,h);
    fill(r,g,b);
  }
}
public class Direction implements Getters{
  private int x;
  private int y;
  public String Dchange;
  public Direction(int c, int v, String str){
    x=c;
    y=v;
    Dchange=str;
  }
  public int getX(){
    return x;
  }
  public int getY(){
    return y;
  }
}
public class Snake implements Getters {
  private int x;
  private int y;
  private int speed;
  String direction;
Direction [] head;
  public Snake(int xc, int yc){
   x=xc;
   y=yc;
   head=new Direction[0];
   speed=2;
   direction="R";
  }
    public int getX(){
    return x;
  }
  public int getY(){
    return y;
  }
   public void update(String str){
    if(str.equals("U"))
      y-=speed;
    if(str.equals("D"))
      y+=speed;
    if(str.equals("L"))
      x-=speed;
    if(str.equals("R"))
      x+=speed;
  }


  
    public void change(int x, int y, String str){
Direction[] temp = new Direction[head.length + 1];
    for(int i=0; i<head.length; i++)
      temp[i] = head[i];
    head = temp;
    head[head.length-1] = new Direction(x,y,str);
  }
    public void follow(){
    if(head.length>=1)
      if(x==head[0].x&&y==head[0].y){
        direction=head[0].Dchange;
     Direction[] temp = new Direction[head.length - 1];
    for(int i=1; i<head.length; i++)
      temp[i-1] = head[i];
    head = temp;
      }
  }

}
public class Shape{
private int x;
private int y;
public int r;
public int g;
public int b;
public int xspeed;
public int yspeed;
public Shape(int xc, int yc){
  x=xc;
  y=yc;
  r= (int) random(0,255);
  g= (int) random(0,255);
  b= (int) random(0,255);
  xspeed= (int) random(-10,10);
  yspeed= (int) random(-10,10);
}
  public int getX(){
    return x;
  }
  public int getY(){
    return y;
  }
  public void display(){
    System.out.println("Can't display abstract shape.");
  }
  public void update(){
    x+=xspeed;
    y+=yspeed;
    if(x <0){
      xspeed=-xspeed;
    }
    if(x>800){
      
      xspeed=-xspeed;
    }
    if(y<0){
      
      yspeed=-yspeed;
    }
    if(y>800){
      
      yspeed=-yspeed;
    }
  }
}

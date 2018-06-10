public class Fruit{
  float x, xspeed, xacc;
  float y, yspeed, yacc;;
  PImage img;
  long time=System.currentTimeMillis();
  String[] fruits= {"Banana.png", "Coconut.png", "Dragonfruit.png",
                    "Freeze_Banana.png", "Frenzy_Banana.png","Green_Apple.png",
                    "Kiwi_Fruit.png", "Lemon.png","Lime.png", 
                    "Mango.png", "Orange.png", "Passionfruit.png", 
                    "Pear.png", "Pineapple.png","Plum.png",
                    "Pomegranate.png", "Red_Apple.png","Score_2x_Banana.png", 
                    "Strawberry.png", "Watermelon.png", "Bomb.png"};
                    
  String imaged="";
  public Fruit(){
    int place=(int)random(21);
    imaged=fruits[place];
    img=loadImage(imaged);
    x = random(width);
    y = height-60;
    xspeed= random(1)+.1;
    xacc=-.01;
    yspeed= -(random(.5)+2);
    yacc=.01;
    if(x>(width/2)){
         x = -xspeed;
         xacc=-xacc;
    }
    if(x==width/2){
         //mid=true; 
         xspeed=0;
     }  
    }
 public String thefruit(){
  return imaged; 
 }

    boolean move=true;
    //private boolean mid=false;
     public void update(ArrayList<Fruit> others) {
       if(move==true){
    //change the position etc.
    x += xspeed; 
    y += yspeed; 
    yspeed += yacc;
    xspeed += xacc;
       }
     }
     
     ///Bomb
    boolean killedx=false;;
    public boolean killed(){
      return killedx;
    }
    public boolean killing(){
       return (withinWidth(mouseX) && withinLength(mouseY));
    }
    public boolean withinWidth(int xplace){
      if(xplace<= x+25 && xplace>=x-25){
          killedx=true;
         return true; 
      }
      return false;
    }
   public boolean withinLength(int yplace){
      if(yplace<= y+30 && yplace>=y-30){
         return true; 
      }
      return false;
    }
    boolean gameend=false;
    public boolean ended(){
     return gameend; 
    }
    
    //Hit
    public void kill(){
      if(imaged.equals("Bomb.png")){
        //img=loadImage("End.png");
        clear();
        //image(img);//,width,height,width,height);
        gameend=true;
        //move=false;
      }
      else{
      if(imaged.equals("Freeze_Banana.png")){
        frozenBanana=true;
      }
      if(imaged.equals("Score_2x_Banana.png")){
        doubleBanana=true;
      }
      if(imaged.equals("Frenzy_Banana.png")){
        frenzyBanana=true;
      }
      img=loadImage("stain.png");
      image(img,x,y,50,60);
      move=false;
    }
   }
  
    
    
    
    //Freeze
    boolean frozenBanana;
    public boolean isfrozen(){
      return frozenBanana;
    }
  float origxs,origxa;
  float origys,origya; 
  public void setfreeze(boolean ok){
     frozenBanana=ok;
     if(frozenBanana){
       xspeed= xspeed/4;
       xacc=xacc/4;
      yspeed= yspeed/2;
       yacc=yacc/3;
       if(x>(width/2)){
           x = -xspeed;
           xacc=-xacc;
      }
      if(x==width/2){
           //mid=true; 
           xspeed=0;
       } 
     }else
       {
       xspeed= random(1)+.1;
      xacc=-.01;
      yspeed= -2.5;
      yacc=.01;
      if(x>(width/2)){
           x = -xspeed;
           xacc=-xacc;
      }
      if(x==width/2){
           //mid=true; 
           xspeed=0;
       } 
     }
  }
  
  
  //Double
  boolean doubleBanana;
  public boolean isdouble(){
      return doubleBanana;
  }
  public void setdouble(boolean ok){
     doubleBanana=ok; 
  }
  
  //Frenzy
  boolean frenzyBanana;
  public boolean isfrenzy(){
      return frenzyBanana;
  }
  public void setfrenzy(boolean ok){
     frenzyBanana=ok; 
  }
  
 public void display(){
      image(img,x,y,50,60); 
 }
}

PImage img;  // Declare a variable of type PImage
User myUser;
int fps = 60;
int c = 60*fps; // game time: 60 seconds
int score = 0; // initial score
PFont font;
ArrayList<Star> myStars = new ArrayList<Star>();
int nb_stars = 5;

void setup() {
  //size(1920,1080);
  size(1024,768,P3D);
  //fullScreen(P3D);
  frameRate(fps); 
  smooth();
  noStroke();
  font = createFont("consolas",48);
  textFont(font);
  // Make a new instance of a PImage by loading an image file
  img = loadImage("demo.png");
  
  for(int i=0;i<nb_stars;i++){
    myStars.add(new Star());
  }
  
  fill(255);
  myUser = new User(width/4+200);
  
  

}

void draw() {
  // every 1 frame(s)
  if (frameCount % 1 == 0) {
    background(0);
    // Draw the image to the screen at coordinate (0,0)
    image(img,0,0);
    counter();
    fill(0);
    // should be replaces by image
    ellipse(width/2, height, width/2, width/2);
    
    myUser.display();
    myUser.move();
    
    for(Star myStar:myStars){
      if(euc_dis(myUser.posX,myStar.posX,myUser.posY,myStar.posY)<15){
        myStar.move();
        score += 1;
      }
      myStar.display();

    }
    


  }
}

void counter(){
  c -= 1;
  fill(255);
  text(c/fps,0.05*width,0.05*height);
  text(score,0.95*width,0.05*height);  
  if(c==0){
    //fill(20,40,240);
    noStroke();
    //rect(100,400,450,60);
    text("Game Over",width/2,height/2);
    stop();
  }
}

float euc_dis(float x1,float x2,float y1,float y2){
  return sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2));
}

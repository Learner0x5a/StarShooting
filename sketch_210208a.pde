PImage img;  // Declare a variable of type PImage
User myuser;

void setup() {
  //size(1920,1080);
  size(400,200,P3D);
  //fullScreen(P3D);
  fill(255);
  myuser = new User(width/4+64);
  // Make a new instance of a PImage by loading an image file
  img = loadImage("demo.png");
  smooth();
  noStroke();

}

void draw() {
  // every 1 frame(s)
  if (frameCount % 1 == 0) {
    background(0);
    // Draw the image to the screen at coordinate (0,0)
    image(img,0,0);
    fill(0);
    // should be replaces by image
    ellipse(width/2, height, width/2, width/2);
    fill(255);

    myuser.display();
    myuser.move();

  }
}

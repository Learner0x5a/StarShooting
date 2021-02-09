class User{
  float radial_distance;
  float posX,posY;
  float vel;
  color uCol;
  boolean uStroke;
  
  User(float _radial_distance){

    radial_distance = _radial_distance;
    vel = 0.1;
    //uCol = color(random(255), random(255), random(255));
    uCol = 255;
    uStroke = false;
  }
  
  void display(){
    fill(uCol); //set color
    
    if(!uStroke){ //set stroke
      noStroke();
    }
    
    pushMatrix();
    translate(width/2, height);
    rotate(radians(frameCount * 1  % 180));
    // User is a circle at (-radial_distance, 0)
    //ellipse(-radial_distance, 0, 20, 20);
    
    // get the absolute coordinates for (-radial_distance, 0)
    posX = modelX(-radial_distance, 0, 0);
    posY = modelY(-radial_distance, 0, 0);
    popMatrix();

    // draw the user 
    ellipse(posX,posY,20,20);
    


    print(radial_distance,posX,posY,'\n');
    
}
  
  void move(){
    radial_distance -= vel;

    //if(posX >= width || posX <= 0 || posY >= height || posY <= 0){
    //  radial_distance = width/4;
    //}
    
    if(radial_distance <= width/4 && radial_distance >=0){
      radial_distance = width/4;
    }
    
  }
  
}
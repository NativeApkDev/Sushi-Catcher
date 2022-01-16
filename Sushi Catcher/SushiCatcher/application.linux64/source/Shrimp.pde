// Creating Shrimp class representing shrimp

class Shrimp {
  // Name of shrimp
  String name;
  
  // Position of Shrimp
  float shrimpX;
  float shrimpY;
  
  // Dimensions of shrimp
  float shrimpWidth = 120;
  float shrimpHeight = 120;
  
  // Number of points gained for catching shrimp
  int pointsGained = 10;
  
  // Whether it has collided with bowl or not
  boolean hasCollidedWithBowl = false;
  
  // Constructor
  Shrimp(float shrimpX, float shrimpY){
    int number = (int) Math.floor(Math.random() * 4) + 1;
    name = "Shrimp " + number;
    this.shrimpX = shrimpX;
    this.shrimpY = shrimpY;
  }
  
  // Method to indicate if the shrimp has dropped
  boolean dropped(){
    return shrimpY >= height;
  }
  
  // Creating a method to draw shrimp
  void draw(){
    // Checking whether it has dropped or not
    if (dropped()){
      return; // do not draw
    }
    
    // Checking whether it has been caught by the player or not
    if (hasCollidedWithBowl) {
      return; // Do not draw
    }
    
    PImage shrimpImage = loadImage(name + ".png");
    image(shrimpImage, shrimpX, shrimpY, shrimpWidth, shrimpHeight);
  }
  
  // Method to move the shrimp
  void move(){
    if (!dropped() && !collidesWithBowl(bowl)){
      // Move COVID19 sideways and downwards at a rate depending on the game mode.
      int xSpeed;
      int ySpeed;
      if (gameMode == GameMode.EASY){
        xSpeed = int(random(1, 4));
        ySpeed = int(random(24, 31));
        
        // Move left or right randomly
        int leftOrRight = int(random(1, 3));
        if (leftOrRight == 1){
          // Move left
          shrimpX -= xSpeed;
        }
        else {
          // Move right
          shrimpX += xSpeed;
        }
        
        // Move downwards
        shrimpY += ySpeed;
        
        if (shrimpX < 0){
          shrimpX = 0;
        }
        if (shrimpX > width - shrimpWidth){
          shrimpX = width - shrimpWidth;
        }
      }
      else if (gameMode == GameMode.MEDIUM){
        xSpeed = int(random(1, 4));
        ySpeed = int(random(37, 44));
        
        // Move left or right randomly
        int leftOrRight = int(random(1, 3));
        if (leftOrRight == 1){
          // Move left
          shrimpX -= xSpeed;
        }
        else {
          // Move right
          shrimpX += xSpeed;
        }
        
        // Move downwards
        shrimpY += ySpeed;
        
        if (shrimpX < 0){
          shrimpX = 0;
        }
        if (shrimpX > width - shrimpWidth){
          shrimpX = width - shrimpWidth;
        }
      }
      
      else {
        xSpeed = int(random(1, 4));
        ySpeed = int(random(55, 62));
        
        // Move left or right randomly
        int leftOrRight = int(random(1, 3));
        if (leftOrRight == 1){
          // Move left
          shrimpX -= xSpeed;
        }
        else {
          // Move right
          shrimpX += xSpeed;
        }
        
        // Move downwards
        shrimpY += ySpeed;
        
        if (shrimpX < 0){
          shrimpX = 0;
        }
        if (shrimpX > width - shrimpWidth){
          shrimpX = width - shrimpWidth;
        }
      }
    }
  }
  
  // Method detecting whether it collides with bowl or not
  boolean collidesWithBowl(Bowl bowl){
    // Bottom case
    boolean bottom = shrimpX >= bowl.bowlX && shrimpX <= bowl.bowlX + bowl.bowlWidth && shrimpY + shrimpHeight >= bowl.bowlY;
    
    // Top case
    boolean top = shrimpX >= bowl.bowlX && shrimpX <= bowl.bowlX + bowl.bowlWidth && shrimpY <= bowl.bowlY + bowl.bowlHeight;
    
    // Left case
    boolean left = shrimpY >= bowl.bowlY && shrimpY <= bowl.bowlY + bowl.bowlHeight && shrimpX + shrimpWidth >= bowl.bowlX;
    
    // Right case
    boolean right = shrimpY >= bowl.bowlY && shrimpY <= bowl.bowlY + bowl.bowlHeight && shrimpX <= bowl.bowlX + bowl.bowlWidth;
    
    return bottom && top && left && right;
  }
}

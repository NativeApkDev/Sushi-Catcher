// Creating Fish class representing the fish

class Fish {
  // Name of fish
  String name;
  
  // Position of Fish
  float fishX;
  float fishY;
  
  // Dimensions of fish
  float fishWidth = 120;
  float fishHeight = 120;
  
  // Number of points gained for catching fish
  int pointsGained = 5;
  
  // Whether it has collided with bowl or not
  boolean hasCollidedWithBowl = false;
  
  // Constructor
  Fish(float fishX, float fishY){
    int number = (int) Math.floor(Math.random() * 4) + 1;
    name = "Fish " + number;
    this.fishX = fishX;
    this.fishY = fishY;
  }
  
  
  // Method to indicate if the fish has dropped
  boolean dropped(){
    return fishY >= height;
  }
  
  // Creating a method to draw fish
  void draw(){
    // Checking whether it has dropped or not
    if (dropped()){
      return; // do not draw
    }
    
    // Checking whether it has been caught by the player or not
    if (hasCollidedWithBowl) {
      return; // Do not draw
    }
    
    PImage fishImage = loadImage(name + ".png");
    image(fishImage, fishX, fishY, fishWidth, fishHeight);
  }
  
  // Method to move the fish
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
          fishX -= xSpeed;
        }
        else {
          // Move right
          fishX += xSpeed;
        }
        
        // Move downwards
        fishY += ySpeed;
        
        if (fishX < 0){
          fishX = 0;
        }
        if (fishX > width - fishWidth){
          fishX = width - fishWidth;
        }
      }
      else if (gameMode == GameMode.MEDIUM){
        xSpeed = int(random(1, 4));
        ySpeed = int(random(37, 44));
        
        // Move left or right randomly
        int leftOrRight = int(random(1, 3));
        if (leftOrRight == 1){
          // Move left
          fishX -= xSpeed;
        }
        else {
          // Move right
          fishX += xSpeed;
        }
        
        // Move downwards
        fishY += ySpeed;
        
        if (fishX < 0){
          fishX = 0;
        }
        if (fishX > width - fishWidth){
          fishX = width - fishWidth;
        }
      }
      
      else {
        xSpeed = int(random(1, 4));
        ySpeed = int(random(55, 62));
        
        // Move left or right randomly
        int leftOrRight = int(random(1, 3));
        if (leftOrRight == 1){
          // Move left
          fishX -= xSpeed;
        }
        else {
          // Move right
          fishX += xSpeed;
        }
        
        // Move downwards
        fishY += ySpeed;
        
        if (fishX < 0){
          fishX = 0;
        }
        if (fishX > width - fishWidth){
          fishX = width - fishWidth;
        }
      }
    }
  }
  
  // Method detecting whether it collides with bowl or not
  boolean collidesWithBowl(Bowl bowl){
    // Bottom case
    boolean bottom = fishX >= bowl.bowlX && fishX <= bowl.bowlX + bowl.bowlWidth && fishY + fishHeight >= bowl.bowlY;
    
    // Top case
    boolean top = fishX >= bowl.bowlX && fishX <= bowl.bowlX + bowl.bowlWidth && fishY <= bowl.bowlY + bowl.bowlHeight;
    
    // Left case
    boolean left = fishY >= bowl.bowlY && fishY <= bowl.bowlY + bowl.bowlHeight && fishX + fishWidth >= bowl.bowlX;
    
    // Right case
    boolean right = fishY >= bowl.bowlY && fishY <= bowl.bowlY + bowl.bowlHeight && fishX <= bowl.bowlX + bowl.bowlWidth;
    
    return bottom && top && left && right;
  }
}

// Creating the class Sushi which represents sushi appearing in the game.


class Sushi {
  // List of possible names of sushi
  String possibleNames[] = {"Avocado", "Katsu", "Omelette", "Salmon", "Tuna"};
  
  // Name of sushi
  String name;
  
  // Coordinates of sushi
  float sushiX;
  float sushiY;
  
  // Dimensions of sushi
  int sushiWidth = 120;
  int sushiHeight = 120;
  
  // Number of points gained for catching sushi
  int pointsGained = 1;
  
  // Whether it has collided with bowl or not
  boolean hasCollidedWithBowl = false;
  
  // Constructor
  Sushi(float sushiX, float sushiY){
    int nameIndex = (int) Math.floor(Math.random() * possibleNames.length);
    int number = (int) Math.floor(Math.random() * 4) + 1;
    name = possibleNames[nameIndex] + " Sushi " + number;
    this.sushiX = sushiX;
    this.sushiY = sushiY;
  }
  
  // Method to draw the sushi
  void draw(){
    // Checking whether it has dropped or not
    if (dropped()){
      return; // do not draw
    }
    
    // Checking whether it has been caught by the player or not
    if (hasCollidedWithBowl) {
      return; // Do not draw
    }
    
    PImage sushiImage = loadImage(name + ".png");
    image(sushiImage, sushiX, sushiY, sushiWidth, sushiHeight);
  }
  
  // Method to indicate if the sushi has dropped
  boolean dropped(){
    return sushiY >= height;
  }
  
  // Method to move the sushi
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
          sushiX -= xSpeed;
        }
        else {
          // Move right
          sushiX += xSpeed;
        }
        
        // Move downwards
        sushiY += ySpeed;
        
        if (sushiX < 0){
          sushiX = 0;
        }
        if (sushiX > width - sushiWidth){
          sushiX = width - sushiWidth;
        }
      }
      else if (gameMode == GameMode.MEDIUM){
        xSpeed = int(random(1, 4));
        ySpeed = int(random(37, 44));
        
        // Move left or right randomly
        int leftOrRight = int(random(1, 3));
        if (leftOrRight == 1){
          // Move left
          sushiX -= xSpeed;
        }
        else {
          // Move right
          sushiX += xSpeed;
        }
        
        // Move downwards
        sushiY += ySpeed;
        
        if (sushiX < 0){
          sushiX = 0;
        }
        if (sushiX > width - sushiWidth){
          sushiX = width - sushiWidth;
        }
      }
      
      else {
        xSpeed = int(random(1, 4));
        ySpeed = int(random(55, 62));
        
        // Move left or right randomly
        int leftOrRight = int(random(1, 3));
        if (leftOrRight == 1){
          // Move left
          sushiX -= xSpeed;
        }
        else {
          // Move right
          sushiX += xSpeed;
        }
        
        // Move downwards
        sushiY += ySpeed;
        
        if (sushiX < 0){
          sushiX = 0;
        }
        if (sushiX > width - sushiWidth){
          sushiX = width - sushiWidth;
        }
      }
    }
  }
  
  // Method detecting whether it collides with bowl or not
  boolean collidesWithBowl(Bowl bowl){
    // Bottom case
    boolean bottom = sushiX >= bowl.bowlX && sushiX <= bowl.bowlX + bowl.bowlWidth && sushiY + sushiHeight >= bowl.bowlY;
    
    // Top case
    boolean top = sushiX >= bowl.bowlX && sushiX <= bowl.bowlX + bowl.bowlWidth && sushiY <= bowl.bowlY + bowl.bowlHeight;
    
    // Left case
    boolean left = sushiY >= bowl.bowlY && sushiY <= bowl.bowlY + bowl.bowlHeight && sushiX + sushiWidth >= bowl.bowlX;
    
    // Right case
    boolean right = sushiY >= bowl.bowlY && sushiY <= bowl.bowlY + bowl.bowlHeight && sushiX <= bowl.bowlX + bowl.bowlWidth;
    
    return bottom && top && left && right;
  }
}

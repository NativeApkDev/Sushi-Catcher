// Creating COVID19 class.

class COVID19 {
  // Name of COVID19
  String name;
  
  // Coordinates of COVID19
  float covid19X;
  float covid19Y;
  
  // Dimensions of COVID19
  int covid19Width = 120;
  int covid19Height = 120;
  
  // Whether it has collided with bowl or not
  boolean hasCollidedWithBowl = false;
  
  // Constructor
  COVID19(float covid19X, float covid19Y){
    name = "COVID19";
    this.covid19X = covid19X;
    this.covid19Y = covid19Y;
  }
  
  // Creating a method to draw COVID19
  void draw(){
    // Checking whether it has dropped or not
    if (dropped()){
      return; // do not draw
    }
    
    // Checking whether it has been caught by the player or not
    if (hasCollidedWithBowl) {
      return; // Do not draw
    }
    
    PImage covid19Image = loadImage(name + ".png");
    image(covid19Image, covid19X, covid19Y, covid19Width, covid19Height);
  }
  
  // Method to indicate if the COVID19 has dropped
  boolean dropped(){
    return covid19Y >= height;
  }
  
  // Method to move the COVID19
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
          covid19X -= xSpeed;
        }
        else {
          // Move right
          covid19X += xSpeed;
        }
        
        // Move downwards
        covid19Y += ySpeed;
        
        if (covid19X < 0){
          covid19X = 0;
        }
        if (covid19X > width - covid19Width){
          covid19X = width - covid19Width;
        }
      }
      else if (gameMode == GameMode.MEDIUM){
        xSpeed = int(random(1, 4));
        ySpeed = int(random(37, 44));
        
        // Move left or right randomly
        int leftOrRight = int(random(1, 3));
        if (leftOrRight == 1){
          // Move left
          covid19X -= xSpeed;
        }
        else {
          // Move right
          covid19X += xSpeed;
        }
        
        // Move downwards
        covid19Y += ySpeed;
        
        if (covid19X < 0){
          covid19X = 0;
        }
        if (covid19X > width - covid19Width){
          covid19X = width - covid19Width;
        }
      }
      
      else {
        xSpeed = int(random(1, 4));
        ySpeed = int(random(55, 62));
        
        // Move left or right randomly
        int leftOrRight = int(random(1, 3));
        if (leftOrRight == 1){
          // Move left
          covid19X -= xSpeed;
        }
        else {
          // Move right
          covid19X += xSpeed;
        }
        
        // Move downwards
        covid19Y += ySpeed;
        
        if (covid19X < 0){
          covid19X = 0;
        }
        if (covid19X > width - covid19Width){
          covid19X = width - covid19Width;
        }
      }
    }
  }
  
  // Method detecting whether it collides with bowl or not
  boolean collidesWithBowl(Bowl bowl){
    // Bottom case
    boolean bottom = covid19X >= bowl.bowlX && covid19X <= bowl.bowlX + bowl.bowlWidth && covid19Y + covid19Height >= bowl.bowlY;
    
    // Top case
    boolean top = covid19X >= bowl.bowlX && covid19X <= bowl.bowlX + bowl.bowlWidth && covid19Y <= bowl.bowlY + bowl.bowlHeight;
    
    // Left case
    boolean left = covid19Y >= bowl.bowlY && covid19Y <= bowl.bowlY + bowl.bowlHeight && covid19X + covid19Width >= bowl.bowlX;
    
    // Right case
    boolean right = covid19Y >= bowl.bowlY && covid19Y <= bowl.bowlY + bowl.bowlHeight && covid19X <= bowl.bowlX + bowl.bowlWidth;
    
    return bottom && top && left && right;
  }
}

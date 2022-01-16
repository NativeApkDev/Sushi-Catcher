// Initialising necessary variables

// 1. Appearing sushi
Sushi appearingSushi;

// 2. Shrimp appearing in the screen
Shrimp shrimp;

// 3. Fish appearing in the screen
Fish fish;

// 4. COVID19 appearing in the screen
COVID19 appearingCOVID19;

// 5. Boolean indicating whether we are at the main menu of the game or not
boolean mainMenu = true;

// 6. Boolean indicating whether the game is currently played or not
boolean gameIsPlayed = false;

// 7. Boolean indicating whether the game is over or not
boolean gameOver = false;

// 8. Time in seconds
int seconds;

// 9. Player's score
int score = 0; // initial value

// 10. The number of lives the player has
int lives = 3; // initial value

// 11. The current game mode the player is playing at
GameMode gameMode;

// 12. The bowl which can be controlled by the player
Bowl bowl;

// 13. Timer used
Timer timer;

// 14. Font of text in the game
PFont font;

// 15. Boolean detecting whether to spawn objects or not
boolean spawnObjects = false; // initial value

// 16. Type of sushi allowed to be caught by the user (only applicable in "HARD" game mode)
String allowedSushiType;

// 17. Boolean detecting whether the player has caught the allowed type of sushi or not
boolean hasCaughtAllowedType = true;

// 18. ArrayList of types of sushi drawn
ArrayList<PImage> sushiDrawn = new ArrayList<PImage>();

// 19. ArrayList of x-coordinates of the sushi drawn
ArrayList<Float> xList = new ArrayList<Float>();

// 20. ArrayList of y-coordinates of the sushi drawn
ArrayList<Float> yList = new ArrayList<Float>();


// Main setup method
void setup(){
  // Setting the frame rate to 60
  frameRate(60);
  
  // Setting the size of the window to 1920 pixels x 1080 pixels
  size(1920, 1080);
  
  // Initialising the timer
  timer = new Timer();
  
  // Initialising the bowl
  bowl = new Bowl();
}

// Creating a method to draw what is shown on the window
void draw(){
  if (mainMenu){
    mainMenu();
  }
  
  else if (!mainMenu && !gameOver){
    background(46, 117, 182); // blue background to clear everything on the screen
    
    // Calculating the value of the variable 'seconds'
    seconds = millis() * 1000 - floor(millis() / 1000);
    
    // Spawn objects after the countdown
    if (spawnObjects){
      // Spawning objects in the window
      int whatToSpawn = (int) Math.floor(Math.random() * 4) + 1; // 1 for sushi, 2 for fish, 3 for shrimp, 4 for COVID19
      
      // Spawn COVID19 at circumstances depending on the game mode the player is playing at
      if (gameMode == GameMode.EASY){
        // Spawn COVID19 if player's score is above 25
        if (score > 25){
          // Spawn COVID19 whenever it does not appear
          if (appearingCOVID19 == null){
            if (whatToSpawn == 4){
              // Spawn COVID19
              spawnCOVID19();
            }
          }
          else{
            appearingCOVID19.draw();
            appearingCOVID19.move();
              
            if (appearingCOVID19.collidesWithBowl(bowl)){
              if (!appearingCOVID19.hasCollidedWithBowl){
                // The player loses one live
                lives -= 1;
                appearingCOVID19.hasCollidedWithBowl = true;
              }
              if (lives == 0){
                gameOver = true;
              }
                
              // Remove the COVID19
              appearingCOVID19.covid19Y = 2000;
            }
              
            removeDroppedCOVID19();
          }
        }
      }
      else{
        // Spawn COVID19 whenever it does not appear
        if (appearingCOVID19 == null){
          if (whatToSpawn == 4){
            // Spawn COVID19
            spawnCOVID19();
          }
        }
        else{
          appearingCOVID19.draw();
          appearingCOVID19.move();
            
          if (appearingCOVID19.collidesWithBowl(bowl)){
            if (!appearingCOVID19.hasCollidedWithBowl){
              // The player loses one live
              lives -= 1;
              appearingCOVID19.hasCollidedWithBowl = true;
            }
            if (lives == 0){
              gameOver = true;
            }
              
            // Remove the COVID19
            appearingCOVID19.covid19Y = 2000;
          }
            
          removeDroppedCOVID19();
        }
      }
      
      // Spawn sushi if it is not spawned yet.
      if (appearingSushi == null){
        if (whatToSpawn == 1){
          // Spawn sushi
          spawnSushi();
        }
      }
      else {
        appearingSushi.draw();
        appearingSushi.move();
        
        if (appearingSushi.collidesWithBowl(bowl)){
          // If the player is at at "HARD" game mode
          if (gameMode == GameMode.HARD){
            // Check whether the bowl collects the correct type of sushi or not
            String[] sushiNameWords = appearingSushi.name.split(" ");
            String firstNameWord = sushiNameWords[0].toUpperCase();
            
            // If the player collects the correct type of sushi, grant him/her points.
            if (firstNameWord.equals(allowedSushiType.toUpperCase())){
              if (!appearingSushi.hasCollidedWithBowl){
                score += appearingSushi.pointsGained;
                appearingSushi.hasCollidedWithBowl = true;
                hasCaughtAllowedType = true;
              }
              
              // Remove the sushi
              appearingSushi.sushiY = 2000;;
            }
            // Else, he/she loses one live.
            else {
              if (!appearingSushi.hasCollidedWithBowl){
                lives -= 1;
                appearingSushi.hasCollidedWithBowl = true;
              }
              
              if (lives == 0){
                gameOver = true;
              }
              
              // Remove the sushi
              appearingSushi.sushiY = 2000;
            }
          }
          // Else if the player is at other game modes
          else {
            if (!appearingSushi.hasCollidedWithBowl){
              score += appearingSushi.pointsGained;
              appearingSushi.hasCollidedWithBowl = true;
            }
          }
        }
        
        if (appearingSushi.dropped()){
          // Check whether the player plays at "HARD" mode or not
          if (gameMode == GameMode.HARD){
            // Check whether the type of sushi matches the type of sushi to be caught or not
            String[] sushiNameWords = appearingSushi.name.split(" ");
            String firstNameWord = sushiNameWords[0].toUpperCase();
            if (firstNameWord.equals(allowedSushiType.toUpperCase())){
              // If the sushi has not been caught
              if (!appearingSushi.hasCollidedWithBowl){
                // The player loses one live
                lives -= 1;
                
                if (lives == 0){
                  gameOver = true;
                }
              }
            }
            else {
              // Do nothing
            }
          }
          else {
            // If the sushi has not been caught
            if (!appearingSushi.hasCollidedWithBowl){
              // The player loses one live
              lives -= 1;
              
              if (lives == 0){
                gameOver = true;
              }
            }
          }
          
          removeDroppedSushi();
        }
      }
      
      // Spawn fish if we are at either "MEDIUM" or "HARD" game mode
      if (gameMode == GameMode.MEDIUM){
        // Spawn fish if it is not spawned yet.
        if (fish == null){
          if (whatToSpawn == 2){
            // Spawn fish
            spawnFish();
          }
        }
        else{
          fish.draw();
          fish.move();
          
          if (fish.collidesWithBowl(bowl)){
            if (!fish.hasCollidedWithBowl){
              // Give the player bonus points
              score += fish.pointsGained;
              fish.hasCollidedWithBowl = true;
            }
            
            // Remove the fish
            fish.fishY = 2000;
          }
          
          removeDroppedFish();
        }
      }
      else if (gameMode == GameMode.HARD){
        // Spawn fish if it is not spawned yet.
        if (fish == null){
          if (whatToSpawn == 2){
            // Spawn fish
            spawnFish();
          }
        }
        else{
          fish.draw();
          fish.move();
          
          if (fish.collidesWithBowl(bowl)){
            if (!fish.hasCollidedWithBowl){
              // The player loses one live
              lives -= 1;
              fish.hasCollidedWithBowl = true;
            }
            
            if (lives == 0){
              gameOver = true;
            }
            
            // Remove the fish
            fish.fishY = 2000;
          }
          
          removeDroppedFish();
        }
      }
      
      // Spawn shrimp if we are at either "MEDIUM" or "HARD" game mode
      if (gameMode == GameMode.MEDIUM){
        // Spawn shrimp if it is not spawned yet.
        if (shrimp == null){
          if (whatToSpawn == 3){
            // Spawn shrimp
            spawnShrimp();
          }
        }
        else {
          shrimp.draw();
          shrimp.move();
          
          if (shrimp.collidesWithBowl(bowl)){
            if (!shrimp.hasCollidedWithBowl){
              // Give the player bonus points
              score += shrimp.pointsGained;
              shrimp.hasCollidedWithBowl = true;
            }
            
            // Remove the shrimp
            shrimp.shrimpY = 2000;
          }
          
          removeDroppedShrimp();
        }
      }
      else if (gameMode == GameMode.HARD){
        // Spawn shrimp if it is not spawned yet.
        if (shrimp == null){
          if (whatToSpawn == 3){
            // Spawn shrimp
            spawnShrimp();
          }
        }
        else {
          shrimp.draw();
          shrimp.move();
          
          if (shrimp.collidesWithBowl(bowl)){
            if (!shrimp.hasCollidedWithBowl){
              // The player loses one live
              lives -= 1;
              shrimp.hasCollidedWithBowl = true;
            }
            
            if (lives == 0){
              gameOver = true;
            }
            
            // Remove the shrimp
            shrimp.shrimpY = 2000;
          }
          
          removeDroppedShrimp();
        }
      }
    }
    
    // Calling important methods from classes and displaying important information on the screen
    bowl.draw();
    bowl.control();
    bowl.countdown(timer);
    displayCurrentGameMode();
    displayScore();
    displayLives();
    
    // Display the type of sushi allowed to be caught if the player is playing "HARD" game mode
    if (gameMode == GameMode.HARD){
      if (hasCaughtAllowedType){
        String[] allowedSushiTypes = {"Avocado", "Katsu", "Omelette", "Salmon", "Tuna"};
        allowedSushiType = allowedSushiTypes[(int) random(0, allowedSushiTypes.length)];
        hasCaughtAllowedType = false;
      }
      displayAllowedSushiType(allowedSushiType);
    }
  }
  
  else if (gameOver){
    gameIsPlayed = false;
    gameMode = null;
    spawnObjects = false;
    restartGame(); // displaying menu which allows the player to restart the game
  }
  
  // Saving and loading high score depending on the game mode being played
  if (gameMode == null){
    // Do nothing as no high score needs to be shown
  }
  
  // If the player is playing at "EASY" game mode
  else if (gameMode == GameMode.EASY){
    String easyHighScoreString = str(score);
    String[] easyScores = {easyHighScoreString};
    String[] savedEasyScores = loadStrings("easy_highscore.txt");
    int easyHighScore = int(savedEasyScores[0]);
    
    // If the current player's score at "EASY" game mode is greater than the high score in "EASY" game mode.
    if (score > easyHighScore){
      saveStrings("easy_highscore.txt", easyScores);
    }
    
    // Loading high score for "EASY" game mode
    String[] savedEasyScores2 = loadStrings("easy_highscore.txt");
    int easyHighScore2 = int(savedEasyScores2[0]);
    fill(255, 192, 203); // pink text
    
    // Setting the text font to 'impact.ttf'
    textFont(font = createFont("impact.ttf", 18));
    textSize(30); // setting the text size to 30
    text("High Score: ", 30, 60);
    text(easyHighScore2, 200, 60);
  }
  
  // Else if the player is playing at "MEDIUM" game mode
  else if (gameMode == GameMode.MEDIUM){
    String mediumHighScoreString = str(score);
    String[] mediumScores = {mediumHighScoreString};
    String[] savedMediumScores = loadStrings("medium_highscore.txt");
    int mediumHighScore = int(savedMediumScores[0]);
    
    // If the current player's score at "MEDIUM" game mode is greater than the high score in "MEDIUM" game mode.
    if (score > mediumHighScore){
      saveStrings("medium_highscore.txt", mediumScores);
    }
    
    // Loading high score for "MEDIUM" game mode
    String[] savedMediumScores2 = loadStrings("medium_highscore.txt");
    int mediumHighScore2 = int(savedMediumScores2[0]);
    fill(255, 192, 203); // pink text
    
    // Setting the text font to 'impact.ttf'
    textFont(font = createFont("impact.ttf", 18));
    textSize(30); // setting the text size to 30
    text("High Score: ", 30, 60);
    text(mediumHighScore2, 200, 60);
  }
  
  // Else if the player is playing at "HARD" game mode
  else if (gameMode == GameMode.HARD){
    String hardHighScoreString = str(score);
    String[] hardScores = {hardHighScoreString};
    String[] savedHardScores = loadStrings("hard_highscore.txt");
    int hardHighScore = int(savedHardScores[0]);
    
    // If the current player's score at "HARD" game mode is greater than the high score in "HARD" game mode.
    if (score > hardHighScore){
      saveStrings("hard_highscore.txt", hardScores);
    }
    
    // Loading high score for "HARD" game mode
    String[] savedHardScores2 = loadStrings("hard_highscore.txt");
    int hardHighScore2 = int(savedHardScores2[0]);
    fill(255, 192, 203); // pink text
    
    // Setting the text font to 'impact.ttf'
    textFont(font = createFont("impact.ttf", 18));
    textSize(30); // setting the text size to 30
    text("High Score: ", 30, 60);
    text(hardHighScore2, 200, 60);
  }
}


// Creating a method to display player's current score
void displayScore(){
  fill(255, 255, 0); // yellow text
  
  // Setting the text font to 'impact.ttf'
  textFont(font = createFont("impact.ttf", 18));
  textSize(30);
  text("Score: ", 400, 60);
  text(str(score), 500, 60);
}


// Creating a method to display the number of lives the player currently has
void displayLives(){
  fill(255, 165, 0); // orange text
  
  // Setting the text font to 'impact.ttf'
  textFont(font = createFont("impact.ttf", 18));
  textSize(30);
  text("Lives: ", 700, 60);
  text(str(lives), 800, 60);
}


// Creating a method to display the only type of sushi allowed to be caught by the player
void displayAllowedSushiType(String sushiType){
  fill(255, 255, 255); // white
  
  // Setting the text font to 'impact.ttf'
  textFont(font = createFont("impact.ttf", 18));
  textSize(30);
  String nameOfSushi = sushiType + " Sushi 1";
  text("NEXT CATCH ", 1300, 60);
  Sushi toBeDrawn = new Sushi(1500, 20);
  toBeDrawn.name = nameOfSushi;
  toBeDrawn.draw();
}


// Creating a method to display the current game mode the player is playing in
void displayCurrentGameMode(){
  fill(0, 255, 0); // green text
  
  // Setting the text font to 'impact.ttf'
  textFont(font = createFont("impact.ttf", 18));
  textSize(30);
  String displayText = gameMode == GameMode.EASY ? "EASY" : gameMode == GameMode.MEDIUM ? "MEDIUM" : "HARD";
  text(displayText, 1000, 60);
}


// Creating a method to spawn fish
void spawnFish(){
  // Detecting if we are at either "MEDIUM" or "HARD" game mode or not and whether the fish has been spawned or not
  if (gameMode == GameMode.MEDIUM || gameMode == GameMode.HARD && fish == null){
    // Spawn a fish
    fish = new Fish(random(0, width - 100), 100);
  }
}


// Creating a method to remove dropped fish
void removeDroppedFish(){
  if (fish != null && fish.dropped()){
    fish = null;
  }
}


// Creating a method to spawn shrimp
void spawnShrimp(){
  // Detecting if we are at either "MEDIUM" or "HARD game mode or not and whether the shrimp has been spawned or not
  if (gameMode == GameMode.MEDIUM || gameMode == GameMode.HARD && shrimp == null){
    // Spawn a shrimp
    shrimp = new Shrimp(random(0, width - 100), 100);
  }
}


// Creating a method to remove dropped shrimp
void removeDroppedShrimp(){
  if (shrimp != null && shrimp.dropped()){
    shrimp = null;
  }
}


// Creating a method to spawn a sushi
void spawnSushi(){
  // Checking whether the sushi has been spawned or not
  if (appearingSushi == null){
    // Spawn a sushi
    appearingSushi = new Sushi(random(0, width - 100), 100);
  }
}

// Creating a method to remove dropped sushi
void removeDroppedSushi(){
  if (appearingSushi != null && appearingSushi.dropped()){
    appearingSushi = null;
  }
}


// Creating a method to spawn COVID19
void spawnCOVID19(){
  // Checking whether COVID19 has been spawned or not
  if (appearingCOVID19 == null){
    // Spawn COVID19
    appearingCOVID19 = new COVID19(random(0, width - 100), 100);
  }
}

// Creating a method to remove dropped COVID19
void removeDroppedCOVID19(){
  if (appearingCOVID19 != null && appearingCOVID19.dropped()){
    appearingCOVID19 = null;
  }
}


// Creating a method to display the main menu screen
void mainMenu(){
  background(46, 117, 182); // blue background
  // Displaying important text
  // Setting the text font to 'COOPBL.TTF'
  textFont(font = createFont("COOPBL.TTF", 18));
  textSize(80);
  fill(255, 0, 0); // red text
  text("S", 625, 100);
  fill(0, 255, 0); // green text
  text("U", 675, 100);
  fill(255, 255, 0); // yellow text
  text("S", 735, 100);
  fill(255, 255, 255); // white text
  text("H", 785, 100);
  fill(255, 165, 0); // orange text
  text("I", 845, 100);
  fill(255, 192, 203); // pink text
  text("C", 905, 100);
  fill(255, 248, 220); // cornsilk text
  text("A", 955, 100);
  fill(128, 0, 0); // maroon text
  text("T", 1005, 100);
  fill(0, 255, 0); // green text
  text("C", 1055, 100);
  fill(255, 255, 255); // white text
  text("H", 1105, 100);
  fill(255, 0, 0); // red text
  text("E", 1165, 100);
  fill(255, 255, 0); // yellow text
  text("R", 1215, 100);
  
  // Setting the text to 'BRLNSB.TTF'
  textFont(font = createFont("BRLNSB.TTF", 12));
  fill(255, 248, 220); // cornsilk text
  textSize(60);
  text("SELECT THE GAME LEVEL", 600, 400);
  
  // Displaying buttons for game mode selection
  // 1. "EASY" game mode
  PImage easyButtonImage = loadImage("Easy Button.png");
  image(easyButtonImage, 200, 600, 300, 120);
  
  // 2. "MEDIUM" game mode
  PImage mediumButtonImage = loadImage("Medium Button.png");
  image(mediumButtonImage, 800, 600, 300, 120);
  
  // 3. "HARD" game mode
  PImage hardButtonImage = loadImage("Hard Button.png");
  image(hardButtonImage, 1400, 600, 300, 120);
  
  // Drawing sushi
  image(loadImage("Katsu Sushi 1.png"), 150, 150, 120, 120);
  image(loadImage("COVID19.png"), 760, 180, 120, 120);
  image(loadImage("Avocado Sushi 2.png"), 1380, 135, 120, 120);
  image(loadImage("Shrimp 3.png"), 335, 440, 120, 120);
  image(loadImage("Omelette Sushi 3.png"), 620, 460, 120, 120);
  image(loadImage("Fish 2.png"), 1210, 435, 120, 120);
  image(loadImage("Salmon Sushi 2.png"), 275, 825, 120, 120);
  image(loadImage("Fish 1.png"), 835, 840, 120, 120);
  image(loadImage("COVID19.png"), 1190, 875, 120, 120);
  image(loadImage("Salmon Sushi 1.png"), 1650, 350, 120, 120);
  
  noFill(); // Preventing from overlapping with any other objects in the window
}


// Creating a method to display the screen when the game is over. This screen allows the player to choose to restart the game.
void restartGame(){
  fill(255, 0, 0); // red
  textSize(120);
  text("GAME OVER", 630, 460);
  
  fill(0, 255, 0); // green
  textSize(70);
  text("RESTART", 870, 725);
}


// Creating a method which tells what will happen when the mouse is pressed
void mousePressed(){
  // If the game is not being played
  if (!gameIsPlayed){
    if (!gameOver){
      // Determining if the player chooses to play in "EASY" game mode
      if (mouseX >= 200 && mouseX <= 500 && mouseY >= 600 && mouseY <= 720){
        // Set the game mode to "EASY"
        gameMode = GameMode.EASY;
        mainMenu = false;
        timer.start(); // starting the timer
        gameIsPlayed = true;
        gameOver = false;
        score = 0;
      }
      
      // Determining if the player chooses to play in "MEDIUM" game mode
      else if (mouseX >= 800 && mouseX <= 1100 && mouseY >= 600 && mouseY <= 720){
        // Set the game mode to "MEDIUM"
        gameMode = GameMode.MEDIUM;
        mainMenu = false;
        timer.start(); // starting the timer
        gameIsPlayed = true;
        gameOver = false;
        score = 0;
      }
      
      // Determining if the player chooses to play in "HARD" game mode
      else if (mouseX >= 1400 && mouseX <= 1700 && mouseY >= 600 && mouseY <= 720){
        // Set the game mode to "HARD"
        gameMode = GameMode.HARD;
        mainMenu = false;
        timer.start(); // starting the timer
        gameIsPlayed = true;
        gameOver = false;
        score = 0;
      }
    }
    // If the game is over.
    else {
      if (mouseX >= 850 && mouseX <= 1100 && mouseY >= 675 && mouseY <= 850) {
        // Go to the main menu
        mainMenu = true;
        gameOver = false;
        hasCaughtAllowedType = true;
        sushiDrawn = new ArrayList<PImage>();
        lives = 3;
        score = 0;
      }
    }
  }
}

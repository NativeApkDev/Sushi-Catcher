// Creating Bowl class.

class Bowl {
  // Coordinates of bowl
  float bowlX = width / 2;
  float bowlY = height - 230;
  
  // Dimensions of bowl
  int bowlWidth = 240;
  int bowlHeight = 180;
  
  // Method used to control the bowl
  void control(){
    if (mouseX < -bowlWidth){
      bowlX = -bowlWidth;
    }
    else if (mouseX > width - bowlWidth){
      bowlX = width - bowlWidth;
    }
    else {
      bowlX = mouseX;
    }
  }
  
  // Creating a method to draw the bowl
  void draw(){
    noFill(); // ensuring that the bowl does not overlap anything on the screen.
    PImage bowlImage = loadImage("Bowl.png");
    image(bowlImage, bowlX, bowlY, bowlWidth, bowlHeight);
  }
  
  // Countdown before game starts
  void countdown(Timer timer){
    // Checking whether we are at the main menu or not
    if (!mainMenu){
      if (timer.calculateTimeElapsed() > 0 && timer.calculateTimeElapsed() < 20100){
        // Code to implement countdown depending on the game mode the player is playing at
        if (gameMode == GameMode.EASY){
          if (timer.calculateTimeElapsed() > 2000 && timer.calculateTimeElapsed() <= 7000){
            fill(255, 255, 0); // yellow
        
            // Setting the text font to 'impact.ttf'
            textFont(font = createFont("impact.ttf", 18));
            textSize(100);
            text("3", width / 2 + 30, height / 2 - 300);
            
            // Draw a sushi
            PImage sushiImage = loadImage("Katsu Sushi 1.png");
            image(sushiImage, width / 2, height / 2 - 200, 120, 120);
            
            fill(255, 255, 255); // white
            textSize(70);
            text("MOVE THE BOWL TO CATCH SUSHI", width / 2 - 380, height / 2 + 100);
            
            // Draw a tick
            PImage tickImage = loadImage("tick.png");
            image(tickImage, width / 2, height / 2 + 160, 120, 120);
          }
          else if (timer.calculateTimeElapsed() > 7000 && timer.calculateTimeElapsed() <= 12000){
            // Setting the text font to 'impact.ttf'
            textFont(font = createFont("impact.ttf", 18));
            fill(255, 255, 0); // yellow
            textSize(100);
            text("2", width / 2 + 30, height / 2 - 300);
            
            // Draw a COVID19
            PImage covid19Image = loadImage("COVID19.png");
            image(covid19Image, width / 2, height / 2 - 200, 120, 120);
            
            fill(255, 255, 255); // white
            textSize(70);
            text("LOSE ONE LIFE IF YOU CATCH COVID19 OR MISS SUSHI", width / 2 - 650, height / 2 + 50);
            
            // Draw a cross
            PImage crossImage = loadImage("cross.png");
            image(crossImage, width / 2, height / 2 + 160, 120, 120);
          }
          else if (timer.calculateTimeElapsed() > 12000 && timer.calculateTimeElapsed() <= 14000){
            // Setting the text font to 'impact.ttf'
            textFont(font = createFont("impact.ttf", 18));
            fill(255, 255, 0); // yellow
            textSize(140);
            text("1", width / 2, height / 2);
          }
          else if (timer.calculateTimeElapsed() > 14000 && timer.calculateTimeElapsed() <= 16000){
            // Setting the text font to 'impact.ttf'
            textFont(font = createFont("impact.ttf", 18));
            fill(255, 255, 0); // yellow
            textSize(140);
            text("GO!", width / 2 - 60, height / 2);
          }
          else if (timer.calculateTimeElapsed() > 16000){
            // Set the values of both 'gameIsPlayed' and 'spawnObjects' to true
            gameIsPlayed = true;
            spawnObjects = true;
          }
        }
        else if (gameMode == GameMode.MEDIUM){
          if (timer.calculateTimeElapsed() > 2000 && timer.calculateTimeElapsed() <= 7000){
            fill(255, 255, 0); // yellow
        
            // Setting the text font to 'impact.ttf'
            textFont(font = createFont("impact.ttf", 18));
            textSize(100);
            text("3", width / 2 + 30, height / 2 - 350);
            
            // Draw a sushi
            PImage sushiImage = loadImage("Katsu Sushi 1.png");
            image(sushiImage, width / 2, height / 2 - 250, 120, 120);
            
            fill(255, 255, 255); // white
            textSize(70);
            text("MOVE THE BOWL TO CATCH SUSHI, FISH, OR SHRIMP", width / 2 - 600, height / 2);
            
            // Draw a tick
            PImage tickImage = loadImage("tick.png");
            image(tickImage, width / 2, height / 2 + 160, 120, 120);
          }
          else if (timer.calculateTimeElapsed() > 7000 && timer.calculateTimeElapsed() <= 12000){
            fill(255, 255, 0); // yellow
            
            // Setting the text font to 'impact.ttf'
            textFont(font = createFont("impact.ttf", 18));
            textSize(100);
            text("2", width / 2 + 30, height / 2 - 300);
            
            // Draw a COVID19
            PImage covid19Image = loadImage("COVID19.png");
            image(covid19Image, width / 2, height / 2 - 200, 120, 120);
            
            fill(255, 255, 255); // white
            textSize(70);
            text("LOSE ONE LIFE IF YOU CATCH COVID19 OR MISS SUSHI", width / 2 - 650, height / 2 + 50);
            
            // Draw a cross
            PImage crossImage = loadImage("cross.png");
            image(crossImage, width / 2, height / 2 + 160, 120, 120);
          }
          else if (timer.calculateTimeElapsed() > 12000 && timer.calculateTimeElapsed() <= 17000){
            // Setting the text font to 'impact.ttf'
            textFont(font = createFont("impact.ttf", 18));
            fill(255, 255, 0); // yellow
            textSize(100);
            text("1", width / 2 + 30, height / 2 - 300);
            
            // Draw fish
            PImage fishImage = loadImage("Fish 1.png");
            image(fishImage, width / 2 - 60, height / 2 - 200, 120, 120);
            
            // Draw shrimp
            PImage shrimpImage = loadImage("Shrimp 1.png");
            image(shrimpImage, width / 2 + 60, height / 2 - 200, 120, 120);
            
            fill(255, 255, 255); // white
            textSize(70);
            text("FISH AND SHRIMP FOR BONUS POINTS", width / 2 - 450, height / 2);
          }
          else if (timer.calculateTimeElapsed() > 17000 && timer.calculateTimeElapsed() <= 19000){
            // Setting the text font to 'impact.ttf'
            textFont(font = createFont("impact.ttf", 18));
            fill(255, 255, 0); // yellow
            textSize(140);
            text("GO!", width / 2 - 60, height / 2);
          }
          else if (timer.calculateTimeElapsed() > 19000){
            // Set the values of both 'gameIsPlayed' and 'spawnObjects' to true
            gameIsPlayed = true;
            spawnObjects = true;
          }
        }
        else if (gameMode == GameMode.HARD){
          if (timer.calculateTimeElapsed() > 2000 && timer.calculateTimeElapsed() <= 7000){
            fill(255, 255, 0); // yellow
        
            // Setting the text font to 'impact.ttf'
            textFont(font = createFont("impact.ttf", 18));
            textSize(100);
            text("3", width / 2 + 30, height / 2 - 300);
            
            // Draw a sushi
            PImage sushiImage = loadImage("Katsu Sushi 1.png");
            image(sushiImage, width / 2, height / 2 - 200, 120, 120);
            
            fill(255, 255, 255); // white
            textSize(70);
            text("MOVE THE BOWL TO CATCH INDICATED SUSHI ABOVE", width / 2 - 630, height / 2 + 100);
            
            // Draw a tick
            PImage tickImage = loadImage("tick.png");
            image(tickImage, width / 2, height / 2 + 160, 120, 120);
          }
          else if (timer.calculateTimeElapsed() > 7000 && timer.calculateTimeElapsed() <= 12000){
            fill(255, 255, 0); // yellow
            
            // Setting the text font to 'impact.ttf'
            textFont(font = createFont("impact.ttf", 18));
            textSize(100);
            text("2", width / 2 + 30, height / 2 - 350);
            
            // Draw a COVID19
            PImage covid19Image = loadImage("COVID19.png");
            image(covid19Image, width / 2, height / 2 - 250, 120, 120);
            
            fill(255, 255, 255); // white
            textSize(70);
            text("LOSE ONE LIFE IF YOU MISS INDICATED SUSHI ABOVE OR", width / 2 - 650, height / 2);
            text("CATCH ANYTHING ELSE", width / 2 - 250, height / 2 + 100);
            
            // Draw a cross
            PImage crossImage = loadImage("cross.png");
            image(crossImage, width / 2, height / 2 + 160, 120, 120);
          }
          else if (timer.calculateTimeElapsed() > 12000 && timer.calculateTimeElapsed() <= 14000){
            // Setting the text font to 'impact.ttf'
            textFont(font = createFont("impact.ttf", 18));
            fill(255, 255, 0); // yellow
            textSize(140);
            text("1", width / 2, height / 2);
          }
          else if (timer.calculateTimeElapsed() > 14000 && timer.calculateTimeElapsed() <= 16000){
            // Setting the text font to 'impact.ttf'
            textFont(font = createFont("impact.ttf", 18));
            fill(255, 255, 0); // yellow
            textSize(140);
            text("GO!", width / 2 - 60, height / 2);
          }
          else if (timer.calculateTimeElapsed() > 16000){
            // Set the values of both 'gameIsPlayed' and 'spawnObjects' to true
            gameIsPlayed = true;
            spawnObjects = true;
          }
        }
      }
    }
    
    // Setting the text to Arial
    textFont(font = createFont("Arial", 12));
    
    // Stop the timer
    timer.stop();
  }
}

// Creating Timer class to calculate the time elapsed during the game

class Timer {
  // Initialising variables representing the start and stop times.
  int startTime = 0; // initial value
  int stopTime = 0; // initial value
  
  // Initialising a variable detecting whether the timer is currently running or not.
  boolean isRunning = false; // initial value
  
  // Creating a method to start the timer
  
  void start(){
    startTime = millis();
    isRunning = true;
  }
  
  // Creating a method to stop the timer
  
  void stop(){
    stopTime = millis();
    isRunning = false;
  }
  
  // Creating a method to calculate the amount of time elapsed
  
  int calculateTimeElapsed(){
    return isRunning ? (millis() - startTime) : (stopTime - startTime);
  }
  
  // Creating a method to calculate the amount of time elapsed in seconds
  float timeElapsedInSeconds(){
    return (calculateTimeElapsed() / 1000.0);
  }
}

final class MathMain {
  Math m1;
  int val1, val2, val3, val4, val5;
  int compare;
  int[] digits;
  int counter;
  int result;
  int savedTime;
  int totalTime = 800;
  MathMain()
  {
    digits = new int[3];
    counter = 0;
    m1 = new Math(); // = 8
    val1 = (int)random(1, 10);
    val2 = (int)random(5, 15);
    val3 = (int)random(10, 20);
    val4 = (int)random(1, 10);
    val5 = (int)random(15, 25);
   
  } // end of setup()

  void draw()
  {
    if (!gameSound.isPlaying()) {
      mainSound.stop();
      gameSound.loop();
      flappySound.stop();
      looseSound.stop();
      winSound.stop();
    }
   
    m1.draw();
   

    textSize(20);
    // textFont(text, 20);
    fill(0);
    //text(val1 + "+" + val2 + "*" + val3 + "-" + val4 + "+" + val5, 100, 100);
    characters.displaySentenceCentre(val1 + "+" + val2 + "*" + val3 + "-" + val4 + "+" + val5,  200,  100, 5, #000000);
   
    compare = val1 + val2 * val3 - val4 + val5;
   
    //m1.calculate(m1.val1, m1.val2, m1.val3, m1.val4, m1.val5); // make these the input numbers

    textSize(35);
    // textFont(text, 35);
    fill(0);
    //text(digits[0], 400, 400);
   // textSize(35);
   int d0 = digits[0];
   int d1 = digits[1];
   int d2 = digits[2];
    characters.displaySentenceCentre("" + d0,  400,  400, 8, #000000);

    // textFont(text, 35);
    fill(0);
   // text(digits[1], 450, 400);
   // textSize(35);
   characters.displaySentenceCentre("" + d1,  450,  400, 8, #000000);

    // textFont(text, 35);
    fill(0);
   // text(digits[2], 500, 400);
    characters.displaySentenceCentre("" + d2,  500,  400, 8, #000000);

 
    if (counter == 3)
    {
      addNumbers(digits);
      if (compare == result)
      {
        textSize(20);
        // textFont(text, 20);
        fill(0);
        //text("Equal", 500, 500);
        characters.displaySentenceCentre("YOU WIN",  width / 2,  height / 2, 10, #ffa500);

        if (savedTime == 0) {
          savedTime = millis();
        }

        if (millis() - savedTime > totalTime) {
          level++;
          sink = new Sink(width - 200, 100, 100, height - 200, gameTimer);
          gameWindow = new GameWindow();
        }

      }
      else
      {
        if (savedTime == 0) {
          savedTime = millis();
        }

        if (millis() - savedTime > totalTime) {
          state = LOOSE;
        }
        
        textSize(20);
        // textFont(text, 20);
        fill(0);
        //text("Not equal", 500, 500);
        characters.displaySentenceCentre("Not equal",  500, 500, 8, #000000);

      }
    }
 
   
  } // end of draw()

  int addNumbers(int []arr)
  {
   
    result = (100 * digits[0]) + (10 * digits[1]) + digits[2];
    return result;
   
  }
}
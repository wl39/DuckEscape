import java.util.*;

final class MemoryCardMain {


  int savedTime = 0;
  int totalTime = 800;

  Card c1, c2, c3, c4, c5, c6, c7, c8;

  boolean c1Flip = false;
  boolean c2Flip = false;
  boolean c3Flip = false;
  boolean c4Flip = false;
  boolean c5Flip = false;
  boolean c6Flip = false;
  boolean c7Flip = false;
  boolean c8Flip = false;
  int timer1 = 150;
  int timer2 = 150;
  int timer3 = 150;
  int timer4 = 150;
  int timer5 = 150;
  int timer6 = 150;
  int timer7 = 150;
  int timer8 = 150;
  int totalFlips = 0;
  int display = 0;
  int answerTimer = 120;
  int cardColorChosen = 0;
  int count = 0;
  int oneCount = 0;
  int twoCount = 0;
  int threeCount = 0;
  int fourCount = 0;

  Card firstCardSelected = null;
  Card secondCardSelected = null;

  int maxTimer = 0;
  int initTimer = 150;
  int levelTimer = 0;
  MemoryCardMain()
  {
    // coordinates: (200, 100) (500, 100) (800, 100) (1100, 100)
    // (200, 500) (500, 500), (800, 500) (1100, 500)
    c1 = new Card(1100, 500, 0); // 1 = red
    c2 = new Card(200, 100, 0);
    c3 = new Card(800, 100, 0);  // 2 = green
    c4 = new Card(200, 500, 0);
    c5 = new Card(500, 100, 0);
    c6 = new Card(800, 500, 0); // 3 = yellow
    c7 = new Card(1100, 100, 0); // 4 = purple
    c8 = new Card(500, 500, 0);

    if (level == 1) {
      levelTimer = initTimer;
    } else {
      levelTimer = initTimer / (level / 2);
      if (levelTimer < 30) {
        levelTimer = 30;
      }
    }

    timer1 /= levelTimer;
    timer2 /= levelTimer;
    timer3 /= levelTimer;
    timer4 /= levelTimer;
    timer5 /= levelTimer;
    timer6 /= levelTimer;
    timer7 /= levelTimer;
    timer8 /= levelTimer;

    maxTimer = levelTimer * 8;


    cardColor();
  } // end of setup

  void draw()
  {
    if (!gameSound.isPlaying()) {
      mainSound.stop();
      gameSound.loop();
      flappySound.stop();
      looseSound.stop();
      winSound.stop();
    }
    if (display == 0)
    {
  
    if(timer1 + timer2 + timer3 + timer4 + timer5 + timer6 + timer7 + timer8 == maxTimer && count >= 2) {
      count = 0;
      
      firstCardSelected.turn = false;
      secondCardSelected.turn = false;
      
      firstCardSelected = null;
      secondCardSelected = null;
      
    }
    
  if (firstCardSelected != null && secondCardSelected != null) {
    if (firstCardSelected.type == secondCardSelected.type)
    {
      firstCardSelected.match = true;
      secondCardSelected.match = true;
      count = 0;
      firstCardSelected = null;
      secondCardSelected = null;
    }
  }
  
  
  
    if (!c1Flip) // add timer
    {
      fill(0);
      c1.draw();
      timer1 = levelTimer;
    }
    else
    {
      
      fillBasedOnColour(c1.type);
      c1.draw();
      if (!c1.match) {
        timer1--;
      } else {
        timer1 = levelTimer;
      }
    }
    if (c1Flip && timer1 <= 0)
    {
      //background(255, 0, 0);
      c1Flip = false;
      c1.draw();
      totalFlips++;
        
    }

    
    if (!c2Flip)
    {
      fill(0);
      c2.draw();
      timer2 = levelTimer;

    }
    else
    {
      fillBasedOnColour(c2.type);
      c2.draw();
      if (!c2.match) {
        timer2--;
      } else {
        timer2 = levelTimer;
      }
    }
    if (c2Flip && timer2 <= 0)
    {
      //background(255, 0, 0);
      c2Flip = false;
      c2.draw();
      totalFlips++;
        
    }
    
    if (!c3Flip)
    {
      fill(0);
      c3.draw();
      timer3 = levelTimer;
    }
    else
    {
      fillBasedOnColour(c3.type);
      c3.draw();
      if (!c3.match) {
        timer3--;
      } else {
        timer3 = levelTimer;
      }
    }
    if (c3Flip && timer3 <= 0)
    {
      //background(255, 0, 0);
      c3Flip = false;
      c3.draw();
      totalFlips++;
    }
    
    if (!c4Flip)
    {
      fill(0);
      c4.draw();
      timer4 = levelTimer;
    }
    else
    {
      fillBasedOnColour(c4.type);
      c4.draw();
      if (!c4.match) {
        timer4--;
      } else {
        timer4 = levelTimer;
      }
    }
    if (c4Flip && timer4 <= 0)
    {
      //background(255, 0, 0);
      c4Flip = false;
      c4.draw();
      totalFlips++; 
    }
    
    if (!c5Flip)
    {
      fill(0);
      c5.draw();
      timer5 = levelTimer;
    }
    else
    {
      fillBasedOnColour(c5.type);
      c5.draw(); 
      if (!c5.match) {
        timer5--;
      } else {
        timer5 = levelTimer;
      }
    }
    if (c5Flip && timer5 <= 0)
    {
      //background(255, 0, 0);
      c5Flip = false;
      c5.draw();
      totalFlips++; 
    }
    
    if (!c6Flip)
    {
      fill(0);
      c6.draw();
      timer6 = levelTimer;
    }
    else
    {
      fillBasedOnColour(c6.type);
      c6.draw();
      if (!c6.match) {
        timer6--;
      } else {
        timer6 = levelTimer;
      }
    }
    if (c6Flip && timer6 <= 0)
    {
      //background(255, 0, 0);
      c6Flip = false;
      c6.draw();
      totalFlips++; 
    }
    
    if (!c7Flip)
    {
      fill(0);
      c7.draw();
      timer7 = levelTimer;
    }
    else
    {
      fillBasedOnColour(c7.type);
      c7.draw();
      if (!c7.match) {
        timer7--;
      } else {
        timer7 = levelTimer;
      }
    }
    if (c7Flip && timer7 <= 0)
    {
      //background(255, 0, 0);
      c7Flip = false;
      c7.draw();
      totalFlips++; 
    }
    
    if (!c8Flip)
    {
      fill(0);
      c8.draw();
      timer8 = levelTimer;
    }
    else
    {
      fillBasedOnColour(c8.type);
      c8.draw();
      if (!c8.match) {
        timer8--;
      } else {
        timer8 = levelTimer;
      }
    }
    if (c8Flip && timer8 <= 0)
    {
      //background(255, 0, 0);
      c8Flip = false;
      c8.draw();
      totalFlips++; 
    }

    } // end of display = 0
    

    if (c1Flip && c2Flip && c3Flip && c4Flip && c5Flip && c6Flip && c7Flip && c8Flip) {

      characters.displaySentenceCentre("YOU WIN",width / 2, height / 2, 10, #ffa500);

      if (savedTime == 0) {
        savedTime = millis();
      }

      if (millis() - savedTime > totalTime) {
        level++;
        sink = new Sink(width - 200, 100, 100, height - 200, gameTimer);
        gameWindow = new GameWindow();
      }
    }
  } // end of draw


  void cardColor()
  {
    
    int[] colors = new int[8];
    colors[0] = 1;
    colors[1] = 1;
    colors[2] = 2;
    colors[3] = 2;
    colors[4] = 3;
    colors[5] = 3;
    colors[6] = 4;
    colors[7] = 4;
    
    /* The following code is inspired from Geeks for Geeks at
    https://www.geeksforgeeks.org/shuffle-or-randomize-a-list-in-java/ (last accessed 6 May 2023) */
    /* Begin copied code */  
    List<Integer> cardIndexList = new ArrayList<Integer>();
    cardIndexList.add(0);
    cardIndexList.add(1);
    cardIndexList.add(2);
    cardIndexList.add(3);
    cardIndexList.add(4);
    cardIndexList.add(5);
    cardIndexList.add(6);
    cardIndexList.add(7);
    
    Collections.shuffle(cardIndexList);
    
    c1.type = colors[cardIndexList.get(0)];
    c2.type = colors[cardIndexList.get(1)];
    c3.type = colors[cardIndexList.get(2)];
    c4.type = colors[cardIndexList.get(3)];
  
    c5.type = colors[cardIndexList.get(4)];
    c6.type = colors[cardIndexList.get(5)];
    c7.type = colors[cardIndexList.get(6)];
    c8.type = colors[cardIndexList.get(7)];
    /* End copied code */
  }



  void keyPressed()
  {
    if (key == '1')
    {
      background(255, 0, 0);
      
    }
    if (key == '2')
    {
      background(0);
    }
    if (key == '3')
    {
      background(0);
    }
    if (key == '4')
    {
      background(0);
    }
  }

  void fillBasedOnColour(int type) {
    switch (type) {
      case 1:
        fill(255, 0, 0);
        break;
      case 2:
        fill(255, 204, 0);
        break;
      case 3:
        fill(0, 255, 0);
        break;
      case 4:
        fill(230,230,250);
        break;
      default:
        break;
    }
  }
}

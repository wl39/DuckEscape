// Sammy ; random number generator for math equations

final class Math
{
  int result;
  int val1, val2, val3, val4, val5;
  Math()
  {
   
    // text = createFont("Times New Roman", 20, true);

  } // end of Math()
 
  void calculate(int x, int y, int z, int a, int b)
  {
    result = x + y * z - a + b;
  } // end of calculate()
 
  void draw()
  {
    //fill(255, 0, 0);
    fill(#5E93AC, 100);
    rect(200, 600, 80, 80);
    textSize(50);
    // textFont(text, 50);
    fill(0);
   // text("0", 230, 660);
    characters.displaySentenceCentre("0",  240,  620, 8, #000000);

   
    fill(#5E93AC, 100);
    rect(300, 600, 80, 80);
    textSize(50);
    // textFont(text, 50);
    fill(0);
   // text("1", 330, 660);
   characters.displaySentenceCentre("1",  340,  620, 8, #000000);

   
    fill(#5E93AC, 100);
    rect(400, 600, 80, 80);
    textSize(50);
    // textFont(text, 50);
    fill(0);
    //text("2", 430, 660);
    characters.displaySentenceCentre("2",  440,  620, 8, #000000);

   
    fill(#5E93AC, 100);
    rect(500, 600, 80, 80);
    textSize(50);
    // textFont(text, 50);
    fill(0);
    //text("3", 530, 660);
    characters.displaySentenceCentre("3",  540,  620, 8, #000000);

   
    fill(#5E93AC, 100);
    rect(600, 600, 80, 80);
    textSize(50);
    // textFont(text, 50);
    fill(0);
    //text("4", 630, 660);
    characters.displaySentenceCentre("4",  640,  620, 8, #000000);

   
    fill(#5E93AC, 100);
    rect(700, 600, 80, 80);
    textSize(50);
    // textFont(text, 50);
    fill(0);
    //text("5", 730, 660);
    characters.displaySentenceCentre("5",  740,  620, 8, #000000);

   
    fill(#5E93AC, 100);
    rect(800, 600, 80, 80);
    textSize(50);
    // textFont(text, 50);
    fill(0);
    //text("6", 830, 660);
    characters.displaySentenceCentre("6",  840,  620, 8, #000000);

   
    fill(#5E93AC, 100);
    rect(900, 600, 80, 80);
    textSize(50);
    // textFont(text, 50);
    fill(0);
    //text("7", 930, 660);
    characters.displaySentenceCentre("7",  940,  620, 8, #000000);

   
    fill(#5E93AC, 100);
    rect(1000, 600, 80, 80);
    textSize(50);
    // textFont(text, 50);
    fill(0);
    //text("8", 1030, 660);
    characters.displaySentenceCentre("8",  1040,  620, 8, #000000);

   
    fill(#5E93AC, 100);
    rect(1100, 600, 80, 80);
    textSize(50);
    // textFont(text, 50);
    fill(0);
    //text("9", 1130, 660);
    characters.displaySentenceCentre("9",  1140,  620, 8, #000000);

   
  } // end of draw
 
} // end of Math
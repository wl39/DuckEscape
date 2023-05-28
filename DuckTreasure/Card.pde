public class Card
{
  boolean turn = false;
  boolean match = false;
  int posx, posy;
  int type = 0;
  //int cardNumber = 0;
  Card(int posx, int posy, int type)
  {
    this.posx = posx;
    this.posy = posy;
    this.type = type;
    //this.cardNumber = cardNumber;
    turn = false;
    // text = createFont("Times New Roman", 20, true);

  }
  
  void draw()
  {
    
     rect(posx, posy, 200, 300);
    // textFont(text, 50);
    fill(0);
    // text(cardNumber, posx, posy);
     
     if (match)
     {
       noFill();
     }
  }
} // end of Card1 class

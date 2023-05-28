import java.util.HashMap;

final class Characters {
    boolean[][] A = {
        {true, true, true, true, false},
        {true, true, false, true, false},
        {true, true, true, true, false},
        {true, true, false, true, false}
    };

    boolean[][] B = {
        {true, true, true, false, false},
        {true, false, true, true, false},
        {true, true, false, true, false},
        {true, true, true, true, false}
    };

    boolean[][] C = {
        {false, true, true, true, false},
        {true, true, false, false, false},
        {true, true, false, false, false},
        {false, true, true, true, false}
    };

    boolean[][] D = {
        {true, true, true, false, false},
        {true, true, false, true, false},
        {true, true, false, true, false},
        {true, true, true, false, false},
    };

    boolean[][] E = {
        {true, true, true, true, false},
        {true, true, true, false, false},
        {true, true, false, false, false},
        {true, true, true, true, false},
    };

    boolean[][] F = {
        {true, true, true, true, false},
        {true, true, true, false, false},
        {true, true, false, false, false},
        {true, true, false, false, false},
    };

    boolean[][] G = {
        {true, true, true, true, false},
        {true, true, false, false, false},
        {true, true, false, true, false},
        {true, true, true, true, false},
    };

    boolean[][] H = {
        {true, true, false, true, false},
        {true, true, true, true, false},
        {true, true, true, true, false},
        {true, true, false, true, false},
    };

    boolean[][] I = {
        {true, true, true, true, false},
        {false, true, true, false, false},
        {false, true, true, false, false},
        {true, true, true, true, false},
    };

    boolean[][] J = {
        {false, false, true, true, false},
        {false, false, true, true, false},
        {true, false, true, true, false},
        {true, true, true, true, false},
    };

    boolean[][] K = {
        {true, true, false, true, false},
        {true, true, true, false, false},
        {true, true, true, false, false},
        {true, true, false, true, false},
    };

    boolean[][] L = {
        {true, true, false, false, false},
        {true, true, false, false, false},
        {true, true, false, false, false},
        {true, true, true, true, false},
    };

    boolean[][] M = {
        {true, true, false, true, true, false},
        {true, true, true, true, true, false},
        {true, false, true, false, true, false},
        {true, false, false, false, true, false},
    };

    boolean[][] N = {
        {true, true, false, true, false},
        {true, true, false, true, false},
        {true, false, true, true, false},
        {true, false, true, true, false},
    };

    boolean[][] O = {
        {false, true, true, false, false},
        {true, true, false, true, false},
        {true, true, false, true, false},
        {false, true, true, false, false},
    };

    boolean[][] P = {
        {true, true, true, true, false},
        {true, true, false, true, false},
        {true, true, true, true, false},
        {true, true, false, false, false},
    };

    boolean[][] Q = {
        {false, true, true, false, false},
        {true, false, false, true, false},
        {true, false, true, true, false},
        {false, true, true, true, false},
    };

    boolean[][] R = {
        {true, true, true, false, false},
        {true, true, false, true, false},
        {true, true, true, false, false},
        {true, true, false, true, false},
    };

    boolean[][] S = {
        {true, true, true, true, false},
        {true, true, false, false, false},
        {false, false, true, true, false},
        {true, true, true, true, false},
    };

    boolean[][] T = {
        {true, true, true, true, false},
        {false, true, true, false, false},
        {false, true, true, false, false},
        {false, true, true, false, false},
    };

    boolean[][] U = {
        {true, true, false, true, false},
        {true, true, false, true, false},
        {true, true, true, true, false},
        {true, true, true, true, false},
    };

    boolean[][] V = {
        {true, true, false, true, false},
        {true, true, false, true, false},
        {false, true, true, true, false},
        {false, false, true, false, false},
    };

    boolean[][] W = {
        {true, false, false, false, true},
        {true, false, true, false, true},
        {true, true, true, true, true},
        {true, true, false, true, true},
    };

    boolean[][] X = {
        {true, true, false, true, false},
        {false, true, true, false, false},
        {false, true, true, false, false},
        {true, true, false, true, false},
    };

    boolean[][] Y = {
        {true, true, false, true, false},
        {true, true, false, true, false},
        {false, true, true, false, false},
        {false, true, true, false, false},
    };

    boolean[][] Z = {
        {true, true, true, true, false},
        {false, false, true, true, false},
        {true, true, false, false, false},
        {true, true, true, true, false},
    };

    boolean[][] EXCLAMTION_MARK = {
        {true, true, true, true, false},
        {true, true, true, false, false},
        {false, false, false, false, false},
        {true, true, false, false, false},
    };

    boolean[][] ZERO = {
        {false, true, true, false, false},
        {true, true, false, true, false},
        {true, true, false, true, false},
        {false, true, true, false, false},
    };

    boolean[][] ONE = {
        {true, true, true, false},
        {false, true, true, false},
        {false, true, true, false},
        {false, true, true, false},
    };

    boolean[][] TWO = {
        {true, true, true, false},
        {false, false, true, false},
        {true, false, false, false},
        {true, true, true, false},
    };

    boolean[][] THREE = {
        {true, true, true, true, false},
        {false, true, true, true, false},
        {false, false, true, true, false},
        {true, true, true, true, false},
    };

    boolean[][] FOUR = {
        {true, false, true, false, false},
        {true, false, true, false, false},
        {true, true, true, true, false},
        {false, false, true, false, false},
    };

    boolean[][] FIVE = {
        {true, true, true, false},
        {true, false, false, false},
        {false, false, true, false},
        {true, true, true, false},
    };

    boolean[][] SIX = {
        {true, true, true, true, false},
        {true, false, false, false, false},
        {true, false, true, true, false},
        {true, true, true, true, false},
    };

    boolean[][] SEVEN = {
        {true, true, true, false},
        {false, false, true, false},
        {false, true, false, false},
        {true, false, false, false},
    };

    boolean[][] EIGHT = {
        {true, true, true, false, false},
        {true, false, true, true, false},
        {true, true, false, true, false},
        {false, true, true, true, false},
    };

    boolean[][] NINE = {
        {true, true, true, true, false},
        {true, true, false, true, false},
        {false, false, false, true, false},
        {true, true, true, true, false},
    };

    boolean[][] PLUS = {
        {false, true, true, false, false},
        {true, true, true, true, false},
        {true, true, true, true, false},
        {false, true, true, false, false},
    };

    boolean[][] MINUS = {
        {false, false, false, false, false},
        {false, false, false, false, false},
        {true, true, true, true, false},
        {false, false, false, false, false},
    };

    boolean[][] MULT = {
        {false, false, false, false},
        {true, true, false, false},
        {true, true, false, false},
        {false, false, false, false},
    };

    boolean[][] DIVIDE = {
        {false, false, true, false},
        {false, true, false, false},
        {false, true, false, false},
        {true, false, false, false},
    };

    boolean[][] EQUAL = {
        {true, true, true , true, false},
        {false, false, false, false, false},
        {true, true, true, true, false},
        {false, false, false, false, false},
    };

     boolean[][] Space = {
        {false},
        {false},
        {false},
        {false},
    };

    HashMap<Character, boolean[][]> fonts = new HashMap<>();
    
    Characters() {
        fonts.put('A', A);
        fonts.put('B', B);
        fonts.put('C', C);
        fonts.put('D', D);
        fonts.put('E', E);
        fonts.put('F', F);
        fonts.put('G', G);
        fonts.put('H', H);
        fonts.put('I', I);
        fonts.put('J', J);
        fonts.put('G', G);
        fonts.put('K', K);
        fonts.put('L', L);
        fonts.put('M', M);
        fonts.put('N', N);
        fonts.put('O', O);
        fonts.put('P', P);
        fonts.put('Q', Q);
        fonts.put('R', R);
        fonts.put('S', S);
        fonts.put('T', T);
        fonts.put('U', U);
        fonts.put('V', V);
        fonts.put('W', W);
        fonts.put('X', X);
        fonts.put('Y', Y);
        fonts.put('Z', Z);
        fonts.put('a', A);
        fonts.put('b', B);
        fonts.put('c', C);
        fonts.put('d', D);
        fonts.put('e', E);
        fonts.put('f', F);
        fonts.put('g', G);
        fonts.put('h', H);
        fonts.put('i', I);
        fonts.put('j', J);
        fonts.put('g', G);
        fonts.put('k', K);
        fonts.put('l', L);
        fonts.put('m', M);
        fonts.put('n', N);
        fonts.put('o', O);
        fonts.put('p', P);
        fonts.put('q', Q);
        fonts.put('r', R);
        fonts.put('s', S);
        fonts.put('t', T);
        fonts.put('u', U);
        fonts.put('v', V);
        fonts.put('w', W);
        fonts.put('x', X);
        fonts.put('y', Y);
        fonts.put('z', Z);
        fonts.put(' ', Space);
        fonts.put('!', EXCLAMTION_MARK);
        fonts.put('0', ZERO);
        fonts.put('1', ONE);
        fonts.put('2', TWO);
        fonts.put('3', THREE);
        fonts.put('4', FOUR);
        fonts.put('5', FIVE);
        fonts.put('6', SIX);
        fonts.put('7', SEVEN);
        fonts.put('8', EIGHT);
        fonts.put('9', NINE);

        fonts.put('+', PLUS);
        fonts.put('-', MINUS);
        fonts.put('*', MULT);
        fonts.put('/', DIVIDE);
        fonts.put('=', EQUAL);
    }

    void displaySentence(String sentence, int x, int y, int pixelSize, int hexDecimalColour) {
        int fiveBits = count5Bits(sentence);
        int spaces = countSpaces(sentence);

        char[] characters = sentence.toCharArray();

        boolean[][] booleanSentence = new boolean[5][characters.length + fiveBits - (spaces * 4)];

        int width = ((characters.length * 5) + fiveBits - (spaces * 4)) * pixelSize;
        int startX = x;
        int startY = y;

        for (int characterIndex = 0; characterIndex < characters.length; characterIndex++) {
            boolean[][] currentChar = fonts.get(characters[characterIndex]);

            for (int yPosition = 0; yPosition < currentChar.length; yPosition++) {
                for (int xPosition = 0; xPosition < currentChar[yPosition].length; xPosition++) {
                    if (currentChar[yPosition][xPosition]) {
                        noStroke();
                        fill(hexDecimalColour);
                        rect(startX + (xPosition * pixelSize), startY + (yPosition * pixelSize), pixelSize, pixelSize);
                    }
                }
            }

            startX += currentChar[0].length * pixelSize;
        }
    }

     void displaySentenceCentre(String sentence, int x, int y, int pixelSize, int hexDecimalColour) {
        if (sentence.equals(" ")) {
            return;
        }

        
        int threeBits = count3Bits(sentence);
        int fiveBits = count5Bits(sentence);
        int spaces = countSpaces(sentence);

        char[] characters = sentence.toCharArray();

       

        boolean[][] booleanSentence = new boolean[5][characters.length + fiveBits - (spaces * 4) - threeBits];

        int width = ((characters.length * 5) + fiveBits - (spaces * 4) - threeBits) * pixelSize;
        
        int startX = x - (width / 2);
        int startY = y;

        for (int characterIndex = 0; characterIndex < characters.length; characterIndex++) {
            if (!fonts.containsKey(characters[characterIndex])) {
                return;
            }

            boolean[][] currentChar = fonts.get(characters[characterIndex]);

            for (int yPosition = 0; yPosition < currentChar.length; yPosition++) {
                for (int xPosition = 0; xPosition < currentChar[yPosition].length; xPosition++) {
                    if (currentChar[yPosition][xPosition]) {
                        noStroke();
                        fill(hexDecimalColour);
                        rect(startX + (xPosition * pixelSize), startY + (yPosition * pixelSize), pixelSize, pixelSize);
                    }
                }
            }

            startX += currentChar[0].length * pixelSize;
        }
    }
    

    public int count5Bits(String str) {
        int count = 0;

        for(int i = 0; i < str.length(); i++)
        {    if(str.charAt(i) == 'M' || str.charAt(i) == 'W' || str.charAt(i) == 'm' || str.charAt(i) == 'w')
                count++;
        }

        return count;
    }

    public int countSpaces(String str) {
        int count = 0;

        for(int i = 0; i < str.length(); i++)
        {    if(str.charAt(i) == ' ')
                count++;
        }

        return count;
    }

    public int count3Bits(String str) {
        int count = 0;

        for(int i = 0; i < str.length(); i++)
        {    if(str.charAt(i) == '1' || str.charAt(i) == '2' || str.charAt(i) == '5' || str.charAt(i) == '7' || str.charAt(i) == '*' || str.charAt(i) == '/')
                count++;
        }

        return count;
    }
}
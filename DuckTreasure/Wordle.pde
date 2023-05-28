import java.util.ArrayList;
import java.util.Random;

final class Wordle {
    final int MAX_OPPORTUNITY = 8;
    int length;

    WordleKeyboard wordleKeyboard = new WordleKeyboard();
    WordleTile[][] wordleTiles;

    int currentOpportunityIndex;

    String randomWord;
    String userInput = "";
    

    void getRandomWord() {
        currentOpportunityIndex = 0;
        ArrayList<String> words = new ArrayList<>();
         wordleKeyboard = new WordleKeyboard();

        String[] lines;
        
        switch (level) {
            case 1:
            case 2:
                lines = loadStrings("3-letters-in-dictionary.txt");
                break;
            case 3:
            case 4:
                lines = loadStrings("4-letters-in-dictionary.txt");
            break;
            case 5:
            default:
                lines = loadStrings("5-letters-in-dictionary.txt");
            break;
        }

        for (int i = 0; i < lines.length; i++) {
            words.add(lines[i]);
        }

        Random random = new Random();
        String randomWord = words.get(random.nextInt(words.size()));

        this.randomWord = randomWord;
        println(randomWord);

        length = wordle.randomWord.length();
        wordleTiles = new WordleTile[MAX_OPPORTUNITY][length];

        float xStartPoint = ((width - 400) / 4) - (120 *  ((float) length) / 2.f);
        float yStartPoint = (height / 2) - 480;

        for (int opportunity = 0; opportunity < MAX_OPPORTUNITY; opportunity++) {
            for (int i = 0; i < length; i ++) {
                wordleTiles[opportunity][i] = new WordleTile(xStartPoint + (i * 120), yStartPoint + (opportunity * 120));
            }
        }
    }

    void setUserInput(char userInput) {
        if (this.userInput.length() < this.randomWord.length()) {
            this.userInput += userInput;

            for (int i = 0; i < this.userInput.length(); i++) {
                wordleTiles[currentOpportunityIndex][i].setCharacter(this.userInput.charAt(i));
            }
        }
    }

    void removeLastChar() {
        if (this.userInput.length() > 0) {
            wordleTiles[currentOpportunityIndex][this.userInput.length() - 1].setCharacter(' ');
            this.userInput = this.userInput.substring(0, this.userInput.length() - 1);
        }
    }

    void checkWord() {
        int correctLetterCount = 0;
        if (this.userInput.length() == length) {
            for (int i = 0; i < length; i++) {
                if (this.randomWord.charAt(i) == Character.toLowerCase(this.userInput.charAt(i))) {
                    this.wordleTiles[currentOpportunityIndex][i].status = 2;
                    correctLetterCount++;
                    wordleKeyboard.keyMap.put(this.userInput.charAt(i), 2);
                } else if (this.randomWord.contains("" + Character.toLowerCase(this.userInput.charAt(i)))) {
                    this.wordleTiles[currentOpportunityIndex][i].status = 1;
                    wordleKeyboard.keyMap.put(this.userInput.charAt(i), 1);
                } else {
                    wordleKeyboard.keyMap.put(this.userInput.charAt(i), 3);
                }
            }

            if (correctLetterCount == length) {
                isRoundDone = true;
            }
            

            this.userInput = "";
            this.currentOpportunityIndex++;

        }
    }

    void draw() {
        if (!gameSound.isPlaying()) {
            mainSound.stop();
            gameSound.loop();
            flappySound.stop();
            looseSound.stop();
            winSound.stop();
        }
        for (int opportunity = 0; opportunity < MAX_OPPORTUNITY; opportunity++) {
            for (int i = 0; i < length; i++) {
                if (opportunity < currentOpportunityIndex) {
                    switch (wordleTiles[opportunity][i].status) {
                        case 1:
                            fill(#B49F3A);
                            break;
                        case 2:
                            fill(#538D4E);
                            break;
                        default:
                            fill(#3681A, 200);
                            break;
                    }
                    
                } else {
                    fill(#84A6B7, 200);
                }
                
                stroke(#84A6B7, 50);
                strokeWeight(5);
                rect(wordleTiles[opportunity][i].position.x + 10, wordleTiles[opportunity][i].position.y + 10, 100, 100);
                noStroke();
                characters.displaySentenceCentre("" + wordleTiles[opportunity][i].character, (int) wordleTiles[opportunity][i].position.x + 67, (int) wordleTiles[opportunity][i].position.y + 30, 15, #FFFFFF);
            }
        }

        wordleKeyboard.draw();

        if (isRoundDone) {
            characters.displaySentenceCentre("YOU WIN",width / 2, height / 2, 10, #ffa500);
            if (savedTime == 0) {
                savedTime = millis();
            }

            if (millis() - savedTime > totalTime) {
                level++;
                sink = new Sink(width - 200, 100, 100, height - 200, gameTimer);
                gameWindow = new GameWindow();
                isRoundDone = false;
                savedTime = 0;
            }
                        
        } else if (currentOpportunityIndex >= 8) {
            state = LOOSE;
        }
    }
}
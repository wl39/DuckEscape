import java.util.Arrays;
import processing.sound.*;
String path;
SoundFile mainSound ;
// = new SoundFile(this, "data/Fluffing-a-Duck.mp3");
SoundFile gameSound;
//  = new SoundFile(this, "data/Carefree.mp3");
SoundFile flappySound;
// = new SoundFile(this, "data/Percy_Wenrich_-_02_-_The_Smiler_1907_Zonophone_Concert_Band.mp3");
SoundFile looseSound;
//  = new SoundFile(this, "data/Heartbreaking.mp3");
SoundFile winSound;
//  = new SoundFile(this, "data/poolside.mp3");

final int MAIN = 0;
final int GAME = 1;
final int BONUS_GAME = 2;
final int LOOSE = 3;
final int WIN = 4;

final int MEMORY = 0;
final int MATH = 1;
final int WORDLE = 2;
final int GAME2048 = 3;
final int PARTITION = 4;

public int state = MAIN;
boolean infinity = false;


color startButtonColor = color(255);
color startOverButtonColor = color(220);

color settingButtonColor = color(255);
color settingOverButtonColor = color(220);

int windowWidth = 1920;
int windowHeight = 1080;
int pixelSize = 10;

int lives = 3;

boolean testMode = false;

boolean buttonClicked = false;

Characters characters = new Characters();

MainPageButton mainPageButton;

Duck duck = new Duck(125, 120, 5);
Duck smallDuck = new Duck(125, 120, 3);
Duck duckInMainPage;
Sink sink;


float gameTimer;

int level = 1;

int savedTime;
int totalTime = 800;

boolean isRoundDone = false;

int keyPressedPauseTime = 300;
boolean keyPressedPause = false;

Loose looseScene;
Win winScene;

GameWindow gameWindow;
Wordle wordle = new Wordle();
MathMain mathMain = new MathMain();
MemoryCardMain memoryCard;
Game2048 game2048;

FlappyDuck flappyDuck;

int[] mainGames;
int gameType = WORDLE;

void init() {
    lives = 3;
    level = 1;

    mainGames = new int[] {MATH, MEMORY, WORDLE, GAME2048};

    gameTimer = 120.f;
    frameRate(60);
    state = MAIN;
    background(255, 255, 255);

    sink = new Sink(width - 200, 100, 100, height - 200, gameTimer);
    
    mainPageButton = new MainPageButton();
    duckInMainPage = new Duck(125, (height / 2) - (9 * 10), 10);
    gameWindow = new GameWindow();
    flappyDuck = new FlappyDuck();
    looseScene = new Loose();
    winScene = new Win();
}
void setup() {
    path = sketchPath("");
    init();
    mainSound = new SoundFile(this, "data/Fluffing-a-Duck.mp3");
    gameSound = new SoundFile(this, "data/Carefree.mp3");
    flappySound = new SoundFile(this, "data/Percy_Wenrich_-_02_-_The_Smiler_1907_Zonophone_Concert_Band.mp3");
    looseSound = new SoundFile(this, "data/Heartbreaking.mp3");
    winSound = new SoundFile(this, "data/Roa - Poolside.mp3");
}

void settings() {
    fullScreen();
}

void draw() {
   
    switch(state) {
        case MAIN:
            if (testMode) {
                sink.draw();

                fill(255, 0, 0);
                textSize(20);
                
            } else {
                 if (!mainSound.isPlaying()) {
                    mainSound.loop();
                    gameSound.stop();
                    flappySound.stop();
                    looseSound.stop();
                    winSound.stop();
                }
                background(255, 255, 255);
                sink.fullSizeDraw();
                characters.displaySentenceCentre("DUCK ESCAPE", width / 2, 80, 10, #ffa500);
                
                mainPageButton.draw();
                if (buttonClicked) {
                    smallDuck.draw();
                    smallDuck.clickedMove();

                    if (millis() - savedTime > totalTime) {
                        buttonClicked = false;
                        cursor(ARROW);
                        state = GAME;
                        savedTime = 0;
                    }
                }
                textSize(20);
                text(frameRate, 20, 20);

                
            }
            break;
        case GAME:
            noStroke();
            background(255, 255, 255);
            gameWindow.draw();
            sink.draw();
            break;

        case BONUS_GAME:
            noStroke();
            background(85, 206, 255);
            flappyDuck.draw();
            break;
        case LOOSE:
            looseScene.draw();
            break;
        case WIN:
            winScene.draw();
            break;
    }
}

void mousePressed() {
    switch(state) {
        case MAIN:
            if (!buttonClicked) {
                if (mouseX >= (width / 2) - 130 && mouseX <= (width / 2) + 130 && mouseY >= 230 && mouseY <= 290) { // StartButton
                    smallDuck.position.x =  (width / 2) + 60;
                    smallDuck.position.y =  230;
                    smallDuck.getNewVelocity();
                    buttonClicked = true;
                    savedTime = millis();
                    infinity = false;
                } else if (mouseX >= (width / 2) - 120 && mouseX <= (width / 2) + 120 && mouseY >= 330 && mouseY <= 390) { // StartButton
                    smallDuck.position.x =  (width / 2) + 50;
                    smallDuck.position.y =  340;
                    smallDuck.getNewVelocity();
                    buttonClicked = true;
                    savedTime = millis();
                    infinity = true;
                }
            }
            break;
        case GAME:
            switch (gameType) {
                case MATH:
                    if (mathMain.counter >= 3) {
                        break;
                    }
                    if (mouseX >= 200 && mouseX <= 280 && mouseY >= 600 && mouseY <= 680)
                    {
                    
                    mathMain.digits[mathMain.counter] = 0;
                    mathMain.counter++;
                    }
                    if (mouseX >= 300 && mouseX <= 380 && mouseY >= 600 && mouseY <= 680)
                    {
                    
                    mathMain.digits[mathMain.counter] = 1;
                    mathMain.counter++;
                    }
                    if (mouseX >= 400 && mouseX <= 480 && mouseY >= 600 && mouseY <= 680)
                    {
                    
                    mathMain.digits[mathMain.counter] = 2;
                    mathMain.counter++;
                    }
                    
                    if (mouseX >= 500 && mouseX <= 580 && mouseY >= 600 && mouseY <= 680)
                    {
                    
                    mathMain.digits[mathMain.counter] = 3;
                    mathMain.counter++;
                    }
                    
                    if (mouseX >= 600 && mouseX <= 680 && mouseY >= 600 && mouseY <= 680)
                    {
                    
                    mathMain.digits[mathMain.counter] = 4;
                    mathMain.counter++;
                    }
                    
                    if (mouseX >= 700 && mouseX <= 780 && mouseY >= 600 && mouseY <= 680)
                    {
                    
                    mathMain.digits[mathMain.counter] = 5;
                    mathMain.counter++;
                    }
                    
                    if (mouseX >= 800 && mouseX <= 880 && mouseY >= 600 && mouseY <= 680)
                    {
                    
                    mathMain.digits[mathMain.counter] = 6;
                    mathMain.counter++;
                    }
                    
                    if (mouseX >= 900 && mouseX <= 980 && mouseY >= 600 && mouseY <= 680)
                    {
                    
                    mathMain.digits[mathMain.counter] = 7;
                    mathMain.counter++;
                    }
                    
                    if (mouseX >= 1000 && mouseX <= 1080 && mouseY >= 600 && mouseY <= 680)
                    {
                    
                    mathMain.digits[mathMain.counter] = 8;
                    mathMain.counter++;
                    }
                    
                    if (mouseX >= 1100 && mouseX <= 1180 && mouseY >= 600 && mouseY <= 680)
                    {
                    
                    mathMain.digits[mathMain.counter] = 9;
                    mathMain.counter++;
                    }
                    break;
                case MEMORY:
                    if (mouseX >= 1100 && mouseX <= 1300 && mouseY >= 500 && mouseY <= 800 && memoryCard.count < 2 && !memoryCard.c1.match && !memoryCard.c1Flip) // c1
                    {
                    memoryCard.c1.turn = true;
                    
                    memoryCard.c1Flip = true;
                    memoryCard.count++;
                    if (memoryCard.firstCardSelected == null) {
                        memoryCard.firstCardSelected = memoryCard.c1;
                    } else {
                        memoryCard.secondCardSelected = memoryCard.c1;
                    }
                    } 
                    
                    if (mouseX >= 200 && mouseX <= 400 && mouseY >= 100 && mouseY <= 400 && memoryCard.count < 2 && !memoryCard.c2.match && !memoryCard.c2Flip) // c1
                    {
                    memoryCard.c2.turn = true;
                    
                    memoryCard.c2Flip = true;
                    memoryCard.count++;
                    
                    if (memoryCard.firstCardSelected == null) {
                        memoryCard.firstCardSelected = memoryCard.c2;
                    } else {
                        memoryCard.secondCardSelected = memoryCard.c2;
                    }
                    }
                    
                    if (mouseX >= 800 && mouseX <= 1000 && mouseY >= 100 && mouseY <= 400 && memoryCard.count < 2 && !memoryCard.c3.match && !memoryCard.c3Flip) // c1
                    {
                    memoryCard.c3.turn = true;
                    
                    memoryCard.c3Flip = true;
                    memoryCard.count++;
                    
                    if (memoryCard.firstCardSelected == null) {
                        memoryCard.firstCardSelected = memoryCard.c3;
                    } else {
                        memoryCard.secondCardSelected = memoryCard.c3;
                    }
                    }
                    
                    if (mouseX >= 200 && mouseX <= 400 && mouseY >= 500 && mouseY <= 800 && memoryCard.count < 2 && !memoryCard.c4.match && !memoryCard.c4Flip) // c1
                    {
                    memoryCard.c4.turn = true;
                    
                    memoryCard.c4Flip = true;
                    memoryCard.count++;
                    
                    if (memoryCard.firstCardSelected == null) {
                        memoryCard.firstCardSelected = memoryCard.c4;
                    } else {
                        memoryCard.secondCardSelected = memoryCard.c4;
                    }
                    }
                    
                    if (mouseX >= 500 && mouseX <= 700 && mouseY >= 100 && mouseY <= 400 && memoryCard.count < 2 && !memoryCard.c5.match && !memoryCard.c5Flip) // c1
                    {
                    memoryCard.c5.turn = true;
                    
                    memoryCard.c5Flip = true;
                    memoryCard.count++;
                    
                    if (memoryCard.firstCardSelected == null) {
                        memoryCard.firstCardSelected = memoryCard.c5;
                    } else {
                        memoryCard.secondCardSelected = memoryCard.c5;
                    }
                    }
                    
                    if (mouseX >= 800 && mouseX <= 1000 && mouseY >= 500 && mouseY <= 800 && memoryCard.count < 2 && !memoryCard.c6.match && !memoryCard.c6Flip) // c1
                    {
                    memoryCard.c6.turn = true;
                    
                    memoryCard.c6Flip = true;
                    memoryCard.count++;
                    
                    if (memoryCard.firstCardSelected == null) {
                        memoryCard.firstCardSelected = memoryCard.c6;
                    } else {
                        memoryCard.secondCardSelected = memoryCard.c6;
                    }
                    }
                    
                    if (mouseX >= 1100 && mouseX <= 1300 && mouseY >= 100 && mouseY <= 400 && memoryCard.count < 2 && !memoryCard.c7.match && !memoryCard.c7Flip) // c1
                    {
                    memoryCard.c7.turn = true;
                    
                    memoryCard.c7Flip = true;
                    memoryCard.count++;
                    
                    if (memoryCard.firstCardSelected == null) {
                        memoryCard.firstCardSelected = memoryCard.c7;
                    } else {
                        memoryCard.secondCardSelected = memoryCard.c7;
                    }
                    }
                    
                    if (mouseX >= 500 && mouseX <= 700 && mouseY >= 500 && mouseY <= 800 && memoryCard.count < 2 && !memoryCard.c8.match && !memoryCard.c8Flip) // c1
                    {
                    memoryCard.c8.turn = true;
                    
                    memoryCard.c8Flip = true;
                    memoryCard.count++;
                    
                    if (memoryCard.firstCardSelected == null) {
                        memoryCard.firstCardSelected = memoryCard.c8;
                    } else {
                        memoryCard.secondCardSelected = memoryCard.c8;
                    }
                    }
                    break;
                default:
                    break;
            }
            break;
        case BONUS_GAME:
            flappyDuck.clicked();
            break;
    }
}

boolean isEnglishLetter(char c) {
        return (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z');
}

void keyPressed() {
    switch(state) {
        case GAME:
            switch (gameType) {
                case MATH:
                    if (key == BACKSPACE) {
                        if (mathMain.counter >= 1) {
                            mathMain.digits[mathMain.counter - 1] = 0;
                            mathMain.counter--;
                        }
                    }
                    break;
                case GAME2048:
                    if (key == CODED) {
                        if (keyCode == UP) {
                            game2048.moveUp();
                        } else if (keyCode == LEFT) {
                            game2048.moveLeft();
                        } else if (keyCode == RIGHT) {
                            game2048.moveRight();
                        } else if (keyCode == DOWN) {
                            game2048.moveDown();
                        }
                    }
                    

                    break;
                case WORDLE:
                default:
                    if (key == BACKSPACE) {
                        wordle.removeLastChar();
                    } else if (key == ENTER) {
                        wordle.checkWord();
                    } else {
                        if (isEnglishLetter(key)) {
                            wordle.setUserInput(key);
                        }
                    }
                    break;
            }
            break;
        case BONUS_GAME:
            if (key == ' ') {
                flappyDuck.clicked();
            }
            break;
        case WIN:
            if (key == ENTER) {
                state = MAIN;
                init();
            }
        case LOOSE:
            if (key == ENTER) {
                state = MAIN;
                init();
            }
            break;
    }
}
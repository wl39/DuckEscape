final class MainPageButton {
    int[][] bathLeft = {
        {2, 1, 0, 0, 0, 0},
        {2, 1, 0, 0, 0, 0},
        {0, 4, 4, 0, 0, 0},
        {0, 3, 3, 0, 0, 0},
        {0, 3, 3, 0, 0, 0},
        {0, 3, 3, 0, 0, 0},
        {0, 0, 3, 3, 0, 0},
        {0, 0, 0, 0, 3, 3},
        {0, 0, 0, 0, 0, 5},
    };

    int[][] bathRight = {
        {0, 0, 0, 0, 1, 2},
        {0, 0, 0, 0, 1, 2},

        {0, 0, 0, 4, 4, 0},
        {0, 0, 0, 3, 3, 0},
        {0, 0, 0, 3, 3, 0},
        {0, 0, 0, 3, 3, 0},
        {0, 0, 3, 3, 0, 0},
        {3, 3, 0, 0, 0, 0},
        {5, 0, 0, 0, 0, 0},
    };

    
    String startGame = "START GAME"; // 230 : 115
    String tutorial = "INFINITY"; // 200 : 100

    int pixelSize = 5;

    float startYPosition = 280;
    float startYEndPosition = 245;

    float tutorialYPosition = 380;
    float tutorialYEndPosition = 345;

    boolean onStartGame, onTutorial = false;

    int bubbleParticles = 20;
    
    Bubble[] startBubbles = new Bubble[bubbleParticles];
    Bubble[] tutorialBubbles = new Bubble[bubbleParticles];

    MainPageButton() {
        for (int i = 0; i < bubbleParticles; i++) {
            startBubbles[i] = new Bubble((width / 2) - 145, 280, 280, 0);
            tutorialBubbles[i] = new Bubble((width / 2) - 120, 380, 235, 0);
        }
    }

    void draw() {
        onMouse();

        if (onStartGame) {
            if (startYPosition > startYEndPosition) {
                startYPosition -= 0.2f;
            }
            waterDraw((width / 2) - 145, (width / 2) + 135, startYPosition, 280);
            startBubblesDraw();
            bathDraw((width / 2) - 155, (width / 2) + 115, 245);
        }
        characters.displaySentenceCentre(startGame, width / 2, 250, pixelSize, #FFD801);

        if (onTutorial) {
            if (tutorialYPosition > tutorialYEndPosition) {
                tutorialYPosition -= 0.2f;
            }
            waterDraw((width / 2) - 120, (width / 2) + 115, tutorialYPosition, 380);
            tutorialBubblesDraw();
            bathDraw((width / 2) - 130, (width / 2) + 95, 345);
        }
        
        characters.displaySentenceCentre(tutorial, width / 2, 350, pixelSize, #FFD801);

    }

    void bathDraw(int start, int end, int yPosition) {
       

        for (int y = 0; y < bathLeft.length; y++) {
            for (int x = 0; x < bathLeft[y].length; x++) {
                // 1: 9DD6FE
                // 2: 80C3F2
                // 3: 5BB1EA
                // 4: 4497D6
                // 5: 073E77
                switch(bathLeft[y][x]) {
                    case 1:
                        fill(#9DD6FE);
                        break;
                    case 2:
                        fill(#80C3F2);
                        break;
                    case 3:
                        fill(#5BB1EA);
                        break;
                    case 4:
                        fill(#4497D6);
                        break;
                    case 5:
                        fill(#073E77);
                        break;
                    default:
                        continue;
                }

                rect(start + (x * pixelSize), yPosition + (y * pixelSize), pixelSize, pixelSize);
            }
        }

        fill(#5BB1EA);
        rect(start + 30, yPosition + 35, end - start - 30, pixelSize);

        for (int y = 0; y < bathRight.length; y++) {
            for (int x = 0; x < bathRight[y].length; x++) {
                switch(bathRight[y][x]) {
                    case 1:
                        fill(#9DD6FE);
                        break;
                    case 2:
                        fill(#80C3F2);
                        break;
                    case 3:
                        fill(#5BB1EA);
                        break;
                    case 4:
                        fill(#4497D6);
                        break;
                    case 5:
                        fill(#073E77);
                        break;
                    default:
                        continue;
                }

                rect(end + (x * pixelSize), yPosition + (y * pixelSize), pixelSize, pixelSize);
            }
        }

        
    }

    void waterDraw(int xStart, int xEnd, float yStart, int yEnd) {
        fill(85, 206, 255);
        rect(xStart, yStart, xEnd - xStart, yEnd - yStart);
    }

    void startBubblesDraw() {
        for (int i = 0; i < bubbleParticles; i++) {
            startBubbles[i].integrate(startYPosition);
            fill(255);
            noStroke();
            rect(startBubbles[i].position.x, startBubbles[i].position.y, 2, 2);
        }
    }

    void tutorialBubblesDraw() {
        for (int i = 0; i < bubbleParticles; i++) {
            tutorialBubbles[i].integrate(tutorialYPosition);
            fill(255);
            noStroke();
            rect(tutorialBubbles[i].position.x, tutorialBubbles[i].position.y, 2, 2);
        }
    }

    void onMouse() {
        if (mouseX >= (width / 2) - 130 && mouseX <= (width / 2) + 130 && mouseY >= 230 && mouseY <= 290) { // StartButton
            cursor(HAND);
            tutorialYPosition = 380;

            onTutorial = false;
            onStartGame = true;
        } else if (mouseX >= (width / 2) - 120 && mouseX <= (width / 2) + 120 && mouseY >= 330 && mouseY <= 390) { // StartButton
            cursor(HAND);
            startYPosition = 280;

            onStartGame = false;
            onTutorial = true;
        } else {
            cursor(ARROW);
            startYPosition = 280;
            tutorialYPosition = 380;

            onStartGame = onTutorial = false;
        }
    }
}
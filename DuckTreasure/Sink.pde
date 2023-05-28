public static PVector gravity = new PVector(0, 0.1f) ;


final class Sink {
    int sinkWidth;
    int sinkHeight;
    float waterHeight;
    float initWaterHeight;

    int xPosition;
    int yPosition;

    float timeLimit;

    int bubbleParticles = 30;
    int mainBubbleParticles = 200;
    int particlesFromHead = 50;
    
    Tile tile;
    Bubble[] bubbles = new Bubble[bubbleParticles];
    Bubble[] mainBubbles = new Bubble[mainBubbleParticles];
    ShowerHead[] headParticles = new ShowerHead[particlesFromHead];

    Duck duck;

    int pixelSize = 5;

    int[][] bathLeftTop = {
        {2, 1, 0, 0, 0, 0},
        {2, 1, 0, 0, 0, 0},
        {0, 4, 4, 0, 0, 0},
        
    };

    int[][] bathLeftBottom = {
        {0, 0, 0, 3, 3, 0},
        {0, 0, 0, 0, 3, 3},
        {0, 0, 0, 0, 0, 5},
    };

    int[][] bathRightTop = {
        {0, 0, 0, 0, 1, 2},
        {0, 0, 0, 0, 1, 2},
        {0, 0, 0, 4, 4, 0},
    };

    int[][] bathRightBottom = {
        {0, 3, 3, 0, 0, 0},
        {3, 3, 0, 0, 0, 0},
        {5, 0, 0, 0, 0, 0},
    };

    Sink(int xPosition, int yPosition, int sinkWidth, int sinkHeight, float timeLimit) {
        duck = new Duck(xPosition + 25, yPosition + 50, 5);
        this.xPosition = xPosition;
        this.yPosition = yPosition;

        this.sinkWidth = sinkWidth;
        this.sinkHeight = sinkHeight;
        this.waterHeight = sinkHeight - (sinkHeight / 10);
        this.initWaterHeight = waterHeight;

        this.timeLimit = timeLimit;

        tile = new Tile(width, height / 2, 1024);

        for (int i = 0; i < bubbleParticles; i++) {
            bubbles[i] = new Bubble(xPosition, yPosition + sinkHeight, sinkWidth, (int) (sinkHeight - (waterHeight / 10)));
        }

        for (int i = 0; i < mainBubbleParticles; i++) {
            mainBubbles[i] = new Bubble(0, height, width, height / 2);
        }

        for (int i = 0; i < particlesFromHead; i++) {
            headParticles[i] = new ShowerHead(0, 0);
        }
    }

    void draw() { 
        waterHeight -= initWaterHeight / (timeLimit * frameRate);
        
        duck.draw();
        

        if (waterHeight > 0) {
            duck.move('d', initWaterHeight / (timeLimit * frameRate));
            
            fill(85, 206, 255);
            noStroke();
            rect(xPosition, yPosition + (sinkHeight - waterHeight), sinkWidth, waterHeight);

            for (int i = 0; i < bubbleParticles; i++) {
                bubbles[i].integrate((int) (yPosition + (sinkHeight - waterHeight)));
                fill(255);
                noStroke();
                rect(bubbles[i].position.x, bubbles[i].position.y, 5, 5);
            }
        } else {
            duck.clickedMove();

            if (duck.position.x > width || duck.position.y > height) {
                flappyDuck = new FlappyDuck();
                state = BONUS_GAME;
            }
        }

        bathDraw();
    }

    void bathDraw() {
        for (int y = 0; y < bathLeftTop.length; y++) {
            for (int x = 0; x < bathLeftTop[y].length; x++) {
                switch(bathLeftTop[y][x]) {
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

                rect((xPosition - 20) + (x * pixelSize), yPosition + (y * pixelSize), pixelSize, pixelSize);
            }
        }

        fill(#5BB1EA);
        rect((xPosition - 10), yPosition + 15, pixelSize, height - 225);
        rect((xPosition - 5), yPosition + 15, pixelSize, height - 220);

        for (int y = 0; y < bathRightTop.length; y++) {
            for (int x = 0; x < bathRightTop[y].length; x++) {
                switch(bathRightTop[y][x]) {
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

                rect((xPosition + sinkWidth - 10) + (x * pixelSize), yPosition + (y * pixelSize), pixelSize, pixelSize);
            }
        }

        fill(#5BB1EA);
        rect((xPosition + sinkWidth), yPosition + 15, pixelSize, height - 220);
        rect((xPosition + sinkWidth + 5), yPosition + 15, pixelSize, height - 225);

        for (int y = 0; y < bathLeftBottom.length; y++) {
            for (int x = 0; x < bathLeftBottom[y].length; x++) {
                switch(bathLeftBottom[y][x]) {
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

                rect((xPosition - 20) + (x * pixelSize), yPosition + sinkHeight - 5 + (y * pixelSize), pixelSize, pixelSize);
            }
        }

        for (int y = 0; y < bathRightBottom.length; y++) {
            for (int x = 0; x < bathRightBottom[y].length; x++) {
                switch(bathRightBottom[y][x]) {
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

                rect((xPosition + sinkWidth - 10) + (x * pixelSize), yPosition + sinkHeight - 5 + (y * pixelSize), pixelSize, pixelSize);
            }
        }

        fill(#5BB1EA);
       rect(xPosition, yPosition + sinkHeight, sinkWidth, pixelSize);
    }

    void fullSizeDraw() {
        tileDraw();
        duckDraw();
        headDraw();
        waterDraw();
        bubblesDraw();
    }

    void tileDraw() {
        tile.draw();
    }

    void duckDraw() {
        duckInMainPage.draw();
        duckInMainPage.mainMove(height / 2);
    }

    void headDraw() {
        for (int i = 0; i < particlesFromHead; i++) {
            headParticles[i].integrate(height / 2);
            float degree = random(PI / 9, PI / 6);
            // rotate(-degree);
            fill(85, 206, 255);
            rect(headParticles[i].position.x, headParticles[i].position.y, 5, 20);
            // rotate(degree);
        }
    }

    void waterDraw() {
        fill(85, 206, 255);
        noStroke();
        rect(0, height / 2, width, height);
    }

    void bubblesDraw() {
        for (int i = 0; i < mainBubbleParticles; i++) {
            mainBubbles[i].integrate(height / 2);
            // println(mainBubbles[i].position.y);
            fill(255);
            noStroke();
            rect(mainBubbles[i].position.x, mainBubbles[i].position.y, 5, 5);
        }
    }

    
}
final class Loose {
    private static final float DAMPING = .995f;
    private final PVector WATERFALL_GRAVITY = new PVector(0, 0.05f);


    Duck duckFrontLeft = new Duck(-70, 200, 100);
    Duck duckBehindRight;
    Duck duckBehindLeft = new Duck(125, 400, 50);
    Duck duckMiddele;

    int sceneStat = 0;
    int savedTime;
    int totalTime = 2000;

    PVector tearPosition, velocity;
    boolean isTearing = false;
    boolean timerOn = false;
// 12 1 12 
// 4 1 4
    boolean[][] ellipseSpotlight = {
        {false, false, false, false, false, false, false, true, true, true, true, true, true, true, true, true, true, true, false, false, false, false, false, false, false,},
        {false, false, false, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, false, false, false,},
        {false, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, false,},
        {true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true,},
        {true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true,},
        {true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true,},
        {false, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, false,},
        {false, false, false, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, false, false, false,},
        {false, false, false, false, false, false, false, true, true, true, true, true, true, true, true, true, true, true, false, false, false, false, false, false, false,},
    };

    Loose() {
        savedTime  = 0;
        timerOn = false;
        duckBehindRight = new Duck(width / 2 + 100, 300, 70);
        duckMiddele = new Duck(width / 2 - (165), height / 2 - 135, 30);

        duckBehindRight.isRight = false;
        duckMiddele.isRight = false;

        this.tearPosition = new PVector(width / 2 - 25, height / 2 - 45);
        this.velocity = new PVector(0, random(0.2f, 0.8f));
    }

    void draw() {
        if (!looseSound.isPlaying()) {
            mainSound.stop();
            gameSound.stop();
            flappySound.stop();
            looseSound.loop();
            winSound.stop();
        }
        background(0, 0, 0);

        if (!timerOn) {
            savedTime = millis();
            timerOn = true;
        }

        if (millis() - savedTime > totalTime) {
            timerOn = false;
            sceneStat++;
        }
        noStroke();
        switch (sceneStat) {
            case 0:
                duckFrontLeft.draw();
                break;
            case 1:
                duckBehindRight.draw();
                break;
            case 2:
                duckBehindLeft.draw();
                break;
            default:
                for (int y = 0; y < ellipseSpotlight.length; y++) {
                    for (int x = 0; x < ellipseSpotlight[y].length; x++) {
                        if (ellipseSpotlight[y][x]) {
                            fill(255);
                            rect((width / 2 - 375) + x * 30, (height / 2) + y * 20, 30, 20);
                        }
                    }
                }

                if (sceneStat > 3) {
                    isTearing = true;
                }

                duckMiddele.draw();
                
                if (isTearing) {
                    integrate();
                    fill(85, 206, 255);
                    rect(tearPosition.x, tearPosition.y, 10, 10);
                    characters.displaySentenceCentre("PRESS ENTER TO MAIN MENU", width / 2, height - 200, 5, #ffffff);
                }
                break;
        }
    }

    void integrate() {
        // update position
        tearPosition.add(velocity) ;
        // update velocity
        velocity.add(WATERFALL_GRAVITY) ;
        // apply damping
        velocity.mult(DAMPING) ;

        if (tearPosition.y >= height / 2 + 140) {
            this.tearPosition = new PVector(width / 2 - 25, height / 2 - 45);
            this.velocity = new PVector(0, random(0.2f, 0.8f));
        }
    }
}
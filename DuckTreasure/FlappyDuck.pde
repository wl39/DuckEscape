final class FlappyDuck {
    int obstaclesPerScreen = 3;
    int flappyDuckState = 0;
    int timerCount = 0;

    int savedTime;
    int totalTime = 800;

    Obstacle[] obstacles = new Obstacle[obstaclesPerScreen];

    Duck duck = new Duck(100, 0, 10);
    boolean readyToStart = false;

    int bubbleParticles = 200;
    Bubble[] bubbles = new Bubble[bubbleParticles];
    DuckEmotion emotion = new DuckEmotion();

    FlappyDuck() {
        lives--;
        for (int i = 0; i < obstaclesPerScreen; i++) {
            obstacles[i] = new Obstacle(width + (i * (width / 2.7f)), random(50, height - 50 - (height / 4)));
        }

         for (int i = 0; i < bubbleParticles; i++) {
            bubbles[i] = new Bubble(0, height, width, height);
        }
    }

    void draw() {
        if (!flappySound.isPlaying()) {
            mainSound.stop();
            gameSound.stop();
            flappySound.loop();
            looseSound.stop();
            winSound.stop();
        }
        if (lives < 0) {
            state = LOOSE;
            return;
        }
        bubblesDraw();

        if (flappyDuckState == 0) {
            if (duck.position.y >= height / 2) {
                duck.flappyVelocity = new PVector(0, 2);   
                readyToStart = true;

                characters.displaySentenceCentre("PRESS SPACE BAR TO START", width / 2, 200, 7, #FFD801);
            } else {
                duck.duckGravity();
            }
        } else {
            for (int i = 0; i < obstaclesPerScreen; i++) {
                obstacles[i].draw();
                if (flappyDuckState == 1) {
                    obstacles[i].integrate();
                }
                if (duck.position.x + 100 > obstacles[i].position.x &&
                    duck.position.x + 10< obstacles[i].position.x + obstacles[i].obstacleWidth &&
                    duck.position.y + 80 > obstacles[i].position.y &&
                    duck.position.y + 10 < obstacles[i].position.y + obstacles[i].holePosition) {
                        flappyDuckState = 2;
                        emotion.drawExBottom(duck.position.x + 95, duck.position.y - 75, 5);
                        if (savedTime == 0) {
                            savedTime = millis();
                        }

                        if (millis() - savedTime > totalTime) {
                            maxTimerCount();
                            sink = new Sink(width - 200, 100, 100, height - 200, (float) timerCount / 100.f);
                            state = GAME;
                            return;
                        }
                }

                if (duck.position.x + 100 > obstacles[i].position.x &&
                    duck.position.x + 10< obstacles[i].position.x + obstacles[i].obstacleWidth &&
                    duck.position.y + 80 >  obstacles[i].holePosition + obstacles[i].holeDepth &&
                    duck.position.y + 10 < height) {
                        flappyDuckState = 2;
                        emotion.drawExBottom(duck.position.x + 95, duck.position.y - 75, 5);
                        if (savedTime == 0) {
                            savedTime = millis();
                        }

                        if (millis() - savedTime > totalTime) {
                            maxTimerCount();
                            sink = new Sink(width - 200, 100, 100, height - 200, (float) timerCount / 100.f);
                            state = GAME;
                            return;
                        }
                }


                if (duck.position.x + 100 > obstacles[i].position.x &&
                    duck.position.x + 10 < obstacles[i].position.x + obstacles[i].obstacleWidth &&
                    duck.position.y + 80 < obstacles[i].holePosition + obstacles[i].holeDepth &&
                    duck.position.y + 10 > obstacles[i].position.y + obstacles[i].holePosition) {
                        emotion.drawAddTime(duck.position.x + 95, duck.position.y - 75, 5);
                        timerCount++;
                }
            }
        }
        
        duck.draw();
        
        if (flappyDuckState == 1) {
            duck.duckGravity();
        }

        if (duck.position.y + 10 < 0) {
            emotion.drawExTop(duck.position.x + 75, duck.position.y + 95, 5);
            flappyDuckState = 2;

            if (savedTime == 0) {
                savedTime = millis();
            }

            if (millis() - savedTime > totalTime) {
                maxTimerCount();
                sink = new Sink(width - 200, 100, 100, height - 200, (float) timerCount / 100.f);
                state = GAME;
                return;
            }

        }

        if (duck.position.y + 60 >= height) {
            emotion.drawExBottom(duck.position.x + 95, duck.position.y - 75, 5);
            flappyDuckState = 2;

            if (savedTime == 0) {
                savedTime = millis();
            }

            if (millis() - savedTime > totalTime) {
                maxTimerCount();
                sink = new Sink(width - 200, 100, 100, height - 200, (float) timerCount / 100.f);
                state = GAME;
                return;
            }
        }

        
    }

    void clicked() {
        if (readyToStart && flappyDuckState != 2) {
            duck.flap();

            flappyDuckState = 1;
        }
    }

    void bubblesDraw() {
        for (int i = 0; i < bubbleParticles; i++) {
            bubbles[i].integrate(0);
            if (flappyDuckState == 1) {
                bubbles[i].position.x -= 5;
            }
            fill(255);
            noStroke();
            rect(bubbles[i].position.x, bubbles[i].position.y, 7, 7);
        }
    }

    void maxTimerCount() {
        if (timerCount < 50) {
            timerCount = 50;
        }

        switch(level) {
            case 1:
                timerCount *= 5;
                if (timerCount > 5000) {
                    timerCount = 5000;
                }
                break;
            case 2:
                timerCount *= 4;
                if (timerCount > 4000) {
                    timerCount = 4000;
                }
                break;
            case 3:
                timerCount *= 2;
                if (timerCount > 2500) {
                    timerCount = 2500;
                }
                break;
            case 4:
                if (timerCount > 1500) {
                    timerCount = 1500;
                }
                break;
            case 5:
                timerCount /= 2;
                if (timerCount > 1000) {
                    timerCount = 1000;
                }
                break;
            default:
                timerCount = 100;
        }
    }
}
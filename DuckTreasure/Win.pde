final class Win {
    Cloud[] clouds = new Cloud[10];
    private static final float DAMPING = .995f;
    private final PVector GRAVITY = new PVector(0, 0.05f);
    Duck duck;

    Win() {
        duck = new Duck(width / 2 - (165), height / 2 - 200, 15);
        duck.velocity = new PVector(0, random(-0.8f, -0.2f));

        for (int i = 0; i < clouds.length; i++) {
            clouds[i] = new Cloud();
        }
    }

    void draw() {
        if (!winSound.isPlaying()) {
            mainSound.stop();
            gameSound.stop();
            flappySound.stop();
            looseSound.stop();
            winSound.loop();
        }
        
        noStroke();
        background(85, 206, 255);

        duck.draw();
        integrate();

        for (int i = 0; i < clouds.length; i++) {
            clouds[i].draw();
        }
        characters.displaySentenceCentre("YOU WIN !", width / 2, height - 250, 5, #ffffff);

        characters.displaySentenceCentre("PRESS ENTER TO MAIN MENU", width / 2, height - 200, 5, #ffffff);
    }

    void integrate() {
        // update position
        duck.position.add(duck.velocity) ;
        // update velocity
        duck.velocity.add(GRAVITY) ;
        // apply damping
        duck.velocity.mult(DAMPING) ;

        if (duck.position.y >= height / 2 - 100) {
            duck.velocity = new PVector(0, random(-5.8f, -2.6f));
        }
    }
}
final class Duck {
    private static final float DAMPING = .995f ;
    private PVector flappyDuckGravity = new PVector(0, 1f);
    char[][] duck = {

        {' ', ' ', 'y', 'y', 'y', ' ', ' ', ' ', ' ', ' ', ' '}, // 11
        {' ', 'y', 'y', 'y', 'y', 'y', ' ', ' ', ' ', ' ', ' '},
        {' ', 'o', 'o', 'y', 'b', 'y', ' ', ' ', ' ', ' ', ' '},
        {'o', 'o', 'o', 'y', 'y', 'y', ' ', ' ', ' ', ' ', 'y'},
        {' ', 'y', 'y', 'y', 'y', 'y', ' ', ' ', 'y', 'y', 'y'},
        {' ', ' ', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y'},
        {' ', ' ', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y'},
        {' ', ' ', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y'},
        {' ', ' ', ' ', 'y', 'y', 'y', 'y', 'y', 'y', 'y', ' '},// 9
    };

    char[][] duckRight = {
        {' ', ' ', ' ', ' ', ' ', ' ', 'y', 'y', 'y', ' ', ' '},
        {' ', ' ', ' ', ' ', ' ', 'y', 'y', 'y', 'y', 'y', ' '},
        {' ', ' ', ' ', ' ', ' ', 'y', 'b', 'y', 'o', 'o', ' '},
        {'y', ' ', ' ', ' ', ' ', 'y', 'y', 'y', 'o', 'o', 'o'},
        {'y', 'y', 'y', ' ', ' ', 'y', 'y', 'y', 'y', 'y', ' '},
        {'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', ' ', ' '},
        {'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', ' ', ' '},
        {'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', ' ', ' '},
        {' ', 'y', 'y', 'y', 'y', 'y', 'y', 'y', ' ', ' ', ' '},
    };

    int splashParticles = 20;
    Splash[] splashes = new Splash[splashParticles];


    float topLeftPositionX;
    float topLeftPositionY;
    int pixelSize;

    boolean isRight = true;
    PVector position, velocity, flappyVelocity;

    Duck(float topLeftPositionX, float topLeftPositionY, int pixelSize) {
        this.position = new PVector(topLeftPositionX, topLeftPositionY);
        this.velocity = new PVector(random(0, 4), random(-10,-2)) ; 
        this.flappyVelocity = new PVector(0, 2); 
        this.pixelSize = pixelSize;
    }

    void getNewVelocity() {
        this.velocity = new PVector(random(0, 4), random(-5, -1)) ;   
    }

    void draw() {
        
        if (!isRight) {
            for (int column = 0; column < duck.length; column++) {
                for (int row = 0; row < duck[column].length; row++) {
                    switch (duck[column][row]) {
                        case 'y':
                            fill(255, 255, 0);
                            break;
                        case 'o':
                            fill(255, 165, 0 );
                            break;
                        case 'b':
                            fill(0, 0, 0);
                            break;
                        default :
                            continue;    
                    }

                    rect(position.x + (row * pixelSize), position.y + (column * pixelSize), pixelSize, pixelSize);
                }
            }
        } else {
            for (int column = 0; column < duckRight.length; column++) {
                for (int row = 0; row < duckRight[column].length; row++) {
                    switch (duckRight[column][row]) {
                        case 'y':
                            fill(255, 255, 0);
                            break;
                        case 'o':
                            fill(255, 165, 0 );
                            break;
                        case 'b':
                            fill(0, 0, 0);
                            break;
                        default :
                            continue;    
                    }

                    rect(position.x + (row * pixelSize), position.y + (column * pixelSize), pixelSize, pixelSize);
                }
            }
        }

        for (int i = 0; i < splashParticles; i++) {
            if (splashes[i] != null) {
                splashes[i].integrate();
                fill(85, 206, 255);
                rect(splashes[i].position.x, splashes[i].position.y, 10, 10);
            }
        }
    }

    void move(char direction, float speed) {
        switch(direction) {
            case 'l':
                break;
            case 'r':
                position.x += speed;
                break;
            case 'd':
                position.y += speed;
                break;
            case 'u':
                break;
        }
    }

    void mainMove(float surface) {
        if (position.x + 110 >= width) {
            isRight = false;
        }

        if (position.x <= 0) {
            isRight = true;
        }

        //Bouncing
        if (position.y + 60 >= surface) {
            if (isRight) {
                for (int i = 0; i < splashParticles; i++) {
                    splashes[i] = new Splash((int) position.x, (int) (position.y + 50), 110);
                }
                this.velocity = new PVector(random(1, 4), random(-10,-2)) ;  
            } else {
                for (int i = 0; i < splashParticles; i++) {
                    splashes[i] = new Splash((int) position.x, (int) (position.y + 50), 110);
                }
                this.velocity = new PVector(random(-4, -1), random(-10,-2)) ;  
            }
        }
        // update position
        position.add(velocity) ;
        // update velocity
        velocity.add(gravity) ;
        // apply damping
        velocity.mult(DAMPING) ;
    }

    void clickedMove() {
        // update position
        position.add(velocity) ;
        // update velocity
        velocity.add(gravity) ;
        // apply damping
        velocity.mult(DAMPING) ;
    }

    void duckGravity() {
        position.add(flappyVelocity);
        flappyVelocity.add(flappyDuckGravity) ;
        flappyVelocity.mult(DAMPING) ;
    }

    void flap() {
        flappyVelocity = new PVector(0, -15f);
    }
}
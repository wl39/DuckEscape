final class Cloud {
    int[][] cloud = {
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, // 24 * 9
        {0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 2, 2, 2, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 2, 2, 0, 0},
        {0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0},
        {0, 2, 2, 2, 0, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2},
        {1, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 1},
        {1, 1, 2, 2, 2, 2, 2, 1, 1, 2, 2, 2, 2, 1, 1, 2, 2, 2, 2, 2, 2, 2, 1, 1},
        {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    };

    PVector position, velocity;
    int pixelSize;

    Cloud() {
        this.pixelSize = (int) random(1, 10);
        this.position = new PVector(width, random(50, height - 50));
        this.velocity = new PVector(random(-4.5f, -0.2f), 0);
    }

    void draw() {
        for (int column = 0; column < cloud.length; column++) {
            for (int row = 0; row < cloud[column].length; row++) {
                switch (cloud[column][row]) {
                    case 1:
                        fill(#C5E0FD);
                        break;
                    case 2:
                        fill(#FFFFFF);
                        break;
                    default :
                        continue;    
                }

                rect(position.x + (row * pixelSize), position.y + (column * pixelSize), pixelSize, pixelSize);
            }
        }

        integrate();
    }

    void integrate() {
        position.add(velocity);
        
        if (position.x < -240) {
            this.pixelSize = (int) random(1, 10);
            this.position = new PVector(width, random(50, height - 50));
            this.velocity = new PVector(random(-4.5f, -0.2f), 0);
        }
    }
}
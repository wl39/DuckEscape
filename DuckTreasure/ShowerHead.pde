final class ShowerHead {
    private static final float DAMPING = .995f;
    private final PVector WATERFALL_GRAVITY = new PVector(0, 0.05f);

    int xPosition;
    int yPosition;
    float yOffset;

    PVector position, velocity;

    ShowerHead(int xPosition, int yPosition) {
        this.xPosition = xPosition;
        this.yPosition = yPosition;

        this.position = new PVector(xPosition + random(0, width), yPosition + random(0, height / 2));

        this.velocity = new PVector(0, random(0.2f, 0.8f));
    }

    void integrate(float waterHeight) {
        // update position
        position.add(velocity) ;
        // update velocity
        velocity.add(WATERFALL_GRAVITY) ;
        // apply damping
        velocity.mult(DAMPING) ;

        if (position.y >= waterHeight) {
            this.position = new PVector(xPosition + random(0, width), yPosition + yOffset);
            this.velocity = new PVector(0, random(0.2f, 0.8f));
        }
    }
}
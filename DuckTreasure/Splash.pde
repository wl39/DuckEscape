final class Splash {
  private static final float DAMPING = .995f ;

  PVector position, velocity;

  Splash(int xPosition, int yPosition, int surfaceWidth) {
    float xOffset = random(0, surfaceWidth);
    this.position = new PVector(xPosition + xOffset, yPosition);

    if ((int) xOffset > (surfaceWidth / 2)) {
        this.velocity = new PVector(random(1, 3), random(-1.8f, 0));
    } else if ((int) xOffset == (surfaceWidth / 2)) {
        this.velocity = new PVector(0, random(-0.8f, 0));
    } else {
        this.velocity = new PVector(random(-3, -1), random(-1.8f, 0));
    }
  }

  void integrate() {
    // update position
    position.add(velocity) ;
    // update velocity
    velocity.add(gravity) ;
    // apply damping
    velocity.mult(DAMPING) ;

  }
}
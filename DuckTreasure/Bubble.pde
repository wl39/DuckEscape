public static PVector waterGravity = new PVector(0, -0.002f) ;

final class Bubble {
  private static final float DAMPING = .995f ;

  PVector position, velocity;
  int initXPosition;
  int initYPosition;
  int sinkWidth;
  int maxStartHeight;

  Bubble(int xPosition, int yPosition, int sinkWidth, int maxStartHeight) {
    this.initXPosition = xPosition;
    this.initYPosition = yPosition;
    this.sinkWidth = sinkWidth;
    this.maxStartHeight = maxStartHeight;

    this.position = new PVector(xPosition + random(0, sinkWidth - 3), yPosition - random(0, maxStartHeight));
    this.velocity = new PVector(0, random(-0.8f, 0));
  }

  void integrate(float waterHeight) {
    // update position
    position.add(velocity) ;
    // update velocity
    velocity.add(waterGravity) ;
    // apply damping
    velocity.mult(DAMPING) ;

    if (position.y <= waterHeight) {
      this.position = new PVector(initXPosition + random(0, sinkWidth), initYPosition - random(0, maxStartHeight));
      this.velocity = new PVector(0, random(-0.8f, 0));
    }

    if (position.x < 0) {
      this.position = new PVector(initXPosition + random(0, sinkWidth), initYPosition - random(0, maxStartHeight));
      this.velocity = new PVector(0, random(-0.8f, 0));
    }
  }
}
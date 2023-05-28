final class Game2048Tile {
    int value = 0;
    PVector position;
    PVector fillPosition;

    Game2048Tile(float positionX, float positionY, int value) {
        this.value = value;
        this.position = new PVector(positionX, positionY);
        this.fillPosition = new PVector(positionX, positionY);
    }

    void setValue(int value) {
        this.value = value;
    }
}
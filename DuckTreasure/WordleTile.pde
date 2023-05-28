final class WordleTile {
    char status = 0;
    char character = ' ';
    PVector position;

    WordleTile(float positionX, float positionY) {
        this.position = new PVector(positionX, positionY);
    }

    void setCharacter(char character) {
        this.character = character;
    }

    void setToWhiteSpace() {
        character = ' ';
    }

    void setStatus(char status) {
        this.status = status;
    }
}
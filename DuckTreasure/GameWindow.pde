final class GameWindow {
    Duck[] ducks = new Duck[2];

    Tile tile;
    GameWindow() {
        ducks[0] = new Duck(100, 20, 5);
        ducks[1] = new Duck(175, 20, 5);

        if (!infinity) {
            if (level > 5) {
                state = WIN;
            }
        }
        switch (level) {
            case 1:
                gameTimer = 120.f;
                break;
            case 2:
                gameTimer = 100.f;
                break;
            case 3:
                gameTimer = 90.f;
                break;
            case 4:
                gameTimer = 70.f;
                break;
            case 5:
                gameTimer = 60.f;
                break;
            default:
                gameTimer = 50.f;
                break;
        }
        gameType = (int) random(mainGames.length);
        tile = new Tile(width, height, 1024);

        switch (gameType) {
            case WORDLE:
                wordle = new Wordle();
                wordle.getRandomWord();
                break;
            case MATH:
                mathMain = new MathMain();
                break;
            case MEMORY:
                memoryCard = new MemoryCardMain();
                break;
            case GAME2048:
                game2048 = new Game2048();
                break;
            default:
                wordle = new Wordle();
                wordle.getRandomWord();
                break;
        }
    }

    void draw() {
        for (int i = 0; i < lives; i++) {
            ducks[i].draw();
        }

        tileDraw();

        switch (gameType) {
            case WORDLE:
                characters.displaySentenceCentre("WORD FINDER", width / 2, 100, 6, #ffa500);
                wordle.draw();
                break;
            case MATH:
                characters.displaySentenceCentre("MATH EQUATION", width / 2, 100, 6, #ffa500);
                mathMain.draw();
                break;
            case GAME2048:
                characters.displaySentenceCentre("COLORS", width / 2, 100, 6, #ffa500);
                game2048.draw();
                break;
            case MEMORY:
                characters.displaySentenceCentre("MEMORY CARD", width / 2, 50, 6, #ffa500);
                memoryCard.draw();
                break;
            default:
                characters.displaySentenceCentre("WORD FINDER", width / 2, 100, 6, #ffa500);
                wordle.draw();
                break;
        }
    }

    void tileDraw() {
        tile.draw();
    }
}
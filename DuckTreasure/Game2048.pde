final class Game2048 {
    Game2048Tile[][] gameTiles = new Game2048Tile[4][4];
    boolean isMoving = false;

    int savedTime;
    int totalTime = 800;

    // int[][] board = {
    //     {1, 1, 1, 1},
    //     {1, 2, 3, 1},
    //     {1, 2, 3, 1},
    //     {1, 1, 1, 1},
    // };

    int[][] movedBoard = {
        {0, 0, 0, 0},
        {0, 0, 0, 0},
        {0, 0, 0, 0},
        {0, 0, 0, 0},
    };

    int[][] board = {
        {0, 2, 1, 1},
        {0, 0, 0, 0},
        {0, 0, 0, 0},
        {0, 0, 0, 0},
    };

    int targetValue;
    
    Game2048() {
        int maxRandomTiles = 0;
        int maxNumberTiles = 0;
        switch (level) {
            case 1:
                maxRandomTiles = 3;
                maxNumberTiles = 6;
                break;
            case 2:
                maxRandomTiles = 3;
                maxNumberTiles = 4;
                break;
            case 3:
                maxRandomTiles = 2;
                maxNumberTiles = 6;
                break;
            case 4:
                maxRandomTiles = 1;
                maxNumberTiles = 4;
                break;
            default:
                maxRandomTiles = 1;
                maxNumberTiles = 1;
                break;
        }

        fillRandomTile(maxRandomTiles, maxNumberTiles);

        targetValue = 6 + (level / 3);
        gameTiles[0][0] = new Game2048Tile(((width - 300) / 2) - 220, (height / 2) - 295, 0);
        gameTiles[0][1] = new Game2048Tile(((width - 300) / 2) - 70, (height / 2) - 295, 0);
        gameTiles[0][2] = new Game2048Tile(((width - 300) / 2) + 80, (height / 2) - 295, 0);
        gameTiles[0][3] = new Game2048Tile(((width - 300) / 2) + 230, (height / 2) - 295, 0);

        gameTiles[1][0] = new Game2048Tile(((width - 300) / 2) - 220, (height / 2) - 145, 0);
        gameTiles[1][1] = new Game2048Tile(((width - 300) / 2) - 70, (height / 2) - 145, 0);
        gameTiles[1][2] = new Game2048Tile(((width - 300) / 2) + 80, (height / 2) - 145, 0);
        gameTiles[1][3] = new Game2048Tile(((width - 300) / 2) + 230, (height / 2) - 145, 0);

        gameTiles[2][0] = new Game2048Tile(((width - 300) / 2) - 220, (height / 2), 0);
        gameTiles[2][1] = new Game2048Tile(((width - 300) / 2) - 70, (height / 2), 0);
        gameTiles[2][2] = new Game2048Tile(((width - 300) / 2) + 80, (height / 2), 0);
        gameTiles[2][3] = new Game2048Tile(((width - 300) / 2) + 230, (height / 2), 0);

        gameTiles[3][0] = new Game2048Tile(((width - 300) / 2) - 220, (height / 2) + 145, 0);
        gameTiles[3][1] = new Game2048Tile(((width - 300) / 2) - 70, (height / 2) + 145, 0);
        gameTiles[3][2] = new Game2048Tile(((width - 300) / 2) + 80, (height / 2) + 145, 0);
        gameTiles[3][3] = new Game2048Tile(((width - 300) / 2) + 230, (height / 2) + 145, 0);
    }

    void draw() {
        if (!gameSound.isPlaying()) {
            mainSound.stop();
            gameSound.loop();
            flappySound.stop();
            looseSound.stop();
            winSound.stop();
        }
        for (int y = 0; y < gameTiles.length; y++) {
            for (int x = 0; x < gameTiles[y].length; x++) {
                fill(#3681A1, 50);
                rect(gameTiles[y][x].position.x - 5, gameTiles[y][x].position.y - 5, 140, 140);
                
                if (board[y][x] != 0) {
                    switch(board[y][x]) {
                        case 1:
                            fill(#ff0000, 200);
                            break;
                        case 2:
                            fill(#FFA500, 200);
                            break;
                        case 3:
                            fill(#FFFF00, 200);
                            break;
                        case 4:
                            fill(#00FF00, 200);
                            break;
                        case 5:
                            fill(#00FFA5, 200);
                            break;
                        case 6:
                            fill(#00FFFF, 200);
                            break;
                        case 7:
                            fill(#0000FF, 200);
                            break;
                        case 8:
                            fill(#800080, 200);
                            break;
                        case 9:
                            fill(#000000, 180);
                            break;
                        case 10:
                            fill(#000000, 255);
                            break;
                        default:
                            break;
                    }
                    rect(gameTiles[y][x].fillPosition.x, gameTiles[y][x].fillPosition.y, 130, 130);
                }
            }
        }

        characters.displaySentenceCentre("TARGET ", width / 2 + 375, height / 2 - 285, 5, #ffa500);

        switch(targetValue) {
            case 1:
                    fill(#ff0000, 200);
                    break;
                case 2:
                    fill(#FFA500, 200);
                    break;
                case 3:
                    fill(#FFFF00, 200);
                    break;
                case 4:
                    fill(#00FF00, 200);
                    break;
                case 5:
                    fill(#00FFA5, 200);
                    break;
                case 6:
                    fill(#00FFFF, 200);
                    break;
                case 7:
                    fill(#0000FF, 200);
                    break;
                case 8:
                    fill(#800080, 200);
                    break;
                case 9:
                    fill(#000000, 180);
                    break;
                case 10:
                    fill(#000000, 255);
                    break;
                default:
                    break;
        }
        
        rect(width / 2 + 492, height / 2 - 300, 50, 50);

        for (int i = 1; i < 10; i++) {
            switch(i) {
                case 1:
                    fill(#ff0000, 200);
                    break;
                case 2:
                    fill(#FFA500, 200);
                    break;
                case 3:
                    fill(#FFFF00, 200);
                    break;
                case 4:
                    fill(#00FF00, 200);
                    break;
                case 5:
                    fill(#00FFA5, 200);
                    break;
                case 6:
                    fill(#00FFFF, 200);
                    break;
                case 7:
                    fill(#0000FF, 200);
                    break;
                case 8:
                    fill(#800080, 200);
                    break;
                case 9:
                    fill(#000000, 180);
                    break;
                case 10:
                    fill(#000000, 255);
                    break;
                default:
                    break;
            }
            rect(width / 2 + 300, height / 2 - 300 + (i * 60), 50, 50);
            rect(width / 2 + 396, height / 2 - 300 + (i * 60), 50, 50);

            switch(i + 1) {
                case 1:
                    fill(#ff0000, 200);
                    break;
                case 2:
                    fill(#FFA500, 200);
                    break;
                case 3:
                    fill(#FFFF00, 200);
                    break;
                case 4:
                    fill(#00FF00, 200);
                    break;
                case 5:
                    fill(#00FFA5, 200);
                    break;
                case 6:
                    fill(#00FFFF, 200);
                    break;
                case 7:
                    fill(#0000FF, 200);
                    break;
                case 8:
                    fill(#800080, 200);
                    break;
                case 9:
                    fill(#000000, 180);
                    break;
                case 10:
                    fill(#000000, 255);
                    break;
                default:
                    break;
            }

            rect(width / 2 + 492, height / 2 - 300 + (i * 60), 50, 50);

            characters.displaySentenceCentre("+", width / 2 + 375, height / 2 - 286 + (i * 60), 5, #000000);
            characters.displaySentenceCentre("=", width / 2 + 471, height / 2 - 286 + (i * 60), 5, #000000);
        }

        checkTarget();
    }

    void sortLeft() {
        for (int y = 0; y < movedBoard.length; y++) {
            // index 1
            if (movedBoard[y][0] == 0 && movedBoard[y][1] != 0) {
                movedBoard[y][0] = movedBoard[y][1];
                movedBoard[y][1] = 0;
                // isMovementDone = true;
            }

            // index 2

            if (movedBoard[y][0] == 0 && movedBoard[y][1] == 0 && movedBoard[y][2] != 0) {
                movedBoard[y][0] = movedBoard[y][2];
                movedBoard[y][2] = 0;
            }

            if (movedBoard[y][0] != 0 && movedBoard[y][1] == 0 && movedBoard[y][2] != 0) {
                movedBoard[y][1] = movedBoard[y][2];
                movedBoard[y][2] = 0;
            }

            if (movedBoard[y][0] == 0 && movedBoard[y][1] != 0 && movedBoard[y][2] != 0) {
                movedBoard[y][1] = movedBoard[y][2];
                movedBoard[y][2] = 0;
            }

            // index 3
            if (movedBoard[y][0] == 0 && movedBoard[y][1] == 0 && movedBoard[y][2] == 0 && movedBoard[y][3] != 0) {
                movedBoard[y][0] = movedBoard[y][3];
                movedBoard[y][3] = 0;
            }

            if (movedBoard[y][0] != 0 && movedBoard[y][1] == 0 && movedBoard[y][2] == 0 && movedBoard[y][3] != 0) {
                movedBoard[y][1] = movedBoard[y][3];
                movedBoard[y][3] = 0;
            }

            if (movedBoard[y][0] == 0 && movedBoard[y][1] != 0 && movedBoard[y][2] == 0 && movedBoard[y][3] != 0) {
                movedBoard[y][1] = movedBoard[y][3];
                movedBoard[y][3] = 0;
            }

            if (movedBoard[y][0] == 0 && movedBoard[y][1] == 0 && movedBoard[y][2] != 0 && movedBoard[y][3] != 0) {
                movedBoard[y][1] = movedBoard[y][3];
                movedBoard[y][3] = 0;
            }

            if (movedBoard[y][0] != 0 && movedBoard[y][1] != 0 && movedBoard[y][2] == 0 && movedBoard[y][3] != 0) {
                movedBoard[y][2] = movedBoard[y][3];
                movedBoard[y][3] = 0;
            }

            if (movedBoard[y][0] != 0 && movedBoard[y][1] == 0 && movedBoard[y][2] != 0 && movedBoard[y][3] != 0) {
                movedBoard[y][2] = movedBoard[y][3];
                movedBoard[y][3] = 0;
            }

            if (movedBoard[y][0] == 0 && movedBoard[y][1] != 0 && movedBoard[y][2] != 0 && movedBoard[y][3] != 0) {
                movedBoard[y][2] = movedBoard[y][3];
                movedBoard[y][3] = 0;
            }
        }
    }

    void moveLeft() {
        boolean isMoved = false;

        for (int y = 0; y <board.length; y++) {
            for (int x = 0; x < board.length; x++) {
                movedBoard[y][x] = board[y][x];
            }
        }
        for (int y = 0; y < board.length; y++) {
            // 1 1 0 0
            if (board[y][0] == board[y][1] && board[y][0] != 0 && board[y][1] != 0) {
                movedBoard[y][0]++;
                movedBoard[y][1] = 0;
            }
            // x 1 1 0
            if (board[y][0] != board[y][1] && board[y][1] == board[y][2] && board[y][1] != 0 && board[y][2] != 0) {
                movedBoard[y][1]++;
                movedBoard[y][2] = 0;
            }

            // x y 1 1
            if (board[y][2] == board[y][3] && board[y][2] != 0 && board[y][3] != 0) {
                movedBoard[y][2]++;
                movedBoard[y][3] = 0;
            }

            if (board[y][0] == board[y][2] && board[y][1] == 0 && board[y][0] != 0 && board[y][2] != 0) {
                movedBoard[y][0]++;
                movedBoard[y][2] = 0;
            }

            if (board[y][0] == board[y][3] && board[y][1] == 0 && board[y][2] == 0 && board[y][0] != 0 && board[y][3] != 0) {
                movedBoard[y][0]++;
                movedBoard[y][3] = 0;
            }

            if (board[y][1] == board[y][3] && board[y][2] == 0 && board[y][1] != 0 && board[y][3] != 0) {
                movedBoard[y][1]++;
                movedBoard[y][3] = 0;
            }
        }

        for (int y = 0; y <board.length; y++) {
            if (movedBoard[y][0] == 0 && (movedBoard[y][1] != 0 || movedBoard[y][2]  != 0 || movedBoard[y][3] != 0)) {
                sortLeft();
                break;
            }

            if (movedBoard[y][1] == 0 && (movedBoard[y][2] != 0 || movedBoard[y][3] != 0)) {
                sortLeft();
                break;
            }

            if (movedBoard[y][2] == 0 && movedBoard[y][3] != 0) {
                sortLeft();
                break;
            }
        }

        for (int y = 0; y <board.length; y++) {
            for (int x = 0; x < board.length; x++) {
                if (movedBoard[y][x] != board[y][x]) {
                    isMoved = true;
                }

                board[y][x] = movedBoard[y][x];
            }
        }

        if (isMoved) {
            fillRandomTile();
        }
    }

    void sortRight() {
        for (int y = 0; y < movedBoard.length; y++) {
            // index 1
            if (movedBoard[y][3] == 0 && movedBoard[y][2] != 0) {
                movedBoard[y][3] = movedBoard[y][2];
                movedBoard[y][2] = 0;
            }

            // index 2

            if (movedBoard[y][3] == 0 && movedBoard[y][2] == 0 && movedBoard[y][1] != 0) {
                movedBoard[y][3] = movedBoard[y][1];
                movedBoard[y][1] = 0;
            }

            if (movedBoard[y][3] != 0 && movedBoard[y][2] == 0 && movedBoard[y][1] != 0) {
                movedBoard[y][2] = movedBoard[y][1];
                movedBoard[y][1] = 0;
            }

            if (movedBoard[y][3] == 0 && movedBoard[y][2] != 0 && movedBoard[y][1] != 0) {
                movedBoard[y][2] = movedBoard[y][1];
                movedBoard[y][1] = 0;
            }

            // index 3
            if (movedBoard[y][3] == 0 && movedBoard[y][2] == 0 && movedBoard[y][1] == 0 && movedBoard[y][0] != 0) {
                movedBoard[y][3] = movedBoard[y][0];
                movedBoard[y][0] = 0;
            }

            if (movedBoard[y][3] != 0 && movedBoard[y][2] == 0 && movedBoard[y][1] == 0 && movedBoard[y][0] != 0) {
                movedBoard[y][2] = movedBoard[y][0];
                movedBoard[y][0] = 0;
            }

            if (movedBoard[y][3] == 0 && movedBoard[y][2] != 0 && movedBoard[y][1] == 0 && movedBoard[y][0] != 0) {
                movedBoard[y][2] = movedBoard[y][0];
                movedBoard[y][0] = 0;
            }

            if (movedBoard[y][3] == 0 && movedBoard[y][2] == 0 && movedBoard[y][1] != 0 && movedBoard[y][0] != 0) {
                movedBoard[y][2] = movedBoard[y][0];
                movedBoard[y][0] = 0;
            }

            if (movedBoard[y][3] != 0 && movedBoard[y][2] != 0 && movedBoard[y][1] == 0 && movedBoard[y][0] != 0) {
                movedBoard[y][1] = movedBoard[y][0];
                movedBoard[y][0] = 0;
            }

            if (movedBoard[y][3] != 0 && movedBoard[y][2] == 0 && movedBoard[y][1] != 0 && movedBoard[y][0] != 0) {
                movedBoard[y][1] = movedBoard[y][0];
                movedBoard[y][0] = 0;
            }

            if (movedBoard[y][3] == 0 && movedBoard[y][2] != 0 && movedBoard[y][1] != 0 && movedBoard[y][0] != 0) {
                movedBoard[y][1] = movedBoard[y][0];
                movedBoard[y][0] = 0;
            }
        }
    }

    void moveRight() {
        boolean isMoved = false;

        for (int y = 0; y <board.length; y++) {
            for (int x = 0; x < board.length; x++) {
                movedBoard[y][x] = board[y][x];
            }
        }
        for (int y = 0; y < board.length; y++) {
            // 1 1 0 0
            if (board[y][3] == board[y][2] && board[y][3] != 0 && board[y][2] != 0) {
                movedBoard[y][3]++;
                movedBoard[y][2] = 0;
            }
            // x 1 1 0
            if (board[y][3] != board[y][2] && board[y][2] == board[y][1] && board[y][2] != 0 && board[y][1] != 0) {
                movedBoard[y][2]++;
                movedBoard[y][1] = 0;
            }

            // x y 1 1
            if (board[y][1] == board[y][0] && board[y][1] != 0 && board[y][0] != 0) {
                movedBoard[y][1]++;
                movedBoard[y][0] = 0;
            }

            if (board[y][3] == board[y][1] && board[y][2] == 0 && board[y][3] != 0 && board[y][1] != 0) {
                movedBoard[y][3]++;
                movedBoard[y][1] = 0;
            }

            if (board[y][3] == board[y][0] && board[y][2] == 0 && board[y][1] == 0 && board[y][3] != 0 && board[y][0] != 0) {
                movedBoard[y][3]++;
                movedBoard[y][0] = 0;
            }

            if (board[y][2] == board[y][0] && board[y][1] == 0 && board[y][2] != 0 && board[y][0] != 0) {
                movedBoard[y][2]++;
                movedBoard[y][0] = 0;
            }
        }

        for (int y = 0; y <movedBoard.length; y++) {
            if (movedBoard[y][3] == 0 && (movedBoard[y][2] != 0 || movedBoard[y][1] != 0 || movedBoard[y][0] != 0)) {
                sortRight();
                break;
            }

            if (movedBoard[y][2] == 0 && (movedBoard[y][1] != 0 || movedBoard[y][0] != 0)) {
                sortRight();
                break;
            }

            if (movedBoard[y][1] == 0 && movedBoard[y][0] != 0) {
                sortRight();
                break;
            }
        }

        for (int y = 0; y <board.length; y++) {
            for (int x = 0; x < board.length; x++) {
                if (movedBoard[y][x] != board[y][x]) {
                    isMoved = true;
                }

                board[y][x] = movedBoard[y][x];
            }
        }

        if (isMoved) {
            fillRandomTile();
        }
    }

    void sortUp() {
        for (int x = 0; x < movedBoard.length; x++) {
            // index 1
            if (movedBoard[0][x] == 0 && movedBoard[1][x] != 0) {
                movedBoard[0][x] = movedBoard[1][x];
                movedBoard[1][x] = 0;
                // isMovementDone = true;
            }

            // index 2

            if (movedBoard[0][x] == 0 && movedBoard[1][x] == 0 && movedBoard[2][x] != 0) {
                movedBoard[0][x] = movedBoard[2][x];
                movedBoard[2][x] = 0;
            }

            if (movedBoard[0][x] != 0 && movedBoard[1][x] == 0 && movedBoard[2][x] != 0) {
                movedBoard[1][x] = movedBoard[2][x];
                movedBoard[2][x] = 0;
            }

            if (movedBoard[0][x] == 0 && movedBoard[1][x] != 0 && movedBoard[2][x] != 0) {
                movedBoard[1][x] = movedBoard[2][x];
                movedBoard[2][x] = 0;
            }

            // index 3
            if (movedBoard[0][x] == 0 && movedBoard[1][x] == 0 && movedBoard[2][x] == 0 && movedBoard[3][x] != 0) {
                movedBoard[0][x] = movedBoard[3][x];
                movedBoard[3][x] = 0;
            }

            if (movedBoard[0][x] != 0 && movedBoard[1][x] == 0 && movedBoard[2][x] == 0 && movedBoard[3][x] != 0) {
                movedBoard[1][x] = movedBoard[3][x];
                movedBoard[3][x] = 0;
            }

            if (movedBoard[0][x] == 0 && movedBoard[1][x] != 0 && movedBoard[2][x] == 0 && movedBoard[3][x] != 0) {
                movedBoard[1][x] = movedBoard[3][x];
                movedBoard[3][x] = 0;
            }

            if (movedBoard[0][x] == 0 && movedBoard[1][x] == 0 && movedBoard[2][x] != 0 && movedBoard[3][x] != 0) {
                movedBoard[1][x] = movedBoard[3][x];
                movedBoard[3][x] = 0;
            }

            if (movedBoard[0][x] != 0 && movedBoard[1][x] != 0 && movedBoard[2][x] == 0 && movedBoard[3][x] != 0) {
                movedBoard[2][x] = movedBoard[3][x];
                movedBoard[3][x] = 0;
            }

            if (movedBoard[0][x] != 0 && movedBoard[1][x] == 0 && movedBoard[2][x] != 0 && movedBoard[3][x] != 0) {
                movedBoard[2][x] = movedBoard[3][x];
                movedBoard[3][x] = 0;
            }

            if (movedBoard[0][x] == 0 && movedBoard[1][x] != 0 && movedBoard[2][x] != 0 && movedBoard[3][x] != 0) {
                movedBoard[2][x] = movedBoard[3][x];
                movedBoard[3][x] = 0;
            }
        }
    }

    void moveUp() {
        boolean isMoved = false;

        for (int y = 0; y <board.length; y++) {
            for (int x = 0; x < board.length; x++) {
                movedBoard[y][x] = board[y][x];
            }
        }
        
        for (int x = 0; x < board.length; x++) {
            // 1 1 0 0
            if (board[0][x] == board[1][x] && board[0][x] != 0 && board[1][x] != 0) {
                movedBoard[0][x]++;
                movedBoard[1][x] = 0;
            }
            // x 1 1 0
            if (board[0][x] != board[1][x] && board[1][x] == board[2][x] && board[1][x] != 0 && board[2][x] != 0) {
                movedBoard[1][x]++;
                movedBoard[2][x] = 0;
            }

            // x y 1 1
            if (board[2][x] == board[3][x] && board[2][x] != 0 && board[3][x] != 0) {
                movedBoard[2][x]++;
                movedBoard[3][x] = 0;
            }

            if (board[0][x] == board[2][x] && board[1][x] == 0 && board[0][x] != 0 && board[2][x] != 0) {
                movedBoard[0][x]++;
                movedBoard[2][x] = 0;
            }

            if (board[0][x] == board[3][x] && board[1][x] == 0 && board[2][x] == 0 && board[0][x] != 0 && board[3][x] != 0) {
                movedBoard[0][x]++;
                movedBoard[3][x] = 0;
            }

            if (board[1][x] == board[3][x] && board[2][x] == 0 && board[1][x] != 0 && board[3][x] != 0) {
                movedBoard[1][x]++;
                movedBoard[3][x] = 0;
            }
        }
        
        for (int x = 0; x <movedBoard.length; x++) {
            if (movedBoard[0][x] == 0 && (movedBoard[1][x] != 0 || movedBoard[2][x] != 0 || movedBoard[3][x] != 0)) {
                sortUp();
                break;
            }

            if (movedBoard[1][x] == 0 && (movedBoard[2][x] != 0 || movedBoard[3][x] != 0)) {
                sortUp();
                break;
            }

            if (movedBoard[2][x] == 0 && movedBoard[3][x] != 0) {
                sortUp();
                break;
            }
        }

        for (int y = 0; y <board.length; y++) {
            for (int x = 0; x < board.length; x++) {
                if (movedBoard[y][x] != board[y][x]) {
                    isMoved = true;
                }

                board[y][x] = movedBoard[y][x];
            }
        }

        if (isMoved) {
            fillRandomTile();
        }
    }
    
    void sortDown() {
        for (int x = 0; x < movedBoard.length; x++) {
            // index 1
            if (movedBoard[3][x] == 0 && movedBoard[2][x] != 0) {
                movedBoard[3][x] = movedBoard[2][x];
                movedBoard[2][x] = 0;
            }

            // index 2

            if (movedBoard[3][x] == 0 && movedBoard[2][x] == 0 && movedBoard[1][x] != 0) {
                movedBoard[3][x] = movedBoard[1][x];
                movedBoard[1][x] = 0;
            }

            if (movedBoard[3][x] != 0 && movedBoard[2][x] == 0 && movedBoard[1][x] != 0) {
                movedBoard[2][x] = movedBoard[1][x];
                movedBoard[1][x] = 0;
            }

            if (movedBoard[3][x] == 0 && movedBoard[2][x] != 0 && movedBoard[1][x] != 0) {
                movedBoard[2][x] = movedBoard[1][x];
                movedBoard[1][x] = 0;
            }

            // index 3
            if (movedBoard[3][x] == 0 && movedBoard[2][x] == 0 && movedBoard[1][x] == 0 && movedBoard[0][x] != 0) {
                movedBoard[3][x] = movedBoard[0][x];
                movedBoard[0][x] = 0;
            }

            if (movedBoard[3][x] != 0 && movedBoard[2][x] == 0 && movedBoard[1][x] == 0 && movedBoard[0][x] != 0) {
                movedBoard[2][x] = movedBoard[0][x];
                movedBoard[0][x] = 0;
            }

            if (movedBoard[3][x] == 0 && movedBoard[2][x] != 0 && movedBoard[1][x] == 0 && movedBoard[0][x] != 0) {
                movedBoard[2][x] = movedBoard[0][x];
                movedBoard[0][x] = 0;
            }

            if (movedBoard[3][x] == 0 && movedBoard[2][x] == 0 && movedBoard[1][x] != 0 && movedBoard[0][x] != 0) {
                movedBoard[2][x] = movedBoard[0][x];
                movedBoard[0][x] = 0;
            }

            if (movedBoard[3][x] != 0 && movedBoard[2][x] != 0 && movedBoard[1][x] == 0 && movedBoard[0][x] != 0) {
                movedBoard[1][x] = movedBoard[0][x];
                movedBoard[0][x] = 0;
            }

            if (movedBoard[3][x] != 0 && movedBoard[2][x] == 0 && movedBoard[1][x] != 0 && movedBoard[0][x] != 0) {
                movedBoard[1][x] = movedBoard[0][x];
                movedBoard[0][x] = 0;
            }

            if (movedBoard[3][x] == 0 && movedBoard[2][x] != 0 && movedBoard[1][x] != 0 && movedBoard[0][x] != 0) {
                movedBoard[1][x] = movedBoard[0][x];
                movedBoard[0][x] = 0;
            }
        }
    }

    void moveDown() {
        boolean isMoved = false;

        for (int y = 0; y <board.length; y++) {
            for (int x = 0; x < board.length; x++) {
                movedBoard[y][x] = board[y][x];
            }
        }
        for (int x = 0; x < board.length; x++) {
            // 1 1 0 0
            if (board[3][x] == board[2][x] && board[3][x] != 0 && board[2][x] != 0) {
                movedBoard[3][x]++;
                movedBoard[2][x] = 0;
            }
            // x 1 1 0
            if (board[3][x] != board[2][x] && board[2][x] == board[1][x] && board[2][x] != 0 && board[1][x] != 0) {
                movedBoard[2][x]++;
                movedBoard[1][x] = 0;
            }

            // x y 1 1
            if (board[1][x] == board[0][x] && board[1][x] != 0 && board[0][x] != 0) {
                movedBoard[1][x]++;
                movedBoard[0][x] = 0;
            }

            if (board[3][x] == board[1][x] && board[2][x] == 0 && board[3][x] != 0 && board[1][x] != 0) {
                movedBoard[3][x]++;
                movedBoard[1][x] = 0;
            }

            if (board[3][x] == board[0][x] && board[2][x] == 0 && board[1][x] == 0 && board[3][x] != 0 && board[0][x] != 0) {
                movedBoard[3][x]++;
                movedBoard[0][x] = 0;
            }

            if (board[2][x] == board[0][x] && board[1][x] == 0 && board[2][x] != 0 && board[0][x] != 0) {
                movedBoard[2][x]++;
                movedBoard[0][x] = 0;
            }
        }

        for (int x = 0; x <movedBoard.length; x++) {
            if (movedBoard[3][x] == 0 && (movedBoard[2][x] != 0 || movedBoard[1][x] != 0 || movedBoard[0][x] != 0)) {
                sortDown();
                break;
            }

            if (movedBoard[2][x] == 0 && (movedBoard[1][x] != 0 || movedBoard[0][x] != 0)) {
                sortDown();
                break;
            }

            if (movedBoard[1][x] == 0 && movedBoard[0][x] != 0) {
                sortDown();
                break;
            }
        }

        for (int y = 0; y <board.length; y++) {
            for (int x = 0; x < board.length; x++) {
                if (movedBoard[y][x] != board[y][x]) {
                    isMoved = true;
                }

                board[y][x] = movedBoard[y][x];
            }
        }

        if (isMoved) {
            fillRandomTile();
        }
    }

    void fillRandomTile() {
        ArrayList<Integer> emptyCells = new ArrayList<>();

        for (int y = 0; y < board.length; y++) {
            for (int x = 0; x < board.length; x++) {
                if (board[y][x] == 0) {
                    emptyCells.add((y * 4) + x);
                }
            }
        }

        int randomIndex = (int) random(emptyCells.size());
        board[emptyCells.get(randomIndex) / 4][emptyCells.get(randomIndex) % 4] = 1;
    }

    void fillRandomTile(int maxRandomTiles, int maxNumberTiles) {
        
        ArrayList<Integer> emptyCells;

        for (int i = 0; i < maxNumberTiles; i++) {
            emptyCells = new ArrayList<>();

            for (int y = 0; y < board.length; y++) {
                for (int x = 0; x < board.length; x++) {
                    if (board[y][x] == 0) {
                        emptyCells.add((y * 4) + x);
                    }
                }
            }

            int randomIndex = (int) random(emptyCells.size());
            int randomValue = (int) random(maxRandomTiles) + 1;

            board[emptyCells.get(randomIndex) / 4][emptyCells.get(randomIndex) % 4] = randomValue;
        }
    }

    void checkTarget() {
        for (int y = 0; y < board.length; y++) {
            for (int x = 0; x < board.length; x++) {
                if (board[y][x] >= targetValue) {
                    characters.displaySentenceCentre("YOU WIN",width / 2, height / 2, 10, #ffa500);

                    if (savedTime == 0) {
                        savedTime = millis();
                    }

                    if (millis() - savedTime > totalTime) {
                        level++;
                        sink = new Sink(width - 200, 100, 100, height - 200, gameTimer);
                        gameWindow = new GameWindow();
                    }
                }
            }
        }
    }
}
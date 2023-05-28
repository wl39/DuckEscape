final class Tile {
    int[][] singleTile = {
        {2, 1, 1, 1, 2, 1, 1, 1, 2, 0, 0, 2},
        {0, 0, 2, 1, 1, 1, 2, 0, 1, 2, 1, 0},
        {2, 0, 1, 2, 2, 0, 1, 0, 1, 2, 0, 1},
        {0, 2, 2, 0, 1, 1, 0, 2, 0, 0, 1, 0},

        {0, 1, 1, 0, 1, 1, 2, 1, 1, 2, 1, 2},
        {2, 0 ,2, 1, 1, 2, 1, 1, 0, 1, 2, 1},
        {0, 2, 1, 2, 0, 1, 2, 0, 2, 0, 1, 2},
        {1, 0, 0, 2, 2, 0, 0, 2, 2, 0, 2, 1},

        {0, 2, 1, 0, 0, 2, 1, 0, 1, 2, 1, 2},
        {2, 0, 0, 2, 1, 0, 0, 2, 0, 1, 0, 1},
        {1, 0, 1, 0, 2, 1, 2, 0, 0, 2, 1, 2},
        {1, 2, 0, 2, 0, 1, 2, 1, 2, 0, 0, 0},
    };

    //3681A1 2 
    //5E93AC 1
    //84A6B7 0
    float width, height, tileWidth, tileHeight, pixelSize;

    Tile(float width, float height, float tileSize) {
        this.width = width;
        this.height = height;

        tileWidth = tileSize;
        tileHeight = tileSize;
        pixelSize = tileSize / 12;
    }

    void draw() {
        for (int x = 0; x < width; x += tileWidth) {
            for (int y = 0; y < height; y += tileHeight) {
                for (int column = 0; column < singleTile.length; column++) {
                    for (int row = 0; row < singleTile[column].length; row++) {
                        switch(singleTile[column][row]) {
                            case 0:
                                fill(#84A6B7, 50);
                                break;
                            case 1:
                                fill(#5E93AC, 50);
                                break;
                            default:
                                fill(#3681A1, 50);
                                break;
                        }

                        rect(x + row * pixelSize, y + column * pixelSize, pixelSize, pixelSize);
                    }
                }
            }
        }
    }
}
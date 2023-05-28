final class DuckEmotion {
    int[][] speechBubbleExBottom = { // 15 x 13
        {0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0}, //0
        {0, 1, 5, 5, 5, 5, 5, 5, 5, 5, 5, 1, 0}, //1
        {1, 5, 5, 5, 5, 2, 2, 2, 5, 5, 5, 5, 1}, // 2
        {1, 5, 5, 5, 5, 2, 2, 2, 5, 5, 5, 5, 1},
        {1, 5, 5, 5, 5, 2, 2, 2, 5, 5, 5, 5, 1},
        {1, 5, 5, 5, 5, 2, 2, 2, 5, 5, 5, 5, 1},
        {1, 5, 5, 5, 5, 2, 2, 2, 5, 5, 5, 5, 1},
        {1, 5, 5, 5, 5, 2, 2, 2, 5, 5, 5, 5, 1},
        {1, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 1},
        {1, 5, 5, 5, 5, 2, 2, 2, 5, 5, 5, 5, 1},
        {0, 1, 5, 5, 5, 5, 5, 5, 5, 5, 5, 1, 0},
        {0, 0, 1, 1, 1, 5, 5, 1, 1, 1, 1, 0, 0},
        {0, 0, 0, 0, 1, 5, 1, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0},
    };

    int[][] speechBubbleExTop = { // 15 x 13
        {0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 1, 5, 1, 0, 0, 0, 0, 0, 0},
        {0, 0, 1, 1, 1, 5, 5, 1, 1, 1, 1, 0, 0},
        {0, 1, 5, 5, 5, 5, 5, 5, 5, 5, 5, 1, 0},
        {1, 5, 5, 5, 5, 2, 2, 2, 5, 5, 5, 5, 1},
        {1, 5, 5, 5, 5, 2, 2, 2, 5, 5, 5, 5, 1},
        {1, 5, 5, 5, 5, 2, 2, 2, 5, 5, 5, 5, 1},
        {1, 5, 5, 5, 5, 2, 2, 2, 5, 5, 5, 5, 1},
        {1, 5, 5, 5, 5, 2, 2, 2, 5, 5, 5, 5, 1},
        {1, 5, 5, 5, 5, 2, 2, 2, 5, 5, 5, 5, 1},
        {1, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 1},
        {1, 5, 5, 5, 5, 2, 2, 2, 5, 5, 5, 5, 1},
        {0, 1, 5, 5, 5, 5, 5, 5, 5, 5, 5, 1, 0},
        {0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
    };

    int[][] speechBubbleAddTime = { // 15 x 13
        {0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0}, //0
        {0, 1, 5, 5, 5, 5, 5, 5, 5, 5, 5, 1, 0}, //1
        {1, 5, 5, 5, 5, 5, 5, 5, 5, 4, 5, 5, 1}, // 2
        {1, 5, 5, 5, 3, 3, 3, 5, 4, 4, 4, 5, 1}, // 2
        {1, 5, 5, 3, 5, 3, 5, 3, 5, 4, 5, 5, 1}, // 2
        {1, 5, 3, 5, 5, 3, 3, 5, 3, 5, 5, 5, 1}, // 2
        {1, 5, 3, 5, 5, 3, 5, 5, 3, 5, 5, 5, 1}, // 2
        {1, 5, 3, 5, 5, 5, 5, 5, 3, 5, 5, 5, 1}, // 2
        {1, 5, 5, 3, 5, 5, 5, 3, 5, 5, 5, 5, 1}, // 2
        {1, 5, 5, 5, 3, 3, 3, 5, 5, 5, 5, 5, 1}, // 2
        {0, 1, 5, 5, 5, 5, 5, 5, 5, 5, 5, 1, 0},
        {0, 0, 1, 1, 1, 5, 5, 1, 1, 1, 1, 0, 0},
        {0, 0, 0, 0, 1, 5, 1, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0},
    };

    void drawExBottom(float positionX, float positionY, int pixelSize) {
        for (int i = 0; i < speechBubbleExBottom.length; i++) {
            for (int j = 0; j < speechBubbleExBottom[i].length; j++) {
                switch(speechBubbleExBottom[i][j]) {
                    case 1:
                        fill(#000000);
                        break;
                    case 2:
                        fill(#D24944); 
                        break;
                    case 5:
                        fill(#FFFFFF); 
                        break;
                    default:
                        continue;
                }
                
                rect(positionX + (j * pixelSize), positionY + (i * pixelSize), pixelSize, pixelSize);
            }
        }
    }

    void drawExTop(float positionX, float positionY, int pixelSize) {
        for (int i = 0; i < speechBubbleExTop.length; i++) {
            for (int j = 0; j < speechBubbleExTop[i].length; j++) {
                switch(speechBubbleExTop[i][j]) {
                    case 1:
                        fill(#000000);
                        break;
                    case 2:
                        fill(#D24944); 
                        break;
                    case 5:
                        fill(#FFFFFF); 
                        break;
                    default:
                        continue;
                }
                
                rect(positionX + (j * pixelSize), positionY + (i * pixelSize), pixelSize, pixelSize);
            }
        }
    }

    void drawAddTime(float positionX, float positionY, int pixelSize) {
        for (int i = 0; i < speechBubbleAddTime.length; i++) {
            for (int j = 0; j < speechBubbleAddTime[i].length; j++) {
                switch(speechBubbleAddTime[i][j]) {
                    case 1:
                        fill(#000000);
                        break;
                    case 3:
                        fill(#FFD801); 
                        break;
                    case 4:
                        fill(#3DEC55); 
                        break;
                    case 5:
                        fill(#FFFFFF); 
                        break;
                    default:
                        continue;
                }
                
                rect(positionX + (j * pixelSize), positionY + (i * pixelSize), pixelSize, pixelSize);
            }
        }
    }
}
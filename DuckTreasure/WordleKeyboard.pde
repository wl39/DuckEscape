final class WordleKeyboard {
    // qwertyuiop // 10
    // asdfghjkl //9
    // zxcvbnm // 7
    HashMap<Character, Integer> keyMap = new HashMap<>();

    WordleKeyboard() {
        keyMap.put('A', 0);
        keyMap.put('B', 0);
        keyMap.put('C', 0);
        keyMap.put('D', 0);
        keyMap.put('E', 0);
        keyMap.put('F', 0);
        keyMap.put('G', 0);
        keyMap.put('H', 0);
        keyMap.put('I', 0);
        keyMap.put('J', 0);
        keyMap.put('G', 0);
        keyMap.put('K', 0);
        keyMap.put('L', 0);
        keyMap.put('M', 0);
        keyMap.put('N', 0);
        keyMap.put('O', 0);
        keyMap.put('P', 0);
        keyMap.put('Q', 0);
        keyMap.put('R', 0);
        keyMap.put('S', 0);
        keyMap.put('T', 0);
        keyMap.put('U', 0);
        keyMap.put('V', 0);
        keyMap.put('W', 0);
        keyMap.put('X', 0);
        keyMap.put('Y', 0);
        keyMap.put('Z', 0);
        keyMap.put('a', 0);
        keyMap.put('b', 0);
        keyMap.put('c', 0);
        keyMap.put('d', 0);
        keyMap.put('e', 0);
        keyMap.put('f', 0);
        keyMap.put('g', 0);
        keyMap.put('h', 0);
        keyMap.put('i', 0);
        keyMap.put('j', 0);
        keyMap.put('g', 0);
        keyMap.put('k', 0);
        keyMap.put('l', 0);
        keyMap.put('m', 0);
        keyMap.put('n', 0);
        keyMap.put('o', 0);
        keyMap.put('p', 0);
        keyMap.put('q', 0);
        keyMap.put('r', 0);
        keyMap.put('s', 0);
        keyMap.put('t', 0);
        keyMap.put('u', 0);
        keyMap.put('v', 0);
        keyMap.put('w', 0);
        keyMap.put('x', 0);
        keyMap.put('y', 0);
        keyMap.put('z', 0);
    }
                            
    void draw () {
        if (keyMap.get('Q') == 0 || keyMap.get('q') == 0) {
            fill(#3681A1, 200);
        } if (keyMap.get('Q') == 1 || keyMap.get('q') == 1) {
            fill(#B49F3A);
        } if ((keyMap.get('Q') == 2 || keyMap.get('q') == 2)) {
            fill(#538D4E);
        } 
        
        if (keyMap.get('Q') == 3 || keyMap.get('q') == 3) {
            fill(#000000, 80);;
        }

       
        rect( 3 * ((width - 400) / 4) - 320 , height / 2 - 160, 70, 100);
        characters.displaySentenceCentre("Q",  3 * ((width - 400) / 4) - 280,  height / 2 - 130, 10, #FFFFFF);

        if (keyMap.get('W') == 0 || keyMap.get('w') == 0) {
            fill(#3681A1, 200);
        } if (keyMap.get('W') == 1 || keyMap.get('w') == 1) {
            fill(#B49F3A);
        } if (keyMap.get('W') == 2 || keyMap.get('w') == 2) {
            fill(#538D4E);
        } 
        if (keyMap.get('W') == 3 || keyMap.get('w') == 3) {
            fill(#000000, 80);
        }
        rect( 3 * ((width - 400) / 4) - 240 , height / 2 - 160, 70, 100);
        characters.displaySentenceCentre("W",  3 * ((width - 400) / 4) - 200,  height / 2 - 130, 10, #FFFFFF);


        if (keyMap.get('E') == 0 || keyMap.get('e') == 0) {
            fill(#3681A1, 200);
        } 
        if (keyMap.get('E') == 1 || keyMap.get('e') == 1) {
            fill(#B49F3A);
        } 
        if (keyMap.get('E') == 2 || keyMap.get('e') == 2) {
            fill(#538D4E);
        } 
        if ((keyMap.get('E') == 3 || keyMap.get('e') == 3)) {
            fill(#000000, 80);
        }
        rect( 3 * ((width - 400) / 4) - 160 , height / 2 - 160, 70, 100);
        characters.displaySentenceCentre("E",  3 * ((width - 400) / 4) - 120,  height / 2 - 130, 10, #FFFFFF);

        if (keyMap.get('R') == 0 || keyMap.get('r') == 0) {
            fill(#3681A1, 200);
        } if (keyMap.get('R') == 1 || keyMap.get('r') == 1) {
            fill(#B49F3A);
        } if ((keyMap.get('R') == 2 || keyMap.get('r') == 2)) {
            fill(#538D4E);
        } 
        if ((keyMap.get('R') == 3 || keyMap.get('r') == 3)) {
            fill(#000000, 80);
        }
        rect( 3 * ((width - 400) / 4) - 80 , height / 2 - 160, 70, 100);
        characters.displaySentenceCentre("R",  3 * ((width - 400) / 4) - 40,  height / 2 - 130, 10, #FFFFFF);

        if (keyMap.get('T') == 0 || keyMap.get('t') == 0) {
            fill(#3681A1, 200);
        } if (keyMap.get('T') == 1 || keyMap.get('t') == 1) {
            fill(#B49F3A);
        } if ((keyMap.get('T') == 2 || keyMap.get('t') == 2)) {
            fill(#538D4E);
        } 
        
        if ((keyMap.get('T') == 3 || keyMap.get('t') == 3)) {
            fill(#000000, 80);
        }
        rect( 3 * ((width - 400) / 4) , height / 2 - 160, 70, 100); // 5
        characters.displaySentenceCentre("T",  3 * ((width - 400) / 4) + 40,  height / 2 - 130, 10, #FFFFFF);

        if (keyMap.get('Y') == 0 || keyMap.get('y') == 0) {
            fill(#3681A1, 200);
        } if (keyMap.get('Y') == 1 || keyMap.get('y') == 1) {
            fill(#B49F3A);
        } if ((keyMap.get('Y') == 2 || keyMap.get('y') == 2)) {
            fill(#538D4E);
        } 
        if (keyMap.get('Y') == 3 || keyMap.get('y') == 3) {
            fill(#000000, 80);
        }
        rect( 3 * ((width - 400) / 4) + 80 , height / 2 - 160, 70, 100);
        characters.displaySentenceCentre("Y",  3 * ((width - 400) / 4) + 120,  height / 2 - 130, 10, #FFFFFF);

        if (keyMap.get('U') == 0 || keyMap.get('u') == 0) {
            fill(#3681A1, 200);
        } if (keyMap.get('U') == 1 || keyMap.get('u') == 1) {
            fill(#B49F3A);
        } if ((keyMap.get('U') == 2 || keyMap.get('u') == 2)) {
            fill(#538D4E);
        } 
        if ((keyMap.get('U') == 3 || keyMap.get('u') == 3)) {
            fill(#000000, 80);
        }
        rect( 3 * ((width - 400) / 4) + 160 , height / 2 - 160, 70, 100);
        characters.displaySentenceCentre("U",  3 * ((width - 400) / 4) + 200,  height / 2 - 130, 10, #FFFFFF);

        if (keyMap.get('I') == 0 || keyMap.get('i') == 0) {
            fill(#3681A1, 200);
        } if (keyMap.get('I') == 1 || keyMap.get('i') == 1) {
            fill(#B49F3A);
        } if ((keyMap.get('I') == 2 || keyMap.get('i') == 2)) {
            fill(#538D4E);
        } if ((keyMap.get('I') == 3 || keyMap.get('i') == 3)) {
            fill(#000000, 80);
        }
        rect( 3 * ((width - 400) / 4) + 240 , height / 2 - 160, 70, 100);
        characters.displaySentenceCentre("I",  3 * ((width - 400) / 4) + 280,  height / 2 - 130, 10, #FFFFFF);

        if (keyMap.get('O') == 0 || keyMap.get('o') == 0) {
            fill(#3681A1, 200);
        } if (keyMap.get('O') == 1 || keyMap.get('o') == 1) {
            fill(#B49F3A);
        } if ((keyMap.get('O') == 2 || keyMap.get('o') == 2)) {
            fill(#538D4E);
        } if ((keyMap.get('O') == 3 || keyMap.get('o') == 3)) {
            fill(#000000, 80);
        }
        rect( 3 * ((width - 400) / 4) + 320 , height / 2 - 160, 70, 100);
        characters.displaySentenceCentre("O",  3 * ((width - 400) / 4) + 360,  height / 2 - 130, 10, #FFFFFF);

        if (keyMap.get('P') == 0 || keyMap.get('p') == 0) {
            fill(#3681A1, 200);
        } if (keyMap.get('P') == 1 || keyMap.get('p') == 1) {
            fill(#B49F3A);
        } if ((keyMap.get('P') == 2 || keyMap.get('p') == 2)) {
            fill(#538D4E);
        } 
        if ((keyMap.get('P') == 3 || keyMap.get('p') == 3)) {
            fill(#000000, 80);
        }
        rect( 3 * ((width - 400) / 4) + 400 , height / 2 - 160, 70, 100); // 5
        characters.displaySentenceCentre("P",  3 * ((width - 400) / 4) + 440,  height / 2 - 130, 10, #FFFFFF);




        if (keyMap.get('A') == 0 || keyMap.get('a') == 0) {
            fill(#3681A1, 200);
        } if (keyMap.get('A') == 1 || keyMap.get('a') == 1) {
            fill(#B49F3A);
        } if ((keyMap.get('A') == 2 || keyMap.get('a') == 2)) {
            fill(#538D4E);
        } 
        if ((keyMap.get('A') == 3 || keyMap.get('a') == 3)) {
            fill(#000000, 80);
        }
        rect( 3 * ((width - 400) / 4) - 280 , height / 2 - 50, 70, 100);
        characters.displaySentenceCentre("A",  3 * ((width - 400) / 4) - 240,  height / 2 - 20, 10, #FFFFFF);

        if (keyMap.get('S') == 0 || keyMap.get('s') == 0) {
            fill(#3681A1, 200);
        } if (keyMap.get('S') == 1 || keyMap.get('s') == 1) {
            fill(#B49F3A);
        } if ((keyMap.get('S') == 2 || keyMap.get('s') == 2)) {
            fill(#538D4E);
        } 
        if ((keyMap.get('S') == 3 || keyMap.get('s') == 3)) {
            fill(#000000, 80);
        }
        rect( 3 * ((width - 400) / 4) - 200 , height / 2 - 50, 70, 100);
        characters.displaySentenceCentre("S",  3 * ((width - 400) / 4) - 160,  height / 2 - 20, 10, #FFFFFF);

        if (keyMap.get('D') == 0 || keyMap.get('d') == 0) {
            fill(#3681A1, 200);
        } if (keyMap.get('D') == 1 || keyMap.get('d') == 1) {
            fill(#B49F3A);
        } if ((keyMap.get('D') == 2 || keyMap.get('d') == 2)) {
            fill(#538D4E);
        } 
        if ((keyMap.get('D') == 3 || keyMap.get('d') == 3)) {
            fill(#000000, 80);
        }
        rect( 3 * ((width - 400) / 4) - 120 , height / 2 - 50, 70, 100);
        characters.displaySentenceCentre("D",  3 * ((width - 400) / 4) - 80,  height / 2 - 20, 10, #FFFFFF);

        if (keyMap.get('F') == 0 || keyMap.get('f') == 0) {
            fill(#3681A1, 200);
        } if (keyMap.get('F') == 1 || keyMap.get('f') == 1) {
            fill(#B49F3A);
        } if ((keyMap.get('F') == 2 || keyMap.get('f') == 2)) {
            fill(#538D4E);
        } 
        if ((keyMap.get('F') == 3 || keyMap.get('f') == 3)) {
            fill(#000000, 80);
        }
        rect( 3 * ((width - 400) / 4) - 40 , height / 2 - 50, 70, 100);
        characters.displaySentenceCentre("F",  3 * ((width - 400) / 4),  height / 2 - 20, 10, #FFFFFF);

        if (keyMap.get('G') == 0 || keyMap.get('g') == 0) {
            fill(#3681A1, 200);
        } if (keyMap.get('G') == 1 || keyMap.get('g') == 1) {
            fill(#B49F3A);
        } if ((keyMap.get('G') == 2 || keyMap.get('g') == 2)) {
            fill(#538D4E);
        } 
        if ((keyMap.get('G') == 3 || keyMap.get('g') == 3)) {
            fill(#000000, 80);
        }
        rect( 3 * ((width - 400) / 4) + 40, height / 2 - 50, 70, 100); // 5
        characters.displaySentenceCentre("G",  3 * ((width - 400) / 4) + 80,  height / 2 - 20, 10, #FFFFFF);

        if (keyMap.get('H') == 0 || keyMap.get('h') == 0) {
            fill(#3681A1, 200);
        } if (keyMap.get('H') == 1 || keyMap.get('h') == 1) {
            fill(#B49F3A);
        } if ((keyMap.get('H') == 2 || keyMap.get('h') == 2)) {
            fill(#538D4E);
        } 
        if ((keyMap.get('H') == 3 || keyMap.get('h') == 3)) {
            fill(#000000, 80);
        }
        rect( 3 * ((width - 400) / 4) + 120 , height / 2 - 50, 70, 100);
        characters.displaySentenceCentre("H",  3 * ((width - 400) / 4) + 160,  height / 2 - 20, 10, #FFFFFF);

        if (keyMap.get('J') == 0 || keyMap.get('j') == 0) {
            fill(#3681A1, 200);
        } if (keyMap.get('J') == 1 || keyMap.get('j') == 1) {
            fill(#B49F3A);
        } if ((keyMap.get('J') == 2 || keyMap.get('j') == 2)) {
            fill(#538D4E);
        } 
        if ((keyMap.get('J') == 3 || keyMap.get('j') == 3)) {
            fill(#000000, 80);
        }
        rect( 3 * ((width - 400) / 4) + 200 , height / 2 - 50, 70, 100);
        characters.displaySentenceCentre("J",  3 * ((width - 400) / 4) + 240,  height / 2 - 20, 10, #FFFFFF);

        if (keyMap.get('K') == 0 || keyMap.get('k') == 0) {
            fill(#3681A1, 200);
        } if (keyMap.get('K') == 1 || keyMap.get('k') == 1) {
            fill(#B49F3A);
        } if ((keyMap.get('K') == 2 || keyMap.get('k') == 2)) {
            fill(#538D4E);
        } 
        if ((keyMap.get('K') == 3 || keyMap.get('k') == 3)) {
            fill(#000000, 80);
        }
        rect( 3 * ((width - 400) / 4) + 280 , height / 2 - 50, 70, 100);
        characters.displaySentenceCentre("K",  3 * ((width - 400) / 4) + 320,  height / 2 - 20, 10, #FFFFFF);

        if (keyMap.get('L') == 0 || keyMap.get('l') == 0) {
            fill(#3681A1, 200);
        } if (keyMap.get('L') == 1 || keyMap.get('l') == 1) {
            fill(#B49F3A);
        } if ((keyMap.get('L') == 2 || keyMap.get('l') == 2)) {
            fill(#538D4E);
        } 
        if ((keyMap.get('L') == 3 || keyMap.get('l') == 3)) {
            fill(#000000, 80);
        }
        rect( 3 * ((width - 400) / 4) + 360 , height / 2 - 50, 70, 100);
        characters.displaySentenceCentre("L",  3 * ((width - 400) / 4) + 400,  height / 2 - 20, 10, #FFFFFF);

        


        if (keyMap.get('Z') == 0 || keyMap.get('z') == 0) {
            fill(#3681A1, 200);
        } if (keyMap.get('Z') == 1 || keyMap.get('z') == 1) {
            fill(#B49F3A);
        } if ((keyMap.get('Z') == 2 || keyMap.get('z') == 2)) {
            fill(#538D4E);
        } 
        if ((keyMap.get('Z') == 3 || keyMap.get('z') == 3)) {
            fill(#000000, 80);
        }
        rect( 3 * ((width - 400) / 4) - 260 , height / 2 + 60, 70, 100);
        characters.displaySentenceCentre("Z",  3 * ((width - 400) / 4) - 220,  height / 2 + 90, 10, #FFFFFF);

        if (keyMap.get('X') == 0 || keyMap.get('x') == 0) {
            fill(#3681A1, 200);
        } if (keyMap.get('X') == 1 || keyMap.get('x') == 1) {
            fill(#B49F3A);
        } if ((keyMap.get('X') == 2 || keyMap.get('x') == 2)) {
            fill(#538D4E);
        } 
        if ((keyMap.get('X') == 3 || keyMap.get('x') == 3)) {
            fill(#000000, 80);
        }
        rect( 3 * ((width - 400) / 4) - 180 , height / 2 + 60, 70, 100);
        characters.displaySentenceCentre("X",  3 * ((width - 400) / 4) - 140,  height / 2 + 90, 10, #FFFFFF);

        if (keyMap.get('C') == 0 || keyMap.get('c') == 0) {
            fill(#3681A1, 200);
        } if (keyMap.get('C') == 1 || keyMap.get('c') == 1) {
            fill(#B49F3A);
        } if ((keyMap.get('C') == 2 || keyMap.get('c') == 2)) {
            fill(#538D4E);
        } 
        if ((keyMap.get('C') == 3 || keyMap.get('c') == 3)) {
            fill(#000000, 80);
        }
        rect( 3 * ((width - 400) / 4) - 100 , height / 2 + 60, 70, 100);
        characters.displaySentenceCentre("C",  3 * ((width - 400) / 4) - 60,  height / 2 + 90, 10, #FFFFFF);

        if (keyMap.get('V') == 0 || keyMap.get('v') == 0) {
            fill(#3681A1, 200);
        } if (keyMap.get('V') == 1 || keyMap.get('v') == 1) {
            fill(#B49F3A);
        } if ((keyMap.get('V') == 2 || keyMap.get('v') == 2)) {
            fill(#538D4E);
        } 
        if ((keyMap.get('V') == 3 || keyMap.get('v') == 3)) {
            fill(#000000, 80);
        }
        rect( 3 * ((width - 400) / 4) - 20 , height / 2 + 60, 70, 100);
        characters.displaySentenceCentre("V",  3 * ((width - 400) / 4) + 20,  height / 2 + 90, 10, #FFFFFF);

        if (keyMap.get('B') == 0 || keyMap.get('b') == 0) {
            fill(#3681A1, 200);
        } if (keyMap.get('B') == 1 || keyMap.get('b') == 1) {
            fill(#B49F3A);
        } if ((keyMap.get('B') == 2 || keyMap.get('b') == 2)) {
            fill(#538D4E);
        } 
        if ((keyMap.get('B') == 3 || keyMap.get('b') == 3)) {
            fill(#000000, 80);
        }
        rect( 3 * ((width - 400) / 4) + 60, height / 2 + 60, 70, 100); // 5
        characters.displaySentenceCentre("B",  3 * ((width - 400) / 4) + 100,  height / 2 + 90, 10, #FFFFFF);

        if (keyMap.get('N') == 0 || keyMap.get('n') == 0) {
            fill(#3681A1, 200);
        } if (keyMap.get('N') == 1 || keyMap.get('n') == 1) {
            fill(#B49F3A);
        } if ((keyMap.get('N') == 2 || keyMap.get('n') == 2)) {
            fill(#538D4E);
        } 
        if ((keyMap.get('N') == 3 || keyMap.get('n') == 3)) {
            fill(#000000, 80);
        }
        rect( 3 * ((width - 400) / 4) + 140 , height / 2 + 60, 70, 100);
        characters.displaySentenceCentre("N",  3 * ((width - 400) / 4) + 180,  height / 2 + 90, 10, #FFFFFF);

        if (keyMap.get('M') == 0 || keyMap.get('m') == 0) {
            fill(#3681A1, 200);
        } if (keyMap.get('M') == 1 || keyMap.get('m') == 1) {
            fill(#B49F3A);
        } if ((keyMap.get('M') == 2 || keyMap.get('m') == 2)) {
            fill(#538D4E);
        } 
        if ((keyMap.get('M') == 3 || keyMap.get('m') == 3)) {
            fill(#000000, 80);
        }
        rect( 3 * ((width - 400) / 4) + 220 , height / 2 + 60, 70, 100);
        characters.displaySentenceCentre("M",  3 * ((width - 400) / 4) + 260,  height / 2 + 90, 10, #FFFFFF);

        // fill(#3681A1, 200);
        // rect( 3 * ((width - 400) / 4) + 190 , height / 2 - 100, 40, 60);

        // fill(#3681A1, 200);
        // rect( 3 * ((width - 400) / 4) + 200 , height / 2 - 100, 40, 60);

        // fill(#3681A1, 200);
        // rect( 3 * ((width - 400) / 4) + 250 , height / 2 - 100, 40, 60); // 5

        // rect();
        // rect();
        // rect();
    }
}
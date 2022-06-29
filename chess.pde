ChessBoard board;
PImage img; 
ArrayList<Pieces> pieces = new ArrayList<Pieces>();
String[] piecesLocation = {"r", "knight", "b", "q", "k", "b", "knight", "r"};
Pieces selected;
void setup() {
    size(1800, 900);
    board = new ChessBoard(135, 135,90);
    for (int i = 0; i < piecesLocation.length; ++i) {
        char c = (char)('A' + i);
        pieces.add(new Pieces(c, 8, piecesLocation[i],"b", board));
        pieces.add(new Pieces(c, 1, piecesLocation[i],"w", board));
        pieces.add(new Pieces(c, 7, "p","b", board));
        pieces.add(new Pieces(c, 2, "p","w", board));
    }
    rectMode(CENTER);
    imageMode(CENTER);
}

void draw() {
    background(0);  
    board.draw();
    if (mousePressed) {
        selected = null;
    }
    for (Pieces p : pieces) {
        p.show();
        if (p.mouseOver() &&  mousePressed) {
            selected = p; 
        }  
        if (selected ==  p) {
            p.showMoves();
        }
    }
}

ChessBoard board;
PImage img; 
ArrayList<Pieces> pieces = new ArrayList<Pieces>();
void setup() {
    size(1800, 900);
    board = new ChessBoard(135, 135,90);
    pieces.add(new Pieces('A', 2, "p", "w", board));
    pieces.add(new Pieces('D', 1, "q", "w", board));
    rectMode(CENTER);
    imageMode(CENTER);
}

void draw() {
    background(0);  
    board.draw();
    for (Pieces p : pieces) {
        p.show();  
    }
}

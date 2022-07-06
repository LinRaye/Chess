ChessBoard board;
PImage img; 
ArrayList<Pieces> pieces = new ArrayList<Pieces>();
String[] piecesLocation = {"r", "knight", "b", "q", "k", "b", "knight", "r"};
ArrayList<Pieces> selectedMoves = new ArrayList<Pieces>();
Pieces selected;
boolean click = false;
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
    for (Pieces s : selectedMoves) {
        s.show();
        if (s.mouseOver() &&  click) {
            selected.position_x = s.position_x;
            selected.position_y = s.position_y;
            selectedMoves.clear();
            selected = null; 
            click = false;
            break;
        }
    }
    if (click) {
        selected = null;
        selectedMoves.clear();
    }
    for (Pieces p : pieces) {
        p.show();
        if (p.mouseOver() &&  click) {
            selected = p;
            selectedMoves.clear();
            selectedMoves.addAll(selected.showMoves());
            click = false;
        }
    }
}
void mouseClicked() {
    click = true;
}

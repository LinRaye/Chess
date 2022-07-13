ChessBoard board;
PImage img; 
ArrayList<Pieces> pieces = new ArrayList<Pieces>();
ArrayList<Pieces> selectedMoves = new ArrayList<Pieces>();
ArrayList<Pieces> selectedAttack = new ArrayList<Pieces>();
Pieces selected;
String[] piecesLocation = {"r", "knight", "b", "q", "k", "b", "knight", "r"};
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
    // decide which square to move to
    for (Pieces s : selectedMoves) {
        s.show();
        if (s.mouseOver() &&  click) {
            selected.position_x = s.position_x;
            selected.position_y = s.position_y;
            selected.moved();
            selectedMoves.clear();
            selected = null; 
            click = false;
            break;
        }
    }
    // click action
    if (click) {
        selected = null;
        selectedMoves.clear();
    }
    for (Pieces p : pieces) {
        p.show();
        if (p.mouseOver() &&  click) {
            selected = p;
            selectedMoves.clear();
            selectedAttack.clear();
            ArrayList<Pieces> z = selected.showMoves();
            for (int i = 0; i < z.size(); i++) {
                Pieces g = z.get(i);
                if (canMove(g)) {
                    selectedMoves.add(g);
                }
            }
            ArrayList<Pieces> h = selected.showAttack();
            for (int i = 0; i < h.size(); i++) {
                Pieces g = h.get(i);
                if (canAttack(g)) {
                    selectedAttack.add(g);
                }
            }
            click = false;
        }
    }
}
void mouseClicked() {
    click = true;
}
boolean canMove(Pieces p) {
    for (int i = 0; i < pieces.size(); i++) {
        Pieces t = pieces.get(i);
        if (p.position_x ==  t.position_x &&  t.position_y ==  p.position_y) {
            return false;
        }    
    }
    return true;
}
boolean canAttack(Pieces p) {
    for (int i = 0; i < pieces.size(); i++) {
        Pieces t = pieces.get(i);
        if (p.position_x ==  t.position_x &&  t.position_y ==  p.position_y) {
            if (t.WB.equals(p.WB) ==  false) {
                return true;
            }
        }    
    }
    return false;
}
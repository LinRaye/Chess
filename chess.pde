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
    for (Pieces p : pieces) {
        p.show();
    }
    // decide which square to move to
    for (Pieces s : selectedMoves) {
        s.show();
        if (s.mouseOver() &&  click) {
            selected.position_x = s.position_x;
            selected.position_y = s.position_y;
            selected.moved();
            selected = null;
            selectedMoves.clear();
            selectedAttack.clear();
            click = false;
            break;
        }
    }
    for (Pieces s : selectedAttack) {
        s.show();
        //System.err.println("s : " + s);
        if (s.mouseOver() &&  click) {
            selected.position_x = s.position_x;
            selected.position_y = s.position_y;
            selected.moved();
            canAttack(s,true);
            selectedAttack.clear();
            selectedMoves.clear();
            selected = null; 
            click = false;
            break;
        }
    }
    for (Pieces p : pieces) {
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
                if (canAttack(g,false)) {
                    selectedAttack.add(g);
                    System.err.println(g);
                } else{
                    // System.err.println("x" + g);
                }
            }
            // System.err.println("________________");
            // System.err.println(selectedAttack);
            // System.err.println("++++++++++++++++");
            click = false;
        }
    }
    // click action
    if (click) {
        selected = null;
        selectedMoves.clear();
        selectedAttack.clear();
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
boolean canAttack(Pieces p, boolean remove) {
    for (int i = 0; i < pieces.size(); i++) {
        Pieces t = pieces.get(i);
        if (t.WB.equals(p.WB)) {
            continue;
        }
        if (p.position_x ==  t.position_x &&  t.position_y ==  p.position_y) {
            // System.err.println("a : " + t);
            if (remove) {
                pieces.remove(i);
            }
            return true;            
        } else if (t.name.equals("p") &&  t.step ==  1 &&  abs(t.position_y - p.position_y) ==  1 && t.position_x ==  p.position_x) {// En passant
            // System.err.println("b0 : " + p);
            // System.err.println("b1 : " + t);
            if (remove) {
                pieces.remove(i);
            }
            return true;
        }    
    }
    return false;
}
PImage img; 
ChessBoard board;
Promote pawnPromote;
ArrayList<Pieces> pieces = new ArrayList<Pieces>();
ArrayList<Pieces> selectedMoves = new ArrayList<Pieces>();
Pieces selected;
Pieces promotePiece;
String[] piecesLocation = {"r", "knight", "b", "q", "k", "b", "knight", "r"};
boolean click = false;
boolean promote = false;
void setup() {
    size(1800, 900);
    board = new ChessBoard(135, 135,90);
    pawnPromote = new Promote(1000, 90);
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
            if (s.name.contains(Pieces.ATTACK_SYMBOL)) {
                canAttack(s,true);// eat    
            }
            // 1. has to be pawn 2. has to move to the end of the chessboard 3. promote
            if (selected.name.equals("p") &&  selected.position_y ==  8) {
                promote = true;
                promotePiece = selected;
            } else if (selected.name.equals("p") &&  selected.position_y ==  1) {
                promote = true;
                promotePiece = selected;
            }
            selected = null;                                                                     
            selectedMoves.clear();                                                                      
            click = false;                                                                      
            break;                                                                      
        }                                                                      
    }
    if (promote ==  true) {
        String c = pawnPromote.draw();
        if (c != null) {
            promotePiece.promoteInto(c);
            promotePiece = null;
            promote = false;
        }
    } else {
        chooseMove();
    }                                                                     
    // click action
    if (click) {
        selected = null;
        selectedMoves.clear();
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
        } else if (t.name.equals("p") &&  t.step ==  1 && t.position_x ==  p.position_x) {// En passant
            if (p.position_y - t.position_y == 1 && p.WB.equals("w")) {
                // red square     enemy position
                if (remove) {
                    pieces.remove(i);
                }
                return true;
            } else if (p.position_y - t.position_y == -1 && p.WB.equals("b")) {
                if (remove) {
                    pieces.remove(i);
                }
                return true;
            }
        }
        
    }
    return false;
}
void chooseMove() {
    for (Pieces p : pieces) {                                                                      
        if (p.mouseOver() &&  click) {
            selected = p;
            selectedMoves.clear();
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
                if (canAttack(g,false)) {// find red square
                    selectedMoves.add(g);
                    // System.err.println(g);
                } else{
                    // System.err.println("x" + g);
                }
            }
            // System.err.println("________________");
            // System.err.println(selectedMove);
            // System.err.println("++++++++++++++++");
            click = false;
        }
    }
}
public class Pieces{
    ChessBoard cb;
    static final String ATTACK_SYMBOL = "@";
    static final String MOVE_SYMBOL = "_";
    String name;
    String WB;
    char position_x;
    int position_y;
    int step;
    PImage img; 
    public Pieces(char position_x, int position_y, String name, String WB, ChessBoard cb) {
        this.step = 0;
        this.position_x = position_x;
        this.position_y = position_y;
        this.name = name;
        this.WB = WB;
        this.cb = cb;
        updateImg();
    }
    public void promoteInto(String p) {
        name = p;
        updateImg();
    }
    public void updateImg() {
        if (this.name.contains(MOVE_SYMBOL) == false &&  this.name.contains(ATTACK_SYMBOL) == false) {
            img = loadImage("icons/" + WB + name + ".png");
        }
    }
    public void show() {
        int[] XY = cb.getXY(this);
        if (img == null) {
            if (this.name.contains(MOVE_SYMBOL)) {
                fill(0);
                circle(XY[0], XY[1], 15);
            } else {
                fill(255, 0, 0);
                rect(XY[0], XY[1], 15, 15);
            }
        } else {
            image(img, XY[0], XY[1], 80, 80);
        }
    }
    public ArrayList<Pieces> showMoves() {
        switch(name) {
            case "p":
                return pawnMoves();
                case"knight":
                break;
            case "b":
                break;
            case "r":
                break;
            case "q":
                break;
            case "k":
                break;
        }
        return new ArrayList<Pieces>();
    }
    public ArrayList<Pieces> showAttack() {
        switch(name) {
            case "p":
                return pawnAttack();
                case"knight":
                break;
            case "b":
                break;
            case "r":
                break;
            case "q":
                break;
            case "k":
                break;
        }
        return new ArrayList<Pieces>();
    }
    public ArrayList<Pieces> pawnMoves() {
        ArrayList<Pieces> ps = new ArrayList<>();
        int sign;
        if (WB.equals("w")) {
            sign = 1;
        } else {
            sign =-  1;
        } 
        // before adding p1, p2 we should check if the square is occupied by other pieces 
        Pieces p1 = new Pieces(position_x, position_y + 1 * sign, name + MOVE_SYMBOL, WB, cb);
        ps.add(p1);
        if (step ==  0) {
            Pieces p2 = new Pieces(position_x, position_y + 2 * sign, name + MOVE_SYMBOL, WB, cb);
            ps.add(p2);
        }
        return ps;
    }
    public ArrayList<Pieces> pawnAttack() {
        ArrayList<Pieces> ps = new ArrayList<>();
        int sign;
        if (WB.equals("w")) {
            sign = 1;
        } else {
            sign =-  1;
        } 
        // before adding p1, p2 we should check if the square is occupied by other pieces 
        Pieces p1 = new Pieces((char)(position_x + 1) , position_y + 1 * sign, name + ATTACK_SYMBOL, WB, cb);
        Pieces p2 = new Pieces((char)(position_x - 1) , position_y + 1 * sign, name + ATTACK_SYMBOL, WB, cb);
        ps.add(p1);
        ps.add(p2);
        return ps;
    }
    // if the mouse is touching the pieces.
    public boolean mouseOver() {
        int[] XY = cb.getXY(this);
        if (dist(XY[0], XY[1], mouseX, mouseY)<cb.size / 2) {
            return true;
        } else{
            return false;
        }
    }
    public void moved() {
        step++;
    }
    public String toString() {
        return "name : " + name + ":" + position_x + position_y;
    }
}
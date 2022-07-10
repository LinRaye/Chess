public class Pieces{
    String name;
    String WB;
    ChessBoard cb;
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
        if (this.name.contains("_") == false) {
            img = loadImage("icons/" + WB + name + ".png");
        }
    }
    public void show() {
        int[] XY = cb.getXY(this);
        if (img == null) {
            circle(XY[0], XY[1], 15);
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
    public ArrayList<Pieces> pawnMoves() {
        ArrayList<Pieces> ps = new ArrayList<>();
        int sign;
        if (WB.equals("w")) {
            sign = 1;
        } else {
            sign =-  1;
        } 
        Pieces p1 = new Pieces(position_x, position_y + 1 * sign, name + "_", WB, cb);
        ps.add(p1);
        if (step ==  0) {
            Pieces p2 = new Pieces(position_x, position_y + 2 * sign, name + "_", WB, cb);
            ps.add(p2);
        }
        return ps;
    }
    /**
    if the mouse is touching the pieces.
    */
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
}
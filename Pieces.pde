public class Pieces{
    String name;
    String WB;
    ChessBoard cb;
    char position_x;
    int position_y; 
    PImage img; 
    public Pieces(char position_x, int position_y, String name, String WB, ChessBoard cb) {
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
        int cx = cb.x + (position_x - 'A') * cb.size;
        int cy = cb.y + (8 - position_y) * cb.size;
        if (img == null) {
            circle(cx, cy, 15);
        } else {
            image(img, cx, cy, 80, 80);
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
        if (WB.equals("w")) {
            Pieces p1 = new Pieces(position_x, position_y + 1, name + "_", WB, cb);
            Pieces p2 = new Pieces(position_x, position_y + 2, name + "_", WB, cb);
            ps.add(p1);
            ps.add(p2);
        } else {
            Pieces p1 = new Pieces(position_x, position_y - 1, name + "_", WB, cb);
            Pieces p2 = new Pieces(position_x, position_y - 2, name + "_", WB, cb);
            ps.add(p1);
            ps.add(p2);
        }
        return ps;
    }
    /**
    if the mouse is touching the pieces.
    */
    public boolean mouseOver() {
        int cx = cb.x + (position_x - 'A') * cb.size;
        int cy = cb.y + (8 - position_y) * cb.size;
        if (dist(cx, cy, mouseX, mouseY)<cb.size / 2) {
            return true;
        } else{
            return false;
        }
        
    }
}

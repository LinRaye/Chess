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
        img = loadImage("icons/" + WB + name + ".png");
    }
    public void show() {    
        int imgx = cb.x + (position_x - 'A') * cb.size;
        int imgy = cb.y + (8 - position_y) * cb.size;
        image(img, imgx, imgy,80,80);
    }
    public void showMoves() {
        switch(name) {
            case "p":
                pawnMoves();
                break;
            case "knight":
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
    }
    public void pawnMoves() {
        if (WB.equals("w")) {
            int cx = cb.x + (position_x - 'A') * cb.size;
            int cy = cb.y + (8 - position_y) * cb.size;
            cy -= cb.size;
            circle(cx, cy, 15);
            cy -= cb.size;
            circle(cx, cy, 15);
        } else {
            int cx = cb.x + (position_x - 'A') * cb.size;
            int cy = cb.y + (8 - position_y) * cb.size;
            cy += cb.size;
            circle(cx, cy, 15);
            cy += cb.size;
            circle(cx, cy, 15);
        }
    }
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

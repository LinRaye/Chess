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
}
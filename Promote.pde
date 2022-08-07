public class Promote {
    int x;
    int y;
    public Promote(int x, int y) {
        this.x = x;
        this.y = y;
    }
    public String draw() {
        rectMode(CORNER);
        fill(0);
        rect(x,y,200 , 100);
        textSize(40);
        fill(255);
        text("Promote into...",x + 30,y + 50);
        text("Queen (press Q)",x + 30,y + 140);
        text("Rook (press R)",x + 30,y + 230);
        text("Bishop (press B)",x + 30,y + 320);
        text("Knight (press K)",x + 30,y + 410);
        rectMode(CENTER);
        if (keyPressed == true) {
            System.out.println("keyCode:" + keyCode);
            text(key,x + 30,y + 500);
            if (key ==  'q' ||  key ==  'Q') {
                return "q";
            } else if (key ==  'r' ||  key ==  'R') {
                return "r";
            } else if (key ==  'b' ||  key ==  'B') {
                return "b";
            } else if (key ==  'k' ||  key ==  'K') {
                return "knight";
            }
        }
        return null;
    }
}
public class ChessBoard {
    int x;
    int y;
    int size;
    public ChessBoard(int x, int y, int size) {
        this.x = x;
        this.y = y;
        this.size = size;
    }
    public void draw() {
        int mx = x;
        int my = y;
        for (int i = 0; i < 8; ++i) {
            for (int j = 0; j < 8; ++j) {
                if ((i + j) % 2 ==  0) {
                    fill(118, 150, 86);
                    rect(mx, my, size, size);
                } else {
                    fill(255, 255, 255);
                    rect(mx, my, size, size);
                }
                mx += size;
            }
            my += size;
            mx = x;
        }
    }
}

ChessBoard board;
void setup() {
    size(1800, 900);
    board = new ChessBoard(90, 90,90);
}

void draw() {
    background(0);
    board.draw();
}

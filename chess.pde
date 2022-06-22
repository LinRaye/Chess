ChessBoard board;
PImage img; 
void setup() {
    size(1800, 900);
    board = new ChessBoard(90, 90,90);
    img = loadImage("icons/wp.png");
}

void draw() {
    background(0);  
    board.draw();
    image(img, 90, 640,80,80);
}

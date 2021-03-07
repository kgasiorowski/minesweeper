void drawGrid(int side){
  for(int i = 0; i <= side; i++){
    drawHorizontalLine(i * height/side);
  }
  for(int i = 0; i <= side; i++){
    drawVerticalLine(i * width/side);
  }
}

void drawVerticalLine(int x){
  line(x, 0, x, height);  
}

void drawHorizontalLine(int y){
  line(0, y, width, y);
}

void drawLetterAtCoordinates(char letter, int x, int y){
  text(letter, (x+0.5)*cellwidth, (y+0.5)*cellheight);
}

int[] convertMouseClickToGridCoordinates(int clickX, int clickY){
  int xCoordinate = int(clickX/(width/puzzleside));
  int yCoordinate = int(clickY/(height/puzzleside));
  int returnVal[] = {xCoordinate, yCoordinate};
  return returnVal;
}

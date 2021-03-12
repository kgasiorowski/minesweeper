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
  
    switch(letter){
    
        case 'B':
            fill(255, 0, 0);
        break;
        case '1':
            fill(0, 171, 26);
        break;
        case '2':
            fill(68, 171, 0);
        break;
        case '3':
            fill(136, 194, 0);
        break;
        case '4':
            fill(191, 194, 0);
        break;
        case '5':
            fill(194, 158, 0);
        break;
        case '6':
            fill(194, 120, 0);
        break;
        case '7':
            fill(194, 58, 0);
        break;
        default:
            fill(0);
        break;
      
    }
  
  text(letter, (x+0.5)*cellwidth, (y+0.5)*cellheight);
  fill(0);
}

int[] convertMouseClickToGridCoordinates(int clickX, int clickY){
  int xCoordinate = int(clickX/(width/puzzleside));
  int yCoordinate = int(clickY/(height/puzzleside));
  int returnVal[] = {xCoordinate, yCoordinate};
  return returnVal;
}

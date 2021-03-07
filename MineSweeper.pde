Minefield minefield;
MinefieldGUIData minefieldGUIdata;
final int puzzleside = 16;
int cellwidth;
int cellheight;
boolean gameOver = false;
int numBombs = 10;

void setup(){

  surface.setTitle("Minesweeper");
  size(480, 480);
  frameRate(60);
  cellwidth = width/puzzleside;
  cellheight = height/puzzleside;
  minefield = new Minefield(puzzleside, numBombs);
  minefieldGUIdata = new MinefieldGUIData(puzzleside);
  stroke(0);
  fill(0);
  textAlign(CENTER, CENTER);

}

void draw(){

  background(255);
  drawGrid(16);
  for(int i = 0; i < puzzleside; i++){
      for(int j = 0; j < puzzleside; j++){
        char symbol = minefieldGUIdata.getTileSymbol(i, j);
        drawLetterAtCoordinates(symbol, i, j);
      }
  }

}

void mouseClickedOnTile(int x, int y, ArrayList<Coordinates> visitedTiles){
    
    char tileSymbol = minefieldGUIdata.getTileSymbol(x, y);
    
    // Do nothing if the tile was originally flagged
    if(tileSymbol == 'F' || tileSymbol == ' ')
        return;
    
    boolean clickedTileWasBomb = minefield.getCellIsBomb(x, y);
    
    if(tileSymbol == '?'){
    
        if (clickedTileWasBomb){
            gameOver();
        }else{
            int numSurroundingBombs = minefield.getCellData(x, y);
            
            if(numSurroundingBombs == 0){
                // Recursively uncover tiles which do not have bombs
                if(visitedTiles == null){
                    visitedTiles = new ArrayList<Coordinates>();
                    visitedTiles.add(new Coordinates(x, y));
                }else{
                    visitedTiles.add(new Coordinates(x, y));
                }
                
                for(int i = -1; i < 2; i++){
                    for(int j = -1; j < 2; j++){
                    
                        try{
                            if(!minefield.getCellIsBomb(x+i, y+j) && !coordinateIsInList(x+i, y+j, visitedTiles)){
                                mouseClickedOnTile(x+i, y+j, visitedTiles);
                            }
                        }catch(ArrayIndexOutOfBoundsException e){
                            continue;
                        }
                    
                    }
                }
                
            }
            
        }
        revealTile(x, y);
        
    }else{
        // Do nothing if this is a recursive call
        if(visitedTiles != null)
            return;
        
        int numBombsSurroundingThisTile = int(minefieldGUIdata.getTileSymbol(x, y))-48;
        int numFlagsSurroundingThisTile = 0;
        
        for(int i = -1; i < 2; i++){
            for(int j = -1; j < 2; j++){
                if(i == 0 && j == 0)
                    continue;
                    
                char currentTileSymbol;
                try{
                    currentTileSymbol = minefieldGUIdata.getTileSymbol(x+i, y+j);
                }catch(ArrayIndexOutOfBoundsException e){
                    continue;
                }
                
                numFlagsSurroundingThisTile = currentTileSymbol == 'F' ? numFlagsSurroundingThisTile+1 : numFlagsSurroundingThisTile;
                    
            }
        }
    
        if(numFlagsSurroundingThisTile == numBombsSurroundingThisTile){
        
            for(int i = -1; i < 2; i++){
                for(int j = -1; j < 2; j++){
                    if(i == 0 && j == 0)
                        continue;
                        
                    try{
                        ArrayList list = new ArrayList();
                        list.add(new Coordinates(x, y));
                        mouseClickedOnTile(x+i, y+j, list);
                        //mouseClickedOnTile(x+i, y+j, null);
                    }catch(ArrayIndexOutOfBoundsException e){
                        continue;
                    }
                        
                }
            }
            
        }
    
    }
    
    if(gameOver)
        return;
    else
        checkForWinState();

}

void gameOver(){

    surface.setTitle("Game over :(");
    gameOver = true;
    revealEntireBoard();
    
}

boolean checkAllTilesUncovered(){

    for(int i = 0; i < minefieldGUIdata.getGridData().length; i++){
        for(int j = 0; j < minefieldGUIdata.getGridData().length; j++){
            if(minefieldGUIdata.getTileSymbol(i, j) == '?'){
                return false;
            }
        }
    }

    return true;

}

void checkForWinState(){

    if(checkAllTilesUncovered()){
        surface.setTitle("You win! :)");
        gameOver = true;
    }

}

void revealTile(int x, int y){
    char symbol;
    int tileData = minefield.getCellData(x,y);
    
    switch(tileData){
        case -1:
            symbol = 'B';
        break;
        case 0:
            symbol = ' ';
        break;
        default:
            symbol = char(tileData+48);
    }
    
    minefieldGUIdata.setTileSymbol(symbol, x, y);
}

void revealEntireBoard(){

    for(int i = 0; i < minefieldGUIdata.getGridData().length; i++){
        for(int j = 0; j < minefieldGUIdata.getGridData().length; j++){
            revealTile(i, j);
        }
    }
    
}

void flagTile(int x, int y){
    
    char tileSymbol = minefieldGUIdata.getTileSymbol(x, y);
    if(tileSymbol == '?')
        minefieldGUIdata.setTileSymbol('F', x, y);
    else if(tileSymbol == 'F')
        minefieldGUIdata.setTileSymbol('?', x, y);
        
    checkForWinState();    
    
}

void mousePressed(){
  
  if(gameOver)
      return;
    
  int[] coords = convertMouseClickToGridCoordinates(mouseX, mouseY);
  int gridX = coords[0];
  int gridY = coords[1];
 
  if(mouseButton == RIGHT){
      flagTile(gridX, gridY);
  }else if(mouseButton == LEFT){
      mouseClickedOnTile(gridX, gridY, null);
  }
 
}

class Minefield{

  private boolean[][] minefield;

  public Minefield(int side, int numMines){
    this.minefield = new boolean[side][side];
    generateMines(numMines);
  }

  public boolean getCoord(int x, int y){
    if(x < 0 || y < 0 || x >= this.minefield.length || y >= this.minefield.length){
      throw new IllegalArgumentException();
    }
    return this.minefield[x][y];
  }
  
  private boolean getCellIsBomb(int x, int y){
      return minefield[x][y];
  }
  
  private SurroundingCellData getSurroundingCells(int x, int y){
      if(x < 0 || y < 0 || x >= this.minefield.length || y>= this.minefield.length)
          throw new IllegalArgumentException();
      
      SurroundingCellData data = new SurroundingCellData();
      
      if(x == 0 && y == 0){
          //Top left corner
          data.right = minefield[x+1][y];
          data.bottomRight = minefield[x+1][y+1];
          data.bottom = minefield[x][y+1];
      }else if(x == this.minefield.length-1 && y == this.minefield.length-1){
          //Bottom right corner
          data.top = minefield[x][y-1];
          data.left = minefield[x-1][y];
          data.topLeft = minefield[x-1][y-1];
      }else if(x == this.minefield.length-1 && y == 0){
          //Top right corner
          data.bottom = minefield[x][y+1];
          data.bottomLeft = minefield[x-1][y+1];
          data.left = minefield[x-1][y];
      }else if(x == 0 && y == this.minefield.length-1){
          //Bottom left corner
          data.top = minefield[x][y-1];
          data.topRight = minefield[x+1][y-1];
          data.right = minefield[x+1][y];
      }else if(x == 0){
          //Left edge
          data.top = minefield[x][y-1];
          data.topRight = minefield[x+1][y-1];
          data.right = minefield[x+1][y];
          data.bottomRight = minefield[x+1][y+1];
          data.bottom = minefield[x][y+1];
      }else if(y == 0){
          //Top edge
          data.right = minefield[x+1][y];
          data.bottomRight = minefield[x+1][y+1];
          data.bottom = minefield[x][y+1];
          data.bottomLeft = minefield[x-1][y+1];
          data.left = minefield[x-1][y];
      }else if(y == this.minefield.length-1){
          //Bottom edge
          data.top = minefield[x][y-1];
          data.topRight = minefield[x+1][y-1];
          data.right = minefield[x+1][y];
          data.left = minefield[x-1][y];
          data.topLeft = minefield[x-1][y-1];
      }else if(x == this.minefield.length-1){
          //Right edge
          data.top = minefield[x][y-1];
          data.bottom = minefield[x][y+1];
          data.bottomLeft = minefield[x-1][y+1];
          data.left = minefield[x-1][y];
          data.topLeft = minefield[x-1][y-1];
      }else{
          //Not an edge
          data.top = minefield[x][y-1];
          data.topRight = minefield[x+1][y-1];
          data.right = minefield[x+1][y];
          data.bottomRight = minefield[x+1][y+1];
          data.bottom = minefield[x][y+1];
          data.bottomLeft = minefield[x-1][y+1];
          data.left = minefield[x-1][y];
          data.topLeft = minefield[x-1][y-1];
      }
      
      return data;
  }
  
  private void generateMines(int numMines){
    int sidelength = this.minefield.length;
    
    if(numMines > sidelength*sidelength){
      throw new IllegalArgumentException();
    }
    
    for(int i = 0; i < numMines; i++){  
      int randomX, randomY;
      
      do{
        randomX = int(random(0, sidelength));
        randomY = int(random(0, sidelength));
      }while(this.minefield[randomX][randomY] == true);
      
      this.minefield[randomX][randomY] = true;
    }
  }
}

class Minefield{

  private int[][] minefield;

  public Minefield(int side, int numMines){
    this.minefield = new int[side][side];
    generateMines(numMines);
    generateNumTiles();
  }

  public int getCellData(int x, int y){
    if(x < 0 || y < 0 || x >= this.minefield.length || y >= this.minefield.length){
      throw new IllegalArgumentException();
    }
    return this.minefield[x][y];
  }
  
  private void setCellIsBomb(int x, int y){
      minefield[x][y] = -1;
  }
  
  public boolean getCellIsBomb(int x, int y){
    return minefield[x][y] == -1;
  }
  
  private int getNumSurroundingBombs(int x, int y){
  
      int numBombs = 0;
      
      for(int i = -1; i < 2; i++){
          for(int j = -1; j < 2; j++){
              if(j == 0 && i == 0)
                  continue;
                  
              try{
                  numBombs = getCellIsBomb(x+i, y+j) ? numBombs+1 : numBombs;
              }catch(ArrayIndexOutOfBoundsException e){
                  continue;
              } 
          }
      }
      
      return numBombs;
      
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
      }while(getCellIsBomb(randomX, randomY));
      
      setCellIsBomb(randomX, randomY);
    }
  }

  private void generateNumTiles(){
  
      for(int i = 0; i < minefield.length;i++){
          for(int j = 0; j < minefield.length; j++){
              if(getCellIsBomb(i, j))
                  continue;
               minefield[i][j] = getNumSurroundingBombs(i, j);
          }
      }
  
  }

}

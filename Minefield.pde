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
  
  public boolean getCellIsBomb(int x, int y){
    return minefield[x][y];
  }
  
  public int getNumSurroundingBombs(int x, int y){
  
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
      }while(this.minefield[randomX][randomY] == true);
      
      this.minefield[randomX][randomY] = true;
    }
  }
}

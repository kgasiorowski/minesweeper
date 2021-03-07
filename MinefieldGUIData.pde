class MinefieldGUIData{

  private char[][] data;
  
  public MinefieldGUIData(int sidelength){
    this.data = new char[sidelength][sidelength];
    for(int i = 0; i < sidelength; i++){
      for(int j = 0; j < sidelength; j++){
        this.data[i][j] = '?';
      }
    }
  }
  
  public char[][] getGridData(){
    return this.data;
  }
  
  public char getTileSymbol(int x, int y){
      return this.data[x][y];
  }
  
  public void setTileSymbol(char symbol, int x, int y){
    this.data[x][y] = symbol;
  }
  
}

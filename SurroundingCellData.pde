class SurroundingCellData{

    public Boolean top = null;
    public Boolean bottom = null;
    public Boolean left = null;
    public Boolean right = null;
    public Boolean topRight = null;
    public Boolean topLeft = null;
    public Boolean bottomRight = null;
    public Boolean bottomLeft = null;
 
    public int getNumSurroundingBombs(){
    
        ArrayList<Boolean> surroundingTiles = new ArrayList();
        surroundingTiles.add(top);
        surroundingTiles.add(bottom);
        surroundingTiles.add(left);
        surroundingTiles.add(right);
        surroundingTiles.add(topRight);
        surroundingTiles.add(topLeft);
        surroundingTiles.add(bottomRight);
        surroundingTiles.add(bottomLeft);
    
        int numBombs = 0;
        for(Boolean b : surroundingTiles){
            if(b != null)
                numBombs = b?numBombs+1:numBombs;
        }
    
        return numBombs;
    }
    
}

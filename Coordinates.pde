class Coordinates{

    public int x;
    public int y;
    
    public Coordinates(int x, int y){
    
        this.x = x;
        this.y = y;
    
    }

    public boolean equals(Coordinates c){
    
        return this.x == c.x && this.y == c.y;
    
    }

}

boolean coordinateIsInList(int x, int y, ArrayList<Coordinates> coordinates){
    
    for(Coordinates c : coordinates){
        if(c.x == x && c.y == y){
            return true;
        }
    }
    return false;

}

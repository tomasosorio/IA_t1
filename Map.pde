class Map{
  // Represents the Environment
  int[][][] map;
  int dimx;
  int dimy;
  int dimt;
  
  // Constructor Method
  public Map(int mx, int my, int mt){
    
    this.map = new int[mx][my][mt];
    this.dimx = mx;
    this.dimy = my;
    this.dimt = mt;
  
    // Fill boundaries with -1
    for (int t=0; t < mt; t++){
      
      // Top and Bottom
      for (int i=0; i< mx; i++){ 
        this.map[i][0][t] = -1;
        this.map[i][my-1][t] = -1;
      }
      
      // Left and right
      for (int j=0; j< my; j++){ 
        this.map[0][j][t] = -1;
        this.map[mx-1][j][t] = -1;
      }  
    }
  }
  
  // Methods
  
  public void insertRobot(int x, int y, int t, int val){
    this.map[x][y][t] = val;  
  }
  
  
  // Print map on console
  public void printMap(int t){
    String resp = "";
    for (int i = 0; i < this.map.length; i++) {
      for (int j = 0; j < this.map[1].length; j++) {
        resp += (str(this.map[i][j][t]) + " ");
      }
      resp += "\n";
    }   
    print(resp);
  }
  
  // Draw map on screen
  public void drawMap(int t){
    stroke(1);
    int posValue, cx, cy;
    for(int i = 1; i < this.dimx - 1; i++){
      for(int j = 1; j < this.dimy - 1; j++){
        
        // Draw the Grid
        line(i*20,0,i*20,dimy*20);
        line(0,j*20,dimx*20,j*20);
        
        // Draw different objects in different ways
        posValue = this.map[i][j][t];
        if (posValue > 0) {          
           cx = ((j-1)*20)+10;
           cy = ((i-1)*20)+10;
           
           textSize(15);           
           
           fill(200);
           ellipse(cx,cy,15,15);
           
           fill(0,0,0);
           text(str(posValue),cx-5,cy+5);

        }
      }    
    }
  }
}
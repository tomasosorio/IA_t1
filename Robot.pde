import java.util.*;


class Robot{
  // Represents the Node
  
  // Class Variables
  int id;
  int px;
  int py;
  int time = 0;
  String status = "";
  Robot father = null;
  
  // Constructor Method
  public Robot(int idx, int x, int y, int t , String state, Robot dad, Map m){
    this.id = idx;
    this.px = x;
    this.py = y;
    this.time = t;
    this.status = state;
    this.father = dad;
    
    // New root node
    if (dad == null) m.map[x][y][t] = idx;
  }
  
  // Methods
  
  public void setState(String state){
    this.status = state;
  }
  
  public boolean isGoal(int goalx, int goaly){
    return ((this.px == goalx) && (this.py == goaly));   
  }
  
  // Transition Method
  public ArrayList<Robot> getNeighbours(int[][][] map){
    
    ArrayList<Robot> neighbours = new ArrayList();
    
    // ((NextPos Empty on T+1) and (NextPos Empty Now)) or ((NextPos Empty on T+1) and (CurrPos Empty Now))
    
    // Right
    if (map[px+1][py][this.time+1] == 0 && ((map[px+1][py][this.time] == 0) || (map[px][py][this.time+1] == 0) )) {
      neighbours.add(new Robot(this.id,this.px+1,this.py,this.time+1,this.status,this,null)); 
    }
    // Down
    if (map[px][py+1][this.time+1] == 0 && ((map[px][py+1][this.time] == 0) || (map[px][py][this.time+1] == 0))){
      neighbours.add(new Robot(this.id,this.px,this.py+1,this.time+1,this.status,this,null)); 
    }
    // Left
    if (map[px-1][py][this.time+1] == 0 && ((map[px-1][py][this.time] == 0) || (map[px][py][this.time+1] == 0))) {
      neighbours.add(new Robot(this.id,this.px-1,this.py,this.time+1,this.status,this,null)); 
    }
    // Up
    if (map[px][py-1][this.time+1] == 0 && ((map[px][py-1][this.time] == 0) || (map[px][py][this.time+1] == 0) )) {
      neighbours.add(new Robot(this.id,this.px,this.py-1,this.time+1,this.status,this,null)); 
    }
    
    return neighbours;
  }
  
  public void insertPath(int[][][] map, int goalx, int goaly){
    
    Robot current = searchPath(map,goalx,goaly);
    
    // Not yet method caller or root node
    while (current.father != null){
      // Update the map with the position the robot will be in by this time, marked by its id
      map[current.px][current.py][current.time] = current.id;
      // Climb up the tree
      current = current.father;
    } 
  }
  
  // Map NxN -> N for positive numbers
  public int hash(int x, int y){
    return int(0.5*(x+y)*(x+y+1)+y);
  }
  
  // BFS - search for the best path
  public Robot searchPath(int[][][] map, int goalx, int goaly){
    
    // To keep positions already visited
    ArrayList<Integer> explored = new ArrayList<Integer>();
    // To keep nodes to visit
    Queue<Robot> queue = new LinkedList();
    
    explored.add(hash(this.px,this.py));
    queue.add(this);
    Robot current = null;
    
    // There is still nodes to search, solution not yet found
    while(!queue.isEmpty()){
      
      // Explore the node
      current = queue.remove();
      
      // Goal check
      if (current.isGoal(goalx, goaly)) return current;
      
      // Goal not yet achieved, search for neighbours
      else{
        ArrayList<Robot> neighbours = current.getNeighbours(map);
        for (int r = 0; r < neighbours.size(); r++){
          Robot neighbour = neighbours.get(r);
          int nextPos = hash(neighbour.px,neighbour.py);
          if (!explored.contains(nextPos)){
            explored.add(nextPos);
            queue.add(neighbour);
          }          
        }
      }
    }
    return null;
  }
}
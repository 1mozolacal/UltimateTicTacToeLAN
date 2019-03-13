public static final int BOARD_SIZE = 3;

class GameBoard{
 int cells[][] = new int[BOARD_SIZE][BOARD_SIZE];//[row][colum]
 boolean displayable = false;
 PVector location;
 int winner = 0;//zero is empty/no one
 
 GameBoard(){
   for(int i =0; i < BOARD_SIZE; i++){
     for(int j =0; j < BOARD_SIZE; j++){
       cells[i][j] = 0;
     }
   }
 }
 
 GameBoard(PVector loc){
   this();
   location = loc;
 }
 
 boolean freeSpot(int row,int colum){
   if( row>-1 && row<BOARD_SIZE && colum>-1 && colum<BOARD_SIZE){
     if(cells[row][colum] == 0){
       return true;
     }
   }
  return false; 
 }
 
void makeMove(int player, int row, int colum){
  cells[row][colum] = player;
}
 
 //NOTE THE CHECK ONLY REALLY WORKS FOR 3 (I AM NOT SURE HOW SCORING SHOULD BE DONE ON LARGER GRIDS - IS IT STILL 3 OR IS IT THE LENGTH OF THE BOARD)
 boolean isWon(int[] players){
  for(int i = 0; i< players.length; i++){
    
    boolean broken = false;
    //check rows
    for(int r = 0; r<BOARD_SIZE; r++){
      broken = false;
      for(int c = 0; c<BOARD_SIZE;c++){
         if(cells[r][c] != players[i]){
           broken = true;
           break;
         }
      }
      if(!broken){
        setWinner(players[i]);
       return true; 
      }
    }
    //check colums
    for(int c = 0; c<BOARD_SIZE; c++){
      broken = false;
      for(int r = 0; r<BOARD_SIZE;r++){
         if(cells[r][c] != players[i]){
           broken = true;
           break;
         }
      }
      if(!broken){
        setWinner(players[i]);
       return true; 
      }
    }
    //check diaganals
    //change this later
    if(cells[0][0] == players[i] && cells[1][1] == players[i] && cells[2][2] == players[i] ){
      setWinner(players[i]);
      return true;
    }
    if(cells[0][2] == players[i] && cells[1][1] == players[i] && cells[2][0] == players[i] ){
      setWinner(players[i]);
      return true;
    }
    
  }//end of for loop for players
  
  return false;
    
 }
 
 void setWinner(int player){
   if(winner == 0 ){
      winner = player; 
   }
 }
 
 int getWinner(){
   return winner;
 }
 
 void display(float x,float y,float wid,float hei,boolean selected){
   rectMode(CENTER);
   noStroke();
   if(!selected){
    wid *= 0.75;
    hei *= 0.75;
   }
   
   float round = 20;
   
   fill(50);//gray
   rect(x,y,wid,hei, round);
   float smallUnitWid = wid/((float)BOARD_SIZE);
   float smallUnitHei = hei/((float)BOARD_SIZE);
   for(int i = 0; i < BOARD_SIZE*BOARD_SIZE; i++){
     int smallX = i%BOARD_SIZE;
     int smallY = i/BOARD_SIZE;
     if(cells[smallX][smallY] == 0){
       fill(200);
     }else if(cells[smallX][smallY] == 1){
       fill(0,0,255);
     }else if(cells[smallX][smallY] == 2){
       fill(255,0,0);
     }
     float cornerX = x - wid/2.0;
     float cornerY = y - hei/2.0;
     rect(cornerX + smallUnitWid*smallX + smallUnitWid/2 ,cornerY + smallUnitHei*smallY + smallUnitHei/2, 0.8 * smallUnitWid , 0.8 * smallUnitHei , round);
   }
   if(!selected){
     fill(150,200);// tint gray
     rect(x,y,wid,hei,round);
   }
   
 }
 
 
 
 
}
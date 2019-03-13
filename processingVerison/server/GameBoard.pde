public static final int BOARD_SIZE = 3;

class GameBoard{
 int cells[][] = new int[BOARD_SIZE][BOARD_SIZE];//[row][colum]
 boolean displayable = false;
 PVector location;
 
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
  return false; 
 }
 
void makeMove(int player, int row, int colum){
  
}
 
 boolean isWon(){
  return false; 
 }
 
 int getWinner(){
   return 0;
 }
 
 void display(float x,float y,float wid,float hei,boolean selected){
   
 }
 
 
}
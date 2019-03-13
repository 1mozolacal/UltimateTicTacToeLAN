//Ultimate tic tac toe
import processing.net.*;

int port = 4992;
Server server;

//Game varibles
boolean myTurn = true;
GameBoard[][] miniBoards = new GameBoard[BOARD_SIZE][BOARD_SIZE];
GameBoard largeBoard = new GameBoard();

void setup(){
  
  for(int i = 0; i<BOARD_SIZE*BOARD_SIZE;i++){
    miniBoards[i%3][i/3] = new GameBoard();
  }
  fullScreen(2);
  server = new Server(this, port);
}

void draw(){
  background(0,250,50);
  
  boolean switcher = true;
  for(int i =0; i < BOARD_SIZE*BOARD_SIZE; i++){
    miniBoards[i%3][i/3].display(width/3*(i%3) +  width/6, (i/3)*height/3 + height/6, 0.9*width/3, 0.9*height/3, switcher );
    switcher = !switcher;
    miniBoards[i%3][i/3].makeMove(2,2,2);
    miniBoards[i%3][i/3].makeMove(1,2,1);
  }
  
  //check the client
  Client client = server.available();
  if(client !=null){
    turnReceived( client.readString() );
  }
  
}

void turnReceived(String msg){
  String[] parts = msg.split(" ");
  if(!(parts.length>1)){
    println("ERROR: zero len parts");
    return;
  }
  if(parts[0].equals("move")){
    int rowB = Integer.parseInt(parts[1]);
    int colB = Integer.parseInt(parts[2]);
    int row = Integer.parseInt(parts[3]);
    int col = Integer.parseInt(parts[4]);
    takeATurn(2,rowB,colB,row,col);
  }
  
}

void sendClientMove(int boardRow, int boardCol, int row, int col){
  server.write("move " +boardRow+ " " +boardCol+ " " +row+ " " +col);
}

//player 1 = host, 2 = client
//boardRow is the row of which board
//boardCol is hte colum of which board
//row is the row in the board
//col is the colum in the board
void takeATurn(int player, int boardRow, int boardCol, int row, int col){
  if(miniBoards[boardRow][boardCol].freeSpot(row,col) ){
      miniBoards[boardRow][boardCol].makeMove(player,row,col);
      myTurn = !myTurn;//CHANGE IF WHAT TO ADD MORE PLAYERS
  }
  
}


//called when client connects
void serverEvent(Server server, Client client){
  println("Client at:" + client.ip() );
  server.write("start " + !myTurn);//tells client how starts (CHANGE IF MORE PLAYRES ADDED)
}
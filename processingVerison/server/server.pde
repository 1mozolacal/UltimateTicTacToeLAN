//Ultimate tic tac toe
import processing.net.*;

int port = 4992;

Server server;

void setup(){
  
  server = new Server(this, port);
}

void draw(){
  
  Client client = server.available();
  if(client !=null){
    String msg = client.readString();
  }
  
}

void turnReceived(){
  
}
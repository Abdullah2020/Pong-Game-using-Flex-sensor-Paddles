import processing.net.*;

Server myServer;
int action = 0;

void setup(){
   myServer = new Server(this, 5204);     //Enter your port number eg. 5204
   
}

void draw(){
  myServer.write(action);
  background(0);
  textSize(30);
  text(action, 0, 30);
  //delay(1000);
}

void keyPressed(){
  switch(keyCode){
    case 'E':
      action = 1;
      break;
    case 'D':
      action = 2;
      break;
  }
  
}

void keyReleased(){
  action = 0;
}

void stop(){
  myServer.stop();
}

import processing.net.*;
import processing.serial.*;

Serial serialPort;

Server myServer;
int action = 0;

void setup(){
   myServer = new Server(this, 5204);         //Enter port number eg. 5204
   printArray(Serial.list());
   serialPort = new Serial(this, Serial.list()[0], 9600);
   serialPort.bufferUntil ( '\n' ); 
}

void draw(){
  //myServer.write(action);
  background(0);
  textSize(30);
  text(action, 0, 30);
  //delay(1000); 
}

void serialEvent(Serial serialPort){
  float actionSer = float(serialPort.readStringUntil('\n'));
  //println(int(actionSer));
  if(actionSer == 0){
    //println("0");
     myServer.write(0);
  }if(actionSer == 1){
     myServer.write(1);
  }if(actionSer == 2){
     myServer.write(2);
  }
  action = int(actionSer);
  //println(actionSer);
  
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

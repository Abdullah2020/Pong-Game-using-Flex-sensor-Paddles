//paddle can hit ball
//add text and score

int LrectY = 350;      //initial Left paddle position
int RrectY = 350;      //initial Right paddle position

float ellX = width / 2;     //initial ellipse position in the middle on the X-axis
float ellY = height / 2;     //initial ellipse position in the middle on the Y-axis

boolean moveRight = true;     //this means moving left is false
boolean moveDown = true;      //this means moving up is false

float speedSide = 3;    //speed in X direction, higher value is graeater speed
float speedVertical = 4;    //speed in Y direction

int countR = 0;     //score for right side
int countL = 0;     //score for left side

PFont font;       //font used for the score
 
boolean TweetSent = false;
int i;

import processing.net.*;
import gohai.simpletweet.*;
SimpleTweet simpletweet;

Client myClient;


void setup() {
  
  size (700, 700);         //size of the screen
  background(0);          //background color is set to black
  simpletweet = new SimpleTweet(this);
 
  simpletweet.setOAuthConsumerKey("*************************");                                       //Enter your API key
  simpletweet.setOAuthConsumerSecret("**************************************************");           //Enter your API secret key
  simpletweet.setOAuthAccessToken("**************************************************");             //Enter your API Access token key
  simpletweet.setOAuthAccessTokenSecret("*********************************************");            ////Enter your API Access token secret key

  
  myClient = new Client(this, "192.168.**.**", 1234);         //Enter IP address of player 1 and unique port number
}
void reset(){ 
  countR = 0;
  countL = 0;
  TweetSent = false;
}

void draw(){
  
  background(0);
  
  
  if (keyPressed == true && key == 'w') {
  myClient.write(1);
  }
  if (keyPressed == true && key == 's') {
  myClient.write(2);
  }

}

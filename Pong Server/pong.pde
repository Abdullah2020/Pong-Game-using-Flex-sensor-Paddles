import processing.net.*;
import gohai.simpletweet.*;
SimpleTweet simpletweet;


Ball ball;
Paddle rq1;
Paddle rq2;

Client user1;
Client user2;

int scoreleft  = 0;
int scoreright = 0;
boolean TweetSent = false;



void setup(){
  size(800,600); // taille de la fenetre
  ball = new Ball(width/2, height/2); // creation de la balle
  // creation des raquettes
  rq1 = new Paddle(10, height/2);
  rq2 = new Paddle(width-10, height/2);
  
  simpletweet = new SimpleTweet(this);

  simpletweet.setOAuthConsumerKey("*************************");                                       //Enter your API key
  simpletweet.setOAuthConsumerSecret("**************************************************");           //Enter your API secret key
  simpletweet.setOAuthAccessToken("**************************************************");             //Enter your API Access token key
  simpletweet.setOAuthAccessTokenSecret("*********************************************");            ////Enter your API Access token secret key

  
  ball.speedx = -5;
  ball.speedy = 0;
  
   user1 = new Client(this, "192.168.57.74", 5204);           //Enter IP Address of player 1 and port number
   user2 = new Client(this, "127.0.0.1", 5205);               //Enter IP Address of player 2 and port number
}

void draw(){
  background(0);
  //println(monserv.read());
  if (user1.available() > 0) { 
    int dataIn = user1.read();
    if(dataIn == 0){
      rq1.speedy = 0;
    }
    if(dataIn == 1){
      rq1.speedy = -5;
    }
    if(dataIn == 2){
      rq1.speedy = 5;
    }
  } 
   if (user2.available() > 0) { 
    int dataIn = user2.read();
    if(dataIn == 0){
      rq2.speedy = 0;
    }
    if(dataIn == 1){
      rq2.speedy = -5;
    }
    if(dataIn == 2){
      rq2.speedy = 5;
    }
  } 
  ball.display(); // affichage de la balle
  rq1.display(); // affichage des raquettes
  rq2.display();
  
  ball.movingStep(); // déplacement de la balle
  rq1.movingStep(); // déplacement des raquettes
  rq2.movingStep();

  // conditions louper la balle
  if(ball.x + 50/2 > width){
    ball.x = width/2;
    ball.y = height/2;
    scoreleft = scoreleft + 1;
  }
  if(ball.x - 50/2 < 0){
    ball.x = width/2;
    ball.y = height/2;
    scoreright = scoreright +1 ;
  }
  
  // rebond sur les bords
  if(ball.y + 50/2 > height || ball.y - 50/2 < 0){
    ball.speedy = -ball.speedy;
  }
  
  // rebond sur raquette gauche
  if(ball.y < rq1.y + rq1.h/2){//bottom paddle
    if(ball.y > rq1.y - rq1.h/2){//top paddle
      if(ball.x-50/2 < rq1.x+rq1.w/2){
        // chgmt de direction
        ball.speedx = -ball.speedx;
        // calcul de l'angle
        ball.speedy = map(ball.y - rq1.y, -rq1.h/2, rq1.h/2, -15, 15);
      }
    }
  }
  
  // rebond sur raquette droite
  if(ball.y < rq2.y + rq2.h/2){
    if(ball.y > rq2.y - rq2.h/2){
      if(ball.x+50/2 > rq2.x-rq2.w/2){
        ball.speedx = - ball.speedx;
        ball.speedy = map(ball.y - rq2.y, -rq2.h/2, rq2.h/2, -15, 15);
      }
    }
  }
  
  // affichage des scores
  textSize(30);
  text(scoreright, width-50, 30);
  text(scoreleft, 30, 30);
  
  //boutton tweeter
  fill(75);
  rect(width/2-40, 10, 80, 30);
  fill(0, 408, 612);
  text("Tweet", width/2-40,35,30);


if (scoreleft == 10 & TweetSent == false)
{
String tweet = simpletweet.tweet(" Team 1 won against Team 2   " + scoreleft+ ":" +""+scoreright + " Completion time : " + minute()+":"+ second());
println("Posted " + tweet);
TweetSent = true;
text("Team 1 won against Team 2 " + ""+ scoreleft +":" +""+scoreright,360,350);



reset();
}
if (scoreright == 10 & TweetSent == false){
String tweet = simpletweet.tweet(" Team 2 won against Team 1   " + ""+ scoreright +":" +""+scoreleft + " Completion time : " + minute()+":"+ second());
println("Posted " + tweet);
TweetSent = true;
text("Team 2 won against Team 1 " + ""+ scoreright +":" +""+scoreright,360,350);



reset();
}
}

void reset(){
scoreright = 0;
scoreleft = 0;
TweetSent = false;
}

void keyPressed(){
  switch(keyCode){
    case DOWN:
      rq1.speedy = 5;
      break;
    case UP:
      rq1.speedy = -5;
      break;
    case 'Q':
      rq2.speedy = 5;
      break;
    case 'A':
      rq2.speedy = -5;
      break;
  }
  
}

void keyReleased(){
  switch(keyCode){
    case DOWN:
      rq1.speedy = 0;
      break;
    case UP:
      rq1.speedy = 0;
      break;
    case 'Q':
      rq2.speedy = 0;
      break;
    case 'A':
      rq2.speedy = 0;
      break;
  }
}

void mousePressed(){
  if(mouseX > width/2-50 && mouseX < width/2+50 && mouseY > 10 && mouseY <30){
    link("https://twitter.com/intent/tweet?text=Je%20joue%20%C3%A0%20pong.%20Le%20score%20est%20de%20"+scoreleft+"%20-%20" + scoreright);
  }
}

void stop(){
  user1.stop();
  user2.stop();
}

// la balle
class Ball{
  float x, y;
  float speedx, speedy;
  
  Ball(float startx, float starty){
    x = startx;
    y = starty;
    speedx = 0;
    speedy = 0;
  }
  
  void display(){
    fill(255); // blanc
    circle(x, y, 50);
  }
  
  void movingStep(){
     x = x + speedx;
     y = y + speedy;
  }
}

// la raquette
class Paddle{
  float x, y;
  float speedy;
  float w = 10;
  float h = 220;
  
  Paddle(float startx, float starty){
    x = startx;
    y = starty;
    speedy = 0;
  }
  
  void display(){
    // affichage de la raquette
    fill(255);
    rect(x-w/2, y-h/2, w, h);
  }
  
  void movingStep(){
    //on ne va pas dans les murs
    if(y+speedy-h/2 > 0 && y+speedy-h/2 < height-h){
       // déplacement de la raquette
       y = y + speedy;
    }
  }


}

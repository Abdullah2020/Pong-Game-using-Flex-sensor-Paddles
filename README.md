# Pong-Game-using-Flex-sensor-Paddles
This is my Electronic of Object for Internet of Things (IoT) project. The project focuses mainly on the design for both software and hardware interaction framework of Pong Game using Flex-sensor Paddles. The project Integrated Server/Client Interaction and Twitter API.

Contributors: 

- Abdullahi Isa AHMED 
- Arthur Wilhelm Strømme KRISTIANSEN
- Mike GBADAMASSI

Components

The hardware and software components used for the implementation of the project are described below.

  1-	Tiva LaunchPad: Used to link the software and hardware parts, specifically to take the output values of the circuit to read them with the code
  
  2-	USB cable: To connect Tiva to the computer
  
  3-	Breadboard: Needed as support for electronic component assembly
  
  4-	Jumper wires: To attach principal components to each other
  
  5-	Resistor: Applies resistance to the current (56KΩ)
  
  6-	Flex Sensor: Main component of the project which changes the output values according to the bent.
  
  7-	Energia Software: open-source electronics prototyping platform aimed at bringing wiring and Arduino framework.
  
  8-	Processing Software: Free integrated development environment built for electronics arts and visual design. It is based on the Java language but with a lot of simplifications which makes it more useful to do simple tasks.


Voltage Divider circuit connected to flex sensor

![image](https://user-images.githubusercontent.com/16369782/181631815-8765f979-ae62-4150-9431-aaf6bf3bf47a.png)


Pong Game interface built with processing

![image](https://user-images.githubusercontent.com/16369782/181632373-184f3a2a-195f-457c-9e6d-7c5a90a67820.png)


Server/Client Integration

The integration of the Client/Server communication was thoroughly tested and thus, figure below shows a successful game session from two different PCs, one acting as the client and the other acting as server were used to communicate via a local hotpot configuration and the result was automatically tweeted in our twitter platform every 10 successful scores by either of the players.

![image](https://user-images.githubusercontent.com/16369782/181632107-c5ec16aa-1325-4a71-a1ad-0fc1623182d4.png)


Conclusion 

At the end of this project, we got a functional Ping Pong Game which multiplayer mode that was available between two distant computers. Both players have his own screen and flex sensor (used as a controller) to play against each other. The most difficult part about this whole game was not the game himself but the integration of the flex sensor as a controller. We had the basic software and hardware understanding to create the game, but some materials were not working as expected which slow down the process. We added all requires functionality such as Twitter communication (being able to send a tweet) and tried a lot of network connection to see which one is more adapted for us. This project was interesting to develop as a team and allowed us to apply the knowledge gained into reality.



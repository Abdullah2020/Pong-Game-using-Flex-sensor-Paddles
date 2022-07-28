int flex = 0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly: 
  flex = analogRead(PE_3);
  //Serial.println(flex);
  if(flex > 3000){
    Serial.println(2);
  }else if(flex <2500){
    Serial.println(1);
  }else{
    Serial.println(0);
  }
  delay(50);
}

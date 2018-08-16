int yellowLED = 11;
int redLED = 12;
int greenLED = 13;

void setup()
{
  pinMode(yellowLED,OUTPUT);
  pinMode(redLED,OUTPUT);
  pinMode(greenLED,OUTPUT);
}

void loop()
{
  digitalWrite(yellowLED,HIGH);
  delay(1000);
  digitalWrite(redLED,HIGH);
  delay(1000);
  digitalWrite(greenLED,HIGH);
  delay(1000);
}
